require 'rspec'
require 'pg'
require 'pry'
require 'knight'
require 'province'
require 'campaign'

DB = PG.connect({:dbname => 'for_the_monarch_test'})

RSpec.configure do |config|
  config.formatter = 'doc'
  config.before(:each) do
    DB.exec("DELETE FROM knights *;")
    DB.exec("DELETE FROM campaigns *;")
    DB.exec("DELETE FROM provinces *;")
  end
end
