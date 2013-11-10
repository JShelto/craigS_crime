class ListingsController < ApplicationController

	def index
		@skip_body = true
		@skip_footer = true
	end

	def apartments_housing
		if Rails.env.development?
			live_list(open("https://sfbay.craigslist.org/sfc/apa/"));
		else
			saved_list(open("public/craigslist_ah.html"));
		end
	end

	def housing_swap
		if Rails.env.development?
			live_list(open("https://sfbay.craigslist.org/sfc/swp/"));
		else
			saved_list(open("public/craigslist_hs.html"));
		end
	end

	def housing_wanted
		if Rails.env.development?
			live_list(open("https://sfbay.craigslist.org/sfc/hsw/"));
		else
			saved_list(open("public/craigslist_hw.html"));
		end
	end

	def office_commercial
		if Rails.env.development?
			live_list(open("https://sfbay.craigslist.org/sfc/off/"));
		else
			saved_list(open("public/craigslist_oc.html"));
		end
	end

	def parking_storage
		if Rails.env.development?
			live_list(open("https://sfbay.craigslist.org/sfc/prk/"));
		else
			saved_list(open("public/craigslist_ps.html"));
		end
	end

	def real_estate
		if Rails.env.development?
			live_list(open("https://sfbay.craigslist.org/sfc/rea/"));
		else
			saved_list(open("public/craigslist_re.html"));
		end
	end

	def rooms_shared
		if Rails.env.development?
			live_list(open("https://sfbay.craigslist.org/sfc/roo/"));
		else
			saved_list(open("public/craigslist_rs.html"));
		end
	end

	def sublets_temp
		if Rails.env.development?
			live_list(open("https://sfbay.craigslist.org/sfc/sub/"));
		else
			saved_list(open("public/craigslist_st.html"));
		end
	end

	def vacation_rentals
		if Rails.env.development?
			live_list(open("https://sfbay.craigslist.org/sfc/vac/"));
		else
			saved_list(open("public/craigslist_vr.html"));
		end
	end

	private

		def live_list(url)
			@listings =[]
			url
			url_data = Nokogiri::HTML(url)
			url_data.css(".row").each do |x|
				#for each anchor tag, take the href attr and insert the following as the zero-th element
				x.css("a").each {|a| a["href"] = a["href"].insert(0,"http://sfbay.craigslist.org")}
				#takes each attribute and puts it into a hash with custom keys paired to the selectors provided by the site
				l = {}
				l[:link] = x.css('a')[1].attr('href')
				l[:title] = x.css('a')[1].text()
				#the parens are stripped of of the nighborhood listings, so that they can correspond to the names in the seeded database
				l[:c_hood] = x.css('small').text().lstrip().sub(/\(/,'').sub(/\)/,'') 
				hood = Neighborhood.find_by_name( l[:c_hood].to_s )
				l[:info] = x.css('.pnr').text
				#the crime percentage of each neighborhood is paired with a key 
				l[:crime_percentage] = hood.crime_percentage() unless hood.nil? 
				
				#given a certain crime percentage that falls within a given range a color will display 
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

			#the date is web scraped and placed into an instance variable to be yieled in html
			@date = ""
			url_data.css(".ban").each do |x|
			@date = x.to_html
			end
		end

		def saved_list(url)
			@listings =[]
			url
			url_data = Nokogiri::HTML(url)
			url_data.css(".row").each do |x|
				#for each anchor tag, take the href attr and insert the following as the zero-th element
				x.css("a").each {|a| a["href"] = a["href"].insert(0,"http://sfbay.craigslist.org")}
				#takes each attribute and puts it into a hash with custom keys paired to the selectors provided by the site
				l = {}
				l[:link] = x.css('a')[1].attr('href')
				l[:title] = x.css('a')[1].text()
				#the parens are stripped of of the nighborhood listings, so that they can correspond to the names in the seeded database
				l[:c_hood] = x.css('small').text().lstrip().sub(/\(/,'').sub(/\)/,'') 
				hood = Neighborhood.find_by_name( l[:c_hood].to_s )
				l[:info] = x.css('.pnr').text
				#the crime percentage of each neighborhood is paired with a key 
				l[:crime_percentage] = hood.crime_percentage() unless hood.nil? 
				
				#given a certain crime percentage that falls within a given range a color will display 
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

			#the date is web scraped and placed into an instance variable to be yieled in html
			@date = ""
			url_data.css(".ban").each do |x|
			@date = x.to_html
			end
		end
	
end
