class AddStateToFilledForms < ActiveRecord::Migration
  def change
    add_column :filled_forms, :state, :string
  end
end
