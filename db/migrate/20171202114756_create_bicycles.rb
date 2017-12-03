class CreateBicycles < ActiveRecord::Migration
  def change
    create_table :bicycles do |t|
      t.string :make
      t.string :name
      t.decimal :rent_price

      t.timestamps null: false
    end
  end
end
