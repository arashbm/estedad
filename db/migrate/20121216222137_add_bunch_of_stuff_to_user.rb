class AddBunchOfStuffToUser < ActiveRecord::Migration
  def change
    add_column :users, :data, :text
  end
end
