class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.string :type
      t.text :description
      t.text :data
      t.references :form

      t.timestamps
    end
    add_index :fields, :form_id
  end
end
