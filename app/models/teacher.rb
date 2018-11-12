class Teacher < ApplicationRecord
  belongs_to :user
  has_many :teacher_skills
  has_many :skills, through: :teacher_skills
  has_many :bookings

  # Pg Search Start
  include PgSearch
  pg_search_scope :search_by_teacher_user_name,
    against: [ :title, :syllabus ],
    associated_against: {
      director: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }
  # Pg Search End

  def top_skill
    self.teacher_skills.order(level: :desc).first
  end
end
