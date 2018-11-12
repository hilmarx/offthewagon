class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :update, :edit]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # works
  def new
    @teacher = Teacher.new
  end

  # works
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

  # works
  def index
    @teachers = Teacher.all
    @teacher_skills = TeacherSkill.all
    @selected_teachers = []
  end

  # works
  def show
    # set_teacher
    @teacher_skills = TeacherSkill.where(teacher_id: @teacher.id)
    @new_skill = TeacherSkill.new
    @skills = Skill.all
  end

  # works
  def edit
    # set_teacher
  end

  # works
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
  params.require(:teacher).permit(:user_id, :average_rating, :hourly_price, :available_from, :available_to)
end
