class Artist
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
  end
  
  class << self
    def all
      @@all
    end
    
    def destroy_all
      @@all.clear
    end
    
    def create(name)
      created = self.new(name)
      created.save
      
      created
    end
  end
  
  def save
    self.class.all << self
  end
  
end