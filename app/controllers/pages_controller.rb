class PagesController < ApplicationController

  before_action :confirm_logged_in
  before_action :find_subject


  def index
    @pages = @subject.pages.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(:subject_id => @subject.id)
    @page_count = Page.count + 1
  end

  def create
    @page = Page.new(pages_params)
    if @page.save
      flash[:success] = 'Page Created successfully'
      redirect_to(:action => 'index', :subject_id => @subject.id)
    else
      @page_count = Page.count + 1
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
    @page_count = Page.count
  end

  def update
    @page = Page.find(params[:id])
    if @page.update(pages_params)
      flash[:success] = 'Page Updated Successfully'
      redirect_to(:action => 'index', :subject_id => @subject.id)
      else
        @page_count = Page.count
        render('edit')
      end
    end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id]).destroy
    flash[:success] = "Page Deleted Successfully"
    redirect_to(:action => 'index', :subject_id => @subject.id)
  end

  private

  def pages_params
    params.require(:page).permit(:name, :position, :visible, :subject_id, :permalink)
  end

  def find_subject
    if params[:subject_id]
      @subject = Subject.find(params[:subject_id])
    end
  end
end
