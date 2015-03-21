class AddLink < ActiveRecord::Migration
  def change
    add_column :jeepney_fare, :link_file, :text
  end
end
