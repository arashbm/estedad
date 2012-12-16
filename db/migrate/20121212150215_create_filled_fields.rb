class CreateFilledFields < ActiveRecord::Migration
  def change
    create_table :filled_fields do |t|
      t.text :value
      t.integer :field_id
      t.integer :filled_form_id

      t.timestamps
    end
  end
end
