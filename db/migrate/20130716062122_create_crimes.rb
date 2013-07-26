class CreateCrimes < ActiveRecord::Migration

  def change
    create_table :crimes do |t|
      t.string  :category
      t.integer :date
      t.float  :x_coordinate
      t.float  :y_coordinate
      t.timestamps
    end
  end

end
