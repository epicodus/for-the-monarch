def add_province
  header
  puts "Greetings oh Illustrious Monarch!"
  sleep 1
  puts "Have thine eyes seen a desirable Province?"
  sleep 2
  whitespace
  sleep 1.5
  puts "What is the name of this Province?"
  whitespace
  name = gets.chomp
  province = Province.new({:name => name})
  province.save
  sleep 2
  whitespace
  puts "Ah, I shall update our maps accordingly..."
  sleep 2
  puts "'#{name}' will soon know Divinity and Grace under your rule!"
  sleep 3
  main_menu
end

def menu_provinces
  header
  puts "These are the current Provinces: "
  whitespace
  list_provinces
  puts "C > View Knights on campaign for a Province."
  puts "I > Ignore a Province."
  puts "M > Return to Main Menu."
  whitespace
  case gets.chomp.upcase
  when 'C'
    list_province_campaigns
  when 'E'
    delete_province
  when 'M'
    main_menu
  end
end

def list_provinces
  puts "            Provinces"
  puts "          ============="
  whitespace
  Province.all.each do |province|
    puts "       " + province.id.to_s + " - " + province.name + " | " + province.type
  end
  whitespace
end

def list_province_campaigns
  header
  list_provinces
  puts "Enter the number of a Province to view Knights on campaign there:"
  whitespace
  province = Province.find(gets.chomp.to_i)
  whitespace
  puts "          " + province.name + "'s campaigns:"
  puts "          ===================================="
  whitespace
  province.knights.each do |result|
    puts result.name
  end
  whitespace
  puts "P > Return to Provinces Menu."
  puts "M > Return to Main Menu."
  case gets.chomp.upcase
  when 'P'
    menu_provinces
  when 'M'
    main_menu
  end
end

def delete_province
  header
  list_provinces
  puts "You wish to ignore a certain Province?"
  sleep 2
  puts "Enter the number of this Province,"
  puts "and it will be removed from the map:"
  province = Province.find(gets.chomp.to_i)
  province.remove
  sleep 2
  puts "I live to serve..."
  puts "(Province deleted)"
  sleep 2
  menu_provinces
end
