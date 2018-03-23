class AddAttribuesToBeer < ActiveRecord::Migration[5.1]
  def change
    add_column :beers, :brewery, :string
    add_column :beers, :nationality, :string
    add_column :beers, :description, :text
  end
end
