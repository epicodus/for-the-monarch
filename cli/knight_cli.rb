def add_knight
  header
  puts "Greetings oh Wise and Powerful Monarch!"
  sleep 1
  puts "I must say your scent is utterly captivating this day..."
  sleep 1.5
  puts "Oh...right, forgive me my Liege."
  sleep 2
  whitespace
  puts "You wish to conscript another Knight?"
  sleep 1
  puts "Who is blessed enough to be called into your service?"
  puts "(Enter the new Knight's name): "
  whitespace
  name = gets.chomp
  Knight.new({:name => name}).save
  sleep 1
  whitespace
  puts "A raven has been dispatched..."
  sleep 1
  puts "'#{name}' will now fight for your glory oh Divine Ruler!"
  sleep 2
  main_menu
end

def list_knights

end

def list_knight_campaigns

end

def find_knight

end

def delete_knight

end
