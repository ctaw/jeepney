class AddTables < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :start_name
      t.string :end_name
      t.integer :no_of_way
      t.string :route_distance
      # Plan A
      t.text :encoded_polyline
      t.text :encoded_level
      t.float :start_latitude
      t.float :start_longitude
      t.float :end_latitude
      t.float :end_longitude
      t.timestamps
    end

    create_table :fares do |t|
      t.integer :route_id
      t.float :total_regular_fare
      t.float :total_discounted_fare
      t.text :landmark
      t.string :distance
      t.timestamps
    end
  end
end