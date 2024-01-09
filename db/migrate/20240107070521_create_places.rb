class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :name, null: false
      t.string :address, null: false
      t.integer :price, null: false
      t.string :remarks

      t.timestamps
    end
  end
end
