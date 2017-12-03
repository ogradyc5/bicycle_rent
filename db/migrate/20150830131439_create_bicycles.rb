class CreateBicycles < ActiveRecord::Migration
  def change
    create_table :bicycles do |t|
      t.string :name
      t.text :description
      t.string :kind
      t.decimal :price

      t.timestamps null: false
    end
  end
end