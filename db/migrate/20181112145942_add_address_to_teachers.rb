class AddAddressToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :address, :string
  end
end
