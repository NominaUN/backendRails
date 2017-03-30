class DropColumnNoveltyOnPaydayDetail < ActiveRecord::Migration[5.0]
  def change
    remove_column :payday_details, :novelty_id
  end
end
