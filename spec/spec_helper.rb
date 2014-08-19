require 'rspec'
require 'pg'
require 'pry'
require 'knight'
require 'province'
require 'theater'

DB = PG.connect({:dbname => 'knight_test'})

RSpec.configure do |config|
  config.formatter = 'doc'
  config.before(:each) do
    DB.exec("DELETE FROM knights *;")
    DB.exec("DELETE FROM campaigns *;")
    DB.exec("DELETE FROM theaters *;")
  end
end
