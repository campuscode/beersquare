class CreateBars < ActiveRecord::Migration[5.1]
  def change
    create_table :bars do |t|
      t.string :name
      t.string :state
      t.string :city
      t.string :neighborhood
      t.string :zip_code
      t.string :phone
      t.string :trading_hour
      t.string :payment
      t.string :rank
      t.string :services

      t.timestamps
    end
  end
end
