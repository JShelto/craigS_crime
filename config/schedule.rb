every 3.hours do 
  rake "update_feed"
end

every :reboot do 
  rake "update_feed"
end