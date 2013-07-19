class AddColumnToNeighborhoods < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :x_coordinate, :float
    add_column :neighborhoods, :y_coordinate, :float
  end
end
