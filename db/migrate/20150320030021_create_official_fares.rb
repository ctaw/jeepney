class CreateOfficialFares < ActiveRecord::Migration
  def change
    create_table :official_fares do |t|
      t.string :route_name
      t.text :link_file
    end
  end
end
