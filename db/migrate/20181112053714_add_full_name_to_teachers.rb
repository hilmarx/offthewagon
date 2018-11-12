class AddFullNameToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :full_name, :string
  end
end
