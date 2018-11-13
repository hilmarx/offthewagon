class TeacherSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :teacher
  before_save :set_name
  validates :level, inclusion: [1, 2, 3, 4, 5]
  validates_uniqueness_of :teacher_id, :scope => [:skill_id]


  def set_name
    self.name = self.skill.name
  end

end
