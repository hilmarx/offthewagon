class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @teachers = Teacher.all
    @skills = Skill.all
  end

  def profile
  end
end
