class TeacherSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :teacher
  before_save :set_name

  def set_name
    self.name = self.skill.name
  end

end
