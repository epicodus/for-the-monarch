class Province

  attr_reader :id, :name

  def initialize attributes
    @id = attributes[:id]
    @name = attributes[:name]
  end

  def self.all
    provinces = []
    results = DB.exec("SELECT * FROM provinces;")
    results.each do |result|
      attributes = {
        :id => result['id'].to_i,
        :name => result['name']
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
        :name => result['name']
      }
      province << Province.new(attributes)
    end
    province[0]
  end

  def save
    result = DB.exec("INSERT INTO provinces (name) VALUES ('#{name}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def remove
    DB.exec("DELETE FROM provinces WHERE id = #{id}")
  end

  def == arg
    self.name == arg.name && self.id == arg.id
  end
end
