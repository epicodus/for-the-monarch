require 'pg'
require './lib/knight.rb'
require './lib/province.rb'
require './lib/campaign.rb'
require './cli/knight_cli.rb'
require './cli/province_cli.rb'
require './cli/campaign_cli.rb'

DB = PG.connect({:dbname => 'for_the_monarch'})

def whitespace
  puts "\n"
end

def header
  system 'clear'
  puts "            For The Monarch!"
  puts "
                 _.+._
               (^\\/^\\/^)
                \\@*@*@/
                {_____}
  "
end

def main_menu_ctrls
  puts "A campaign management system fit for a Monarch."
  whitespace
  puts "        N > Conscript a new Knight."
  puts "        K > Show Knights in service."
  puts "        E > Execute a Knight."

  case gets.chomp.upcase
  when 'N'
    add_knight
  when 'K'
    menu_knights
  when 'E'
    delete_knight
  end

  whitespace
end
