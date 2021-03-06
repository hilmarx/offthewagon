class Booking < ApplicationRecord
  belongs_to :teacher
  belongs_to :user
  after_initialize :init

  validates :status, presence: true

  def init
    self.status ||= "Pending"
  end

  def completed!
    update_attribute :status, "complete"
  end

  def approved!
    update_attribute :status, "approved"
  end

  def cancelled!
    update_attribute :status, "cancelled"
  end
end



# removed option from user or teacher depending on who cancels
