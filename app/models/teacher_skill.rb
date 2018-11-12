class TeacherSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :teacher
  validates :skill_id, uniqueness: true
  # after_initialize :set_name


  # def set_name
  #   @skill =
  # end

  # Elastic Search
  # searchkick
end
