class CreateBeerStyles < ActiveRecord::Migration[5.1]
  def change
    create_table :beer_styles do |t|
      t.string :name
      t.references :school_beer, foreign_key: true

      t.timestamps
    end
  end
end
