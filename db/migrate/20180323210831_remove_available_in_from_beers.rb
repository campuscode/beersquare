class RemoveAvailableInFromBeers < ActiveRecord::Migration[5.1]
  def change
    remove_column :beers, :available_in, :string
  end
end
