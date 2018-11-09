class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @teachers = Teacher.all
    @skills = Skill.all
    @bookings = Booking.all
  end

  def profile
  end

  def show
    @bookings = Booking.find(params[:id])
  end

end
