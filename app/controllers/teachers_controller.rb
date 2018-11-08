class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :update, :edit]

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.user = current_user
    if @teacher.save
      redirect_to teacher_path(@teacher), notice: 'Profile succesfully created'
    else
      puts "This teacher didn't save"
      render :new
    end
  end

  def index
    @teacher = Teacher.all
  end

  def show
    # set_teacher
  end


  def edit
    #set_teacher
  end

  def update
    # set_teacher
    if @teacher.update(teacher_params)
      redirect_to teacher_path(@teacher), notice: 'Profile successfully updated'
    else
      render :edit
    end
  end
end

private

def set_teacher
  @teacher = Teacher.find(params[:id])
end

def teacher_params
  # If any errors are encountered, it might be due to ':id' below
  params.require(:teacher).permit(:id, :average_rating, :hourly_price, :available_from, :availble_to)
end
