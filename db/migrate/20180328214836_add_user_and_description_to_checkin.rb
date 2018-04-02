class AddUserAndDescriptionToCheckin < ActiveRecord::Migration[5.1]
  def change
    add_reference :checkins, :user, foreign_key: true
    add_column :checkins, :description, :text
    add_column :checkins, :completed, :boolean
  end
end
