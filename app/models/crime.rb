class Crime < ActiveRecord::Base
  attr_accessible :category, :date, :x_coordinate, :y_coordinate
  
  belongs_to :neighborhoods
end
