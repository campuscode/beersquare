class AddAttributesToBeer < ActiveRecord::Migration[5.1]
  def change
    add_column :beers, :brewery, :string
    add_column :beers, :nationality, :string
    add_column :beers, :available_in, :string
    add_column :beers, :description, :string
  end
end
