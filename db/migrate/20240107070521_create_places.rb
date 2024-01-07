class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.integer :price, null: false
      t.string :remarks

      t.timestamps
    end
  end
end
