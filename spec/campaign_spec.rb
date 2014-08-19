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
    
    it 'returns all campaignss' do
      new_campaigns1 = Campaign.new({:name => 'Lowbuck Province'})
      new_campaigns2 = Campaign.new({:name => 'Castle Blackrock'})
      new_campaigns1.save
      new_campaigns2.save
      expect(Campaign.all).to eq [new_campaigns1, new_campaigns2]
    end
  end
  
  describe 'save' do
    it 'saves a campaign' do
      new_campaign = Campaign.new({:name => 'Castle Blackrock'})
      new_campaign.save
      expect(Campaign.all).to eq [new_campaign]
    end
    
    it 'adds an id' do
      new_campaign = Campaign.new({:name => 'Castle Blackrock'})
      new_campaign.save
      expect(Campaign.all[0].id).to eq new_campaign.id
    end
  end
  
  describe 'remove' do
    it 'deletes a campaign' do
      new_campaign = Campaign.new({:name => 'Castle Blackrock'})
      new_campaign.save
      new_campaign.remove
      expect(Campaign.all).to eq []
    end
    
    it 'only deletes the campaign remove is called on' do
      new_campaign1 = Campaign.new({:name => 'Frozen Fjord'})
      new_campaign1.save
      new_campaign2 = Campaign.new({:name => 'Splinter Hill'})
      new_campaign2.save
      new_campaign1.remove
      expect(Campaign.all).to eq [new_campaign2]
    end
  end
end