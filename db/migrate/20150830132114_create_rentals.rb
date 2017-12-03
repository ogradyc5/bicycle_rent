class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.date :starts_on
      t.date :ends_on
      t.references :bicycles

      t.timestamps null: false
    end
  end
end