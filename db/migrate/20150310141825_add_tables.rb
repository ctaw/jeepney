class AddTables < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :start_name
      t.string :end_name
      t.float :longitude
      t.float :latitude
      t.integer :no_of_way
      t.string :route_distance
      # Plan A
      t.text :encoded_polyline
      t.text :encoded_level
      t.timestamps
    end

    create_table :fares do |t|
      t.integer :route_id
      t.string :regular_fare
      t.string :discounted_fare
      t.text :landmark
      t.string :distance
      t.timestamps
    end
  end
end