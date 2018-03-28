class AddSlugToBeer < ActiveRecord::Migration[5.1]
  def change
    add_column :beers, :slug, :string
  end
end
