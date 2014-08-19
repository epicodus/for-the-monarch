class Theater
  
  attr_reader :id, :knight_id, :campaign_id
  
  def initialize attributes
    @id = attributes[:id]
    @knight_id = attributes[:knight_id]
    @campaign_id = attributes[:campaign_id]
  end
  
  def self.all
    theaters = []
    results = DB.exec("SELECT * FROM theaters;")
    results.each do |result|
      attributes = {
        :id => result['id'].to_i,
        :knight_id => result['knight_id'].to_i,
        :campaign_id => result['campaign_id'].to_i
      }
      theaters << Theater.new(attributes)
    end
    theaters
  end
  
  def save
    result = DB.exec("INSERT INTO theaters (knight_id, campaign_id) VALUES (#{knight_id}, #{campaign_id}) RETURNING id;")
    @id = result.first['id'].to_i
  end
  
  def == arg
    self.knight_id == arg.knight_id && self.campaign_id == arg.campaign_id && self.id == arg.id
  end
end