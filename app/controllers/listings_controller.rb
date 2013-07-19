class ListingsController < ApplicationController

	def index
		@listings =[]
		url = open("http://sfbay.craigslist.org/sfc/apa/")
		# url = open("craigslist.html")
		url_data = Nokogiri::HTML(url)
		url_data.css(".row").each do |x|
			x.css("a").each {|a| a["href"] = a["href"].insert(0,"http://sfbay.craigslist.org")}
			l = {}
			l[:link] = x.css('a')[1].attr('href')
			l[:title] = x.css('a')[1].text()
			l[:c_hood] = x.css('small').text().lstrip().sub(/\(/,'').sub(/\)/,'') 
			hood = Neighborhood.find_by_name( l[:c_hood].to_s )
			l[:info] = x.css('.pnr').text
			l[:crime_percentage] = hood.crime_percentage() unless hood.nil? 
			

			case l[:crime_percentage]
				when (20.0...100.0)
					l[:color] = '#ff6666'
				when (15.0..20.0)
					l[:color] = '#ffab66'
				when (10.0..15.0)
					l[:color] = '#ffff66'
				when (5.0..10.0)
					l[:color] = '#9c99ff'
				when (0.0..5.0)
					l[:color] = '#64ff5c'
				else
					l[:color] = '000000'
			end
			@listings <<  l
		end

		@date = ""
		url_data.css(".ban").each do |x|
		@date += x.to_html
		end
	end
end

