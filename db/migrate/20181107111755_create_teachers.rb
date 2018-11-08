class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.references :user, foreign_key: true
      t.integer :average_rating
      t.integer :hourly_price
      t.date :available_from
      t.date :availble_to

      t.timestamps
    end
  end
end
