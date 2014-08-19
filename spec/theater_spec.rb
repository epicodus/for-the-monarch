require 'spec_helper'

describe 'Theater' do
  it 'initializes with a hash' do
    new_theater = Theater.new({:knight_id => 1, :campaign_id => 3})
    expect(new_theater).to be_an_instance_of Theater
  end
  
  it 'lets you read knight id' do
    new_theater = Theater.new({:knight_id => 1, :campaign_id => 3})
    expect(new_theater.knight_id).to eq 1
  end
  
  it 'lets you read campaign id' do
    new_theater = Theater.new({:knight_id => 1, :campaign_id => 3})
    expect(new_theater.campaign_id).to eq 3
  end
  
  describe '.all' do
    it 'starts as an empty array' do
      expect(Theater.all).to eq []
    end
    
    it 'returns all knights' do
      new_theater1 = Theater.new({:knight_id => 1, :campaign_id => 3})
      new_theater2 = Theater.new({:knight_id => 5, :campaign_id => 3})
      new_theater1.save
      new_theater2.save
      expect(Theater.all).to eq [new_theater1, new_theater2]
    end
  end
end