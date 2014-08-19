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

  describe 'campaigns' do
    it 'shows which provinces a knight has been sent to' do
      new_knight = Knight.new({:name => 'Sir Reginald Clutterbuck'})
      new_knight.save
      new_province1 = Province.new({:name => 'Castle Blackrock'})
      new_province1.save
      new_province2 = Province.new({:name => 'Frozen Fjord'})
      new_province2.save
      new_campaign1 = Campaign.new({:knight_id => new_knight.id, :province_id => new_province1.id})
      new_campaign1.save
      new_campaign2 = Campaign.new({:knight_id => new_knight.id, :province_id => new_province2.id})
      new_campaign2.save
      expect(new_knight.campaigns).to eq [new_province1, new_province2]
    end

    it 'only shows provinces for what it is called on' do
      new_knight1 = Knight.new({:name => 'Sir Reginald Clutterbuck'})
      new_knight1.save
      new_knight2 = Knight.new({:name => 'Sir Heckingbottom'})
      new_knight2.save
      new_province1 = Province.new({:name => 'Castle Blackrock'})
      new_province1.save
      new_province2 = Province.new({:name => 'Frozen Fjord'})
      new_province2.save
      new_campaign1 = Campaign.new({:knight_id => new_knight1.id, :province_id => new_province1.id})
      new_campaign1.save
      new_campaign2 = Campaign.new({:knight_id => new_knight2.id, :province_id => new_province2.id})
      new_campaign2.save
      expect(new_knight2.campaigns).to eq [new_province2]
    end
  end
end
