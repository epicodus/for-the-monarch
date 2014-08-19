def add_knight
  header
  puts "Greetings oh Wise and Powerful Monarch!"
  sleep 1
  puts "I must say your scent is utterly captivating this day..."
  sleep 2
  puts "Oh...right, forgive me my Liege."
  sleep 2
  whitespace
  puts "You wish to conscript another Knight?"
  sleep 1.5
  puts "Who is blessed enough to be called into your service?"
  puts "(Enter the new Knight's name): "
  whitespace
  name = gets.chomp
  Knight.new({:name => name}).save
  sleep 2
  whitespace
  puts "A raven has been dispatched..."
  sleep 2
  puts "'#{name}' will now fight for your glory oh Divine Ruler!"
  sleep 3
  main_menu
end

def menu_knights
  header
  puts "These Knights will fight & die for your Honor: "
  whitespace
  list_knights
  puts "C > View campaigns for a Knight."
  puts "E > Execute a Knight."
  puts "M > Return to Main Menu."
  whitespace
  case gets.chomp.upcase
  when 'C'
    list_knight_campaigns
  when 'E'
    delete_knight
  when 'M'
    main_menu
  end
end

def list_knights
  puts "            Knights"
  puts "          ==========="
  whitespace
  Knight.all.each do |knight|
    puts "       " + knight.id.to_s + " - " + knight.name
  end
  whitespace
end

def list_knight_campaigns
  header
  list_knights
  puts "Enter the number of a Knight to view their campaigns:"
  whitespace
  knight = Knight.find(gets.chomp.to_i)
  whitespace
  puts "          " + knight.name + "'s campaigns:"
  puts "          ===================================="
  whitespace
  knight.campaigns.each do |result|
    puts result.name + " | " + result.type
  end
  whitespace
  puts "K > Return to Knights Menu."
  puts "M > Return to Main Menu."
  case gets.chomp.upcase
  when 'K'
    menu_knights
  when 'M'
    main_menu
  end
end

def delete_knight
  header
  list_knights
  puts "Has one of your Knights committed treason?"
  sleep 2
  puts "Or worse...besmirched thy glorious name?"
  sleep 2
  puts "Enter the number of this treachorous Knight,"
  puts "and they will be dealt with:"
  knight = Knight.find(gets.chomp.to_i)
  knight.remove
  sleep 2
  puts "The sentence will be carried out my Liege."
  puts "(Knight deleted)"
  sleep 2
  menu_knights
end
