class RemoveAttributesFromBeer < ActiveRecord::Migration[5.1]
  def change
    remove_column :beers, :style, :string
    remove_column :beers, :school_beer_id, :string
  end
end
