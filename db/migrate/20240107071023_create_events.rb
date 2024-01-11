class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :customer, null: false, foreign_key: true
      t.boolean :is_correspondence, default: false
      t.string :note
      t.integer :trash, null: false, default: 0
      t.integer :status, default: 0
      t.datetime :start_time

      t.timestamps
    end
  end
end
