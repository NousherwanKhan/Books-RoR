class PublicsController < ApplicationController

  layout 'public'
  before_action :add_navigation

  def index

  end

  def show
    @page = Page.where(:permalink => params[:permalink], :visible => true).first
    if @page.nil?
      redirect_to(:action => 'index')
    else
      
    end
  end

  private
  def add_navigation
    @subjects = Subject.visible.sorted
  end

end
