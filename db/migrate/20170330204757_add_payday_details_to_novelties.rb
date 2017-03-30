class AddPaydayDetailsToNovelties < ActiveRecord::Migration[5.0]
  def change
    add_reference :novelties, :payday_details, foreign_key: true
  end
end
