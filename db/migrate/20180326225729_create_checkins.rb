class CreateCheckins < ActiveRecord::Migration[5.1]
  def change
    create_table :checkins do |t|
      t.references :bar, foreign_key: true
      t.references :beer, foreign_key: true

      t.timestamps
    end
  end
end
