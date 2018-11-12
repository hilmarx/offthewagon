class BookingsController < ApplicationController

  def index
    @user_bookings = current_user.bookings
    @teacher_bookings = current_user.teacher.try(:bookings)
    # @user_bookings = policy_scope(User)
    @teacher_booking = policy_scope(Teacher)
  end

  def show
    @booking = Booking.find(params[:id])
    @teacher = params[:teacher_id]
    authorize @booking
  end

  def new
   @teacher = Teacher.find(params[:teacher_id])
   @booking = Booking.new
   authorize @booking
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    booking.update(booking_time_params)
  end

  def create
    @user = current_user
    @teacher = Teacher.find(params[:teacher_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.teacher_id = @teacher.id
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:teacher_id, :start_time, :end_time, :total_price, :status)
  end

  def booking_time_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end


#controller, routes, added routing buttons to teacher for new booking, teacher index/user index of bookings

