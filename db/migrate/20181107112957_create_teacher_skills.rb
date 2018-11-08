class CreateTeacherSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_skills do |t|
      t.string :name
      t.integer :level
      t.references :skill, foreign_key: true
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
