class RemoveNameFromArea < ActiveRecord::Migration[5.0]
  def change
    remove_column :areas, :name
  end
end
