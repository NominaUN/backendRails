class AddNameAreaToArea < ActiveRecord::Migration[5.0]
  def change
    add_column :areas, :name_area, :string
  end
end
