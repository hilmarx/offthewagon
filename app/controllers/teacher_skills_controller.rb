# I think we only need delete, new and create

class TeacherSkillsController < ApplicationController
  before_action :set_teacher_skill, only: [:show, :edit, :update, :destroy]

  # def index
  #   @teacher_skills = TeacherSkill.all
  # end

  # def show
  # end

  # def edit
  # end

  # def update
  #   @teacher = Teacher.find(params[:teacher_id])
  #   if @teacher_skill.update(teacher_skill_params)
  #     redirect_to teacher_path(@teacher)
  #   else
  #     render :new
  #   end
  # end

  def new
    @teacher_skill = TeacherSkill.new
  end

  def create
    @teacher_skill = TeacherSkill.new(teacher_skill_params)
    @teacher = Teacher.find(params[:teacher_id])
    if @teacher_skill.save
      redirect_to teacher_path(@teacher)
    else
      render :new
    end
  end


  def destroy
    @teacher = Teacher.find(params[:teacher_id])
    @teacher_skill.destroy
    redirect_to teacher_path(@teacher)
  end

  private

  def set_teacher_skill
    @teacher_skill = TeacherSkill.find(params[:id])
  end

  def teacher_skill_params
    params.require(:teacher_skill).permit(:level, :skill_id, :teacher_id)
  end

end
