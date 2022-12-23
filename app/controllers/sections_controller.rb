class SectionsController < ApplicationController

  before_action :confirm_logged_in
  before_action :find_page

  def index
    @sections = @page.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:page_id => @page.id)
    @page = @page.subject.pages.sorted
    @section_count = Section.count + 1
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:sucess] = 'Section Created Successfully'
      redirect_to(:action => 'index', :page_id => @page.id)
    else
      @page = @page.subject.pages.sorted
      @section_count = Section.count 
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @page = @page.subject.pages.sorted
    @section_count = Section.count 
  end

  def update
    @section = Section.find(params[:id])
    if @section.update(section_params)
      flash[:sucess] = 'Section Updated Successfully'
      redirect_to(:action => 'index', :page_id => @page.id)
    else
        @page = @page.subject.pages.sorted
        @section_count = Section.count
        render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:sucess] = 'Section Deleted Successfully'
    redirect_to(:action => 'index', :page_id => @page.id)
  end
  private

  def section_params
    params.require(:section).permit(:name, :position, :page_id, :content, :content_type, :visible)
  end

  def find_page
    if params[:page_id]
      @page = Page.find(params[:page_id])
    end
  end
end
