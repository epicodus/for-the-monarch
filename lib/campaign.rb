class Campaign

  attr_reader :id, :knight_id, :province_id

  def initialize attributes
    @id = attributes[:id]
    @knight_id = attributes[:knight_id]
    @province_id = attributes[:province_id]
  end

  def self.all
    campaigns = []
    results = DB.exec("SELECT * FROM campaigns;")
    results.each do |result|
      attributes = {
        :id => result['id'].to_i,
        :knight_id => result['knight_id'].to_i,
        :province_id => result['province_id'].to_i
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
        :knight_id => result['knight_id'].to_i,
        :province_id => result['province_id'].to_i
      }
      campaign << Campaign.new(attributes)
    end
    campaign[0]
  end

  def save
    result = DB.exec("INSERT INTO campaigns (knight_id, province_id) VALUES (#{knight_id}, #{province_id}) RETURNING id;")
    @id = result.first['id'].to_i
  end

  def remove
    DB.exec("DELETE FROM campaigns WHERE id = #{id}")
  end

  def == arg
    self.knight_id == arg.knight_id && self.province_id == arg.province_id && self.id == arg.id
  end
end
