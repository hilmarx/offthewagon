class TeacherSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :teacher
end
