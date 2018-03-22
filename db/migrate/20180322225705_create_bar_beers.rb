class CreateBarBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :bar_beers do |t|
      t.references :bar, foreign_key: true
      t.references :beer, foreign_key: true

      t.timestamps
    end
  end
end
