class AddBeerStyleRefToBeer < ActiveRecord::Migration[5.1]
  def change
    add_reference :beers, :beer_style, foreign_key: true
  end
end
