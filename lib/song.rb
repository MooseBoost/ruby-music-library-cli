class Song
  attr_reader :name, :artist
  
  @@all = []
  
  def initialize(*data)
    @name = data[0]
    self.artist = data[1] if data[1]
  end
  
  class << self
    def all
      @@all
    end
    
    def destroy_all
      @@all.clear
    end
    
    def create(name)
      instance = self.new(name)
      instance.save
      
      instance
    end
  end
  
  def save
    self.class.all << self
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
end