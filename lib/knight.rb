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
  
  def save
    result = DB.exec("INSERT INTO knights (name) VALUES ('#{name}') RETURNING id;")
    @id = result.first['id'].to_i
  end
  
  def == arg
    self.name == arg.name && self.id == arg.id
  end
end