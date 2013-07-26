class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def up
  	change_column :crimes, :date, :integer
  end

  def down
  	change_column :crimes, :date, :date
  end
end
