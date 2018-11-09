class Teacher < ApplicationRecord
  belongs_to :user
  has_many :teacher_skills
  has_many :skills, through: :teacher_skills
  has_many :bookings

  def top_skill
    self.teacher_skills.order(level: :desc).first
  end
end
