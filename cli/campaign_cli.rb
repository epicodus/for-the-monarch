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
  whitespace
  list_knights
  puts "And which Knight shall you trust with this?"
  knight = Knight.find(gets.chomp.to_i)
  whitespace
  Campaign.new({:knight_id => knight.id, :province_id => province.id}).save
  sleep 2
  puts knight.name + " shall bring your Victory in " + province.name + "."
  puts "(Campaign created)"
  sleep 3
  main_menu
end

def menu_campaigns

end

def list_campaigns

end

def delete_campaign

end
