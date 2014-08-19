require 'spec_helper'

describe 'Campaign' do
  it 'initializes with a hash' do
    new_campaign = Campaign.new({:name => 'Lowbuck Province'})
    expect(new_campaign).to be_an_instance_of Campaign
  end
  
  it 'lets you read the name' do
    new_campaign = Campaign.new({:name => 'Lowbuck Province'})
    expect(new_campaign.name).to eq 'Lowbuck Province'
  end
  
  describe '.all' do
    it 'starts as an empty array' do
      expect(Campaign.all).to eq []
    end
  end
  
  describe 'save' do
    it 'saves a campaign' do
      new_campaign = Campaign.new({:name => 'Castle Blackrock'})
      new_campaign.save
      expect(Campaign.all).to eq [new_campaign]
    end
  end
end