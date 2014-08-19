class Knight
  attr_reader :id, :name

  def initialize attributes
    @id = attributes[:id]
    @name = attributes[:name]
  end

  def self.all
    knights = []
    results = DB.exec("SELECT * FROM knights;")
    results.each do |result|
      attributes = {
        :id => result['id'].to_i,
        :name => result['name']
      }
      knights << Knight.new(attributes)
    end
    knights
  end

  def self.find id
    knight = []
    results = DB.exec("SELECT * FROM knights WHERE id = #{id};")
    results.each do |result|
      attributes = {
        :id => result['id'].to_i,
        :name => result['name']
      }
      knight << Knight.new(attributes)
    end
    knight[0]
  end

  def campaigns
    campaigns = []
    results = DB.exec("SELECT provinces.* FROM knights
              JOIN campaigns on (knights.id = campaigns.knight_id)
              JOIN provinces on (campaigns.province_id = provinces.id)
              WHERE knights.id = #{id};")
    results.each do |result|
      attributes = {
        :id => result['id'].to_i,
        :name => result['name'],
        :type => result['type']
      }
      campaigns << Province.new(attributes)
    end
    campaigns
  end

  def save
    result = DB.exec("INSERT INTO knights (name) VALUES ('#{name}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def remove
    DB.exec("DELETE FROM knights WHERE id = #{id}")
  end

  def == arg
    self.name == arg.name && self.id == arg.id
  end
end
