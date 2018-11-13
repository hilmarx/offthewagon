class Teacher < ApplicationRecord
  before_save :full_name
  belongs_to :user
  has_many :teacher_skills, dependent: :destroy
  has_many :skills, through: :teacher_skills
  has_many :bookings, dependent: :destroy
  validates :user_id, uniqueness: true

  mount_uploader :photo, PhotoUploader

  # Pg Search Start
  # Search by Teacher.user name and skill category
  include PgSearch
  pg_search_scope :pg_search,
    against: [ :full_name],
    associated_against: {
      teacher_skills: [:name]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  # Pg Search End


  def top_skill
    self.teacher_skills.order(level: :desc).first
  end

  def full_name
    self.full_name = "#{self.user.first_name} #{self.user.last_name}"
  end
end
