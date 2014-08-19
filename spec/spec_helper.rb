require 'rspec'
require 'pg'
require 'pry'
require 'knight'

DB = PG.connect({:dbname => 'knight_test'})

RSpec.configure do |config|
  config.formatter = 'doc'
end