class Campaign
  
  attr_reader :id, :name
  
  def initialize attributes
    @id = attributes[:id]
    @name = attributes[:name]
  end
  
  def self.all
    campaigns = []
    results = DB.exec("SELECT * FROM campaigns;")
    results.each do |result|
      attributes = {
        :id => result['id'].to_i,
        :name => result['name']
      }
      campaigns << Campaign.new(attributes)
    end
    campaigns
  end
  
  def self.find id
    campaign = []
    results = DB.exec("SELECT * FROM campaigns WHERE id = #{id};")
    results.each do |result|
      attributes = {
        :id => result['id'].to_i,
        :name => result['name']
      }
      campaign << Campaign.new(attributes)
    end
    campaign[0]
  end
  
  def save
    result = DB.exec("INSERT INTO campaigns (name) VALUES ('#{name}') RETURNING id;")
    @id = result.first['id'].to_i
  end
  
  def remove
    DB.exec("DELETE FROM campaigns WHERE id = #{id}")
  end
  
  def == arg
    self.name == arg.name && self.id == arg.id
  end
end