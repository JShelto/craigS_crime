class Neighborhood < ActiveRecord::Base
  attr_accessible :name, :x_coordinate, :y_coordinate

 has_many :listings
 has_many :crimes

#Keeps a count of the crimes in a given neighborhood
	def crimes 
		lon = self.x_coordinate
		lat = self.y_coordinate
		crimes = Crime.where(x_coordinate: (lon -0.01...lon +0.01), y_coordinate: (lat-0.01...lat +0.01))
		crimes.count.to_f
	end

#Takes the count of the occurrences of crime in each neighborhood and returns what percentage of the total crime occurs in that neighborhood
	def crime_percentage
		((self.crimes / Crime.count ) * 100).round(2)
	end

#The neighbood's associated crime percentage is pushed into an array 
	# def neighborhood_percentages
	# 	hoods = []
	# 	percentages = self.crime_percentage
	# 	percentages.each do |x|
	# 		hoods.push(x)
	# 	end
	# end


end