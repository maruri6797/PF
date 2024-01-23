class CreateManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :managers do |t|
      t.references :admin, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
