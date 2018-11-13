class AddPhotoToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :photo, :string
  end
end
