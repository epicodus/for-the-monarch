require 'spec_helper'

describe 'Theater' do
  it 'initializes with a hash' do
    new_theater = Theater.new({:knight_id => 1, :campaign_id => 3})
    expect(new_theater).to be_an_instance_of Theater
  end
end