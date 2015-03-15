class AddTables < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :start_name
      t.string :end_name
      t.integer :no_of_way
      t.string :route_distance
      t.float :start_latitude
      t.float :start_longitude
      t.float :end_latitude
      t.float :end_longitude
      t.timestamps
    end

    create_table :jeepney_routes do |t|
      # Plan A
      t.integer :route_id
      t.string :sign_board # Jeepney's signboard
      t.text :encoded_polyline
      t.text :encoded_level
      t.string :landmark
      t.timestamps
    end

    create_table :jeepney_fares do |t|
      t.integer :jeepney_route_id
      t.float :regular_fare
      t.float :discounted_fare
      t.float :distance
      t.timestamps
    end
  end
end