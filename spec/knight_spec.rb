require 'spec_helper'


describe 'Knight' do
  it 'initializes with a hash' do
    new_knight = Knight.new({:name => 'Sir Lancelot'})
    expect(new_knight).to be_an_instance_of Knight
  end
  
  it 'lets you read the name' do
    new_knight = Knight.new({:name => 'Sir Lancelot'})
    expect(new_knight.name).to eq 'Sir Lancelot'
  end
  
  describe '.all' do
    it 'starts as an empty array' do
      expect(Knight.all).to eq []
    end
  end
  
  describe 'save' do
    it 'saves a knight' do
      new_knight = Knight.new({:name => 'Sir Heckingbottom'})
      new_knight.save
      expect(Knight.all).to eq [new_knight]
    end
  end
end