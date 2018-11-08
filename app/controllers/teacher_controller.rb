class TeacherController < ApplicationController
  before_action :set_teacher, only: [:show, :update, :edit]
  # def profile
  # end

  def new #done
    @teacher = Teacher.new
  end

  def create
    teacher = Teacher.new(teacher_params)
    teacher.save
    redirect_to teacher_path(teacher)
  end

  def index
    @teacher = Teacher.all
  end

  def show
    # set_teacher
  end


  def edit #done
    #set_teacher
  end

  def update
    # set_teacher
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
