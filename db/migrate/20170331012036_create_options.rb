class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.string :action
      t.boolean :insert_action
      t.boolean :update_action
      t.boolean :delete_action

      t.timestamps
    end
  end
end
