class CreateListFares < ActiveRecord::Migration
  def change
    create_table :list_fares do |t|
      t.integer :kilometer
      t.float :regular_fare
      t.float :discounted_fare
    end
  end
end
