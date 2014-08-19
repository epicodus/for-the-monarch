class Theater
  
  attr_reader :id, :name
  
  def initialize attributes
    @id = attributes[:id]
    @knight_id = attributes[:knight_id]
    @campaign_id = attributes[:campaign_id]
  end
end