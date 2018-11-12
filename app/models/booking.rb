class Booking < ApplicationRecord
  belongs_to :teacher
  belongs_to :user
  # before_save :no_self_booking


  # def no_self_booking
  #   self.user_id != Teacher.find(teacher_id).user_id
  # end

end
