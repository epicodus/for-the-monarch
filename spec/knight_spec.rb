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
    
    it 'returns all knights' do
      new_knight1 = Knight.new({:name => 'Sir Heckingbottom'})
      new_knight2 = Knight.new({:name => 'Sir Lancelot'})
      new_knight1.save
      new_knight2.save
      expect(Knight.all).to eq [new_knight1, new_knight2]
    end
  end
  
  describe '.find' do
    it 'returns a knight when given an id' do
      new_knight = Knight.new({:name => 'Sir Heckingbottom'})
      new_knight.save
      expect(Knight.find(new_knight.id)).to eq new_knight
    end
  end
  
  describe 'save' do
    it 'saves a knight' do
      new_knight = Knight.new({:name => 'Sir Heckingbottom'})
      new_knight.save
      expect(Knight.all).to eq [new_knight]
    end
    
    it 'adds an id' do
      new_knight = Knight.new({:name => 'Sir Heckingbottom'})
      new_knight.save
      expect(Knight.all[0].id).to eq new_knight.id
    end
  end
  
  describe 'remove' do
    it 'deletes a knight' do
      new_knight = Knight.new({:name => 'Sir Reginald Clutterbuck'})
      new_knight.save
      new_knight.remove
      expect(Knight.all).to eq []
    end
    
    it 'only deletes the knight remove is called on' do
      new_knight1 = Knight.new({:name => 'Sir Reginald Clutterbuck'})
      new_knight1.save
      new_knight2 = Knight.new({:name => 'Sir Heckingbottom'})
      new_knight2.save
      new_knight1.remove
      expect(Knight.all).to eq [new_knight2]
    end
  end
end