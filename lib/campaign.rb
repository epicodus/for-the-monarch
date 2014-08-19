class Campaign
  
  attr_reader :id, :name
  
  def initialize attributes
    @id = attributes[:id]
    @name = attributes[:name]
  end
  
  def self.all
    campaigns = []
  end
end