# I think we only need delete, new and create

class TeacherSkillsController < ApplicationController
  before_action :set_teacher_skill, only: [:show, :edit, :update]
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
    @new_skill = TeacherSkill.new
    @teacher = Teacher.find(params[:teacher_id])
  end

  def create
    @teacher_skill = TeacherSkill.new(teacher_skill_params)
    @teacher = Teacher.find(params[:teacher_id])
    authorize @teacher
    @teacher_skill.teacher = @teacher

    if @teacher_skill.save
      redirect_to teacher_path(@teacher), notice: 'Skill succesfully created'
    else
      @teacher_skills = TeacherSkill.where(teacher_id: @teacher.id)
      @new_skill = @teacher_skill
      puts "Skill could not be created"
      render "teachers/show" ### render teacher's new
    end
  end


  def destroy
    @teacher = Teacher.find(params[:teacher_id])
    # dont know why, but it is the way it is
    @teacher_skill = TeacherSkill.find(params[:id])
    authorize @teacher_skill
    @teacher_skill.destroy
    redirect_to teacher_path(@teacher)
  end

  private

  def set_teacher_skill
    @teacher_skill = TeacherSkill.find(params[:id])
  end

  def teacher_skill_params
    params.require(:teacher_skill).permit(:level, :skill_id, :teacher_id, :teacher_skill_id)
  end

end
