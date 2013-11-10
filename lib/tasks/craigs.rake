require 'open-uri'

desc "This task creates html files from craigslist pages for use with craigsscout-sf in production"

  task :update_feed => :environment do

    open("public/craigslist_ah.html", "wb") do |file|
      open("https://sfbay.craigslist.org/sfc/apa/") do |uri|
         file.write(uri.read)
      end
    end

    open("public/craigslist_hs.html", "wb") do |file|
      open("https://sfbay.craigslist.org/sfc/swp/") do |uri|
         file.write(uri.read)
      end
    end

    open("public/craigslist_hw.html", "wb") do |file|
      open("https://sfbay.craigslist.org/sfc/hsw/") do |uri|
         file.write(uri.read)
      end
    end

    open("public/craigslist_oc.html", "wb") do |file|
      open("https://sfbay.craigslist.org/sfc/off/") do |uri|
         file.write(uri.read)
      end
    end

    open("public/craigslist_ps.html", "wb") do |file|
      open("https://sfbay.craigslist.org/sfc/prk/") do |uri|
         file.write(uri.read)
      end
    end

    open("public/craigslist_re.html", "wb") do |file|
      open("https://sfbay.craigslist.org/sfc/rea/") do |uri|
         file.write(uri.read)
      end
    end

    open("public/craigslist_rs.html", "wb") do |file|
      open("https://sfbay.craigslist.org/sfc/roo/") do |uri|
         file.write(uri.read)
      end
    end

    open("public/craigslist_st.html", "wb") do |file|
      open("https://sfbay.craigslist.org/sfc/sub/") do |uri|
         file.write(uri.read)
      end
    end

    open("public/craigslist_vr.html", "wb") do |file|
      open("https://sfbay.craigslist.org/sfc/vac/") do |uri|
         file.write(uri.read)
      end
    end

  end