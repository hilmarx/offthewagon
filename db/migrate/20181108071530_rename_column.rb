class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :teachers, :availble_to, :available_to
  end
end
