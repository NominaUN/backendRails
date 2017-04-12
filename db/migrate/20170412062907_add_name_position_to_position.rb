class AddNamePositionToPosition < ActiveRecord::Migration[5.0]
  def change
    add_column :positions, :name_position, :string
  end
end
