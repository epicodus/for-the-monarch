def add_campaign
  header
  puts "Your armies will carry your banner on high!"
  sleep 1
  puts "And sing tales of your Might and Splendor!"
  sleep 2
  whitespace
  sleep 1.5
  list_provinces
  whitespace
  puts "Where do you wish to send one of your loyal Knights?"
  whitespace
  province = Province.find(gets.chomp.to_i)
  Province.new({:name => name}).save
  sleep 2
  whitespace
  puts "Ah, I shall update our maps accordingly..."
  sleep 2
  puts "'#{name}' will soon know Divinity and Grace under your rule!"
  sleep 3
  main_menu
end

def menu_campaigns

end

def list_campaigns

end

def delete_campaign

end
