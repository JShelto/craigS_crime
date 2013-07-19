# namespace :clist do
# 	desc "Update craigslist stuff"
# task :housing_list => :environment do 

# 	require 'nokogiri'
# 	require 'open-uri'

# 	url = "http://sfbay.craigslist.org/sfc/apa/"
# 	url_data = Nokogiri::HTML(open(url))
# 	url_data.css(".row a").each do |x|
# 	puts x.to_html
# 	end
	
# end
# end
