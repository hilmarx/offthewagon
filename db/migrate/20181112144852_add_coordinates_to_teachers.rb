class AddCoordinatesToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :latitude, :float
    add_column :teachers, :longitude, :float
  end
end
