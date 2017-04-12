class RemoveNameFromPosition < ActiveRecord::Migration[5.0]
  def change
    remove_column :positions, :name, :string
  end
end
