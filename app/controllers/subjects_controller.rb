class SubjectsController < ApplicationController
      include ActiveStorage::SetCurrent

  def index
    if params[:search].present?
      @subjects = Subject.where('name LIKE ?', "%#{params[:search]}%")
    else
    @subjects = Subject.sorted
    end
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
    @subject_count = Subject.count + 1
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:success] = 'Subject added successfully'
      redirect_to(:action => 'index')
    else
      @subject_count = Subject.count + 1
      render 'new'
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update(subject_params)
      flash[:success] = 'Subject Updated Successfully'
      redirect_to(:action => 'index', :id => @subject.id)
    else
      @subject_count = Subject.count
      render 'edit'
    end
  end

 def delete
  @subject = Subject.find(params[:id])
 end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:success] = 'Subject ' + subject.name + ' Deleted Successfully'
    redirect_to(:action => 'index')
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :position, :visible, :image)
  end

end
