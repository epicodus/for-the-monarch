class Province

  attr_reader :id, :name, :type

  def initialize attributes
    @id = attributes[:id]
    @name = attributes[:name]
    @type = attributes[:type]
  end

  def self.all
    provinces = []
    results = DB.exec("SELECT * FROM provinces;")
    results.each do |result|
      attributes = {
        :id => result['id'].to_i,
        :name => result['name'],
        :type => result['type']
      }
      provinces << Province.new(attributes)
    end
    provinces
  end

  def self.find id
    province = []
    results = DB.exec("SELECT * FROM provinces WHERE id = #{id};")
    results.each do |result|
      attributes = {
        :id => result['id'].to_i,
        :name => result['name'],
        :type => result['type']
      }
      province << Province.new(attributes)
    end
    province[0]
  end

  def knights
    knights = []
    results = DB.exec("SELECT knights.* FROM provinces
              JOIN campaigns on (provinces.id = campaigns.province_id)
              JOIN knights on (campaigns.knight_id = knights.id)
              WHERE provinces.id = #{id};")
    results.each do |result|
      attributes = {
        :id => result['id'].to_i,
        :name => result['name']
      }
      knights << Knight.new(attributes)
    end
    knights
  end

  def set_type
    biomes = ["Desert", "Farmland", "Forest", "Mountains", "Hills", "Hinterland", "City", "Marsh"]
    num = rand(7)
    @type = biomes[num]
  end

  def save
    self.set_type
    result = DB.exec("INSERT INTO provinces (name, type) VALUES ('#{name}', '#{type}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def remove
    DB.exec("DELETE FROM provinces WHERE id = #{id}")
  end

  def == arg
    self.name == arg.name && self.id == arg.id
  end
end
