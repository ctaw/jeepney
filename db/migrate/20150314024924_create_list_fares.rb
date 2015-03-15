class CreateListFares < ActiveRecord::Migration
  def change
    create_table :fares do |t|
      t.integer :kilometer
      t.float :regular_fare
      t.float :discounted_fare
      t.timestamps
    end
  end
end
