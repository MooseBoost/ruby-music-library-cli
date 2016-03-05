class Song
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(*data)
    @name = data[0]
    self.artist = data[1] if data[1]
    self.genre = data[2] if data[2]
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
    
    def find_by_name(name)
      all.find { |song| song.name == name }    
    end
    
    def find_or_create_by_name(name)
      song = find_by_name(name)
      song = create(name) if song.nil?
      
      song
    end
  end
  
  def save
    self.class.all << self
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include? self
  end
  
end