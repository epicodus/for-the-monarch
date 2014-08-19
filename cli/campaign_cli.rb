def add_campaign
  header
  list_provinces
  whitespace
  puts "Where do you wish to send one of your loyal Knights?"
  whitespace
  province = Province.find(gets.chomp.to_i)
  whitespace
  list_knights
  puts "And who will carry your banner on high?"
  knight = Knight.find(gets.chomp.to_i)
  whitespace
  Campaign.new({:knight_id => knight.id, :province_id => province.id}).save
  sleep 1
  puts knight.name + " shall bring you Victory in " + province.name + "."
  puts "(Campaign created)"
  sleep 3
  main_menu
end

def menu_campaigns
  header
  puts "These are the current campaigns: "
  whitespace
  list_campaigns
  puts "K > View Campaigns by Knight."
  puts "P > View Campaigns by Province."
  puts "R > Cease a Campaign."
  puts "M > Return to Main Menu."
  whitespace
  case gets.chomp.upcase
  when 'K'
    list_knight_campaigns
  when 'P'
    list_province_campaigns
  when 'R'
    delete_campaign
  when 'M'
    main_menu
  end
end

def list_campaigns
  puts "            Campaigns"
  puts "          ============="
  whitespace
  Campaign.all.each do |campaign|
    province = Province.find(campaign.province_id)
    knight = Knight.find(campaign.knight_id)
    puts campaign.id.to_s + " | " + knight.name + " is on campaign in " + province.name + "."
  end
  whitespace
end

def delete_campaign
  header
  list_campaigns
  puts "Enter the number of the Campaign you wish to end:"
  campaign = Campaign.find(gets.chomp.to_i)
  campaign.remove
  sleep 1
  puts "As you decree my Liege."
  puts "(Campaign deleted)"
  sleep 2
  menu_campaigns
end
