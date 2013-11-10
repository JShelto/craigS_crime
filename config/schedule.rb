every 3.hours do 
  rake "update_craigs"
end

every :reboot do 
  rake "update_craigs"
end