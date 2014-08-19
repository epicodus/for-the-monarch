require 'spec_helper'

describe 'Campaign' do
  it 'initializes with a hash' do
    new_campaign = Campaign.new({:name => 'Lowbuck Province'})
    expect(new_campaign).to be_an_instance_of Campaign
  end
end