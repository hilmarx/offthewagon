class TeacherSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :teacher

  # Elastic Search
  # searchkick
end
