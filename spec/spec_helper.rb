require 'rspec'
require 'pg'
require 'pry'
require 'knight'

DB = PG.connect({:dbname => 'knight_test'})

RSpec.configure do |config|
  config.formatter = 'doc'
  config.before(:each) do
    DB.exec("DELETE FROM knights *;")
  end
end