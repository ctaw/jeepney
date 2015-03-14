class CreateJeepneyRoutes < ActiveRecord::Migration
  def change
    create_table :jeepney_routes do |t|
      t.integer :route_id
      t.string :jeep_name
      t.float :regular_fare
      t.float :discounted_fare
      t.timestamps
    end
  end
end
