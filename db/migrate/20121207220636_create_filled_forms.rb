class CreateFilledForms < ActiveRecord::Migration
  def change
    create_table :filled_forms do |t|
      t.references :form
      t.references :user

      t.timestamps
    end
    add_index :filled_forms, :form_id
    add_index :filled_forms, :user_id
  end
end
