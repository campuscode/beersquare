class AddSchoolBeerToBeer < ActiveRecord::Migration[5.1]
  def change
    add_reference :beers, :school_beer, foreign_key: true
  end
end
