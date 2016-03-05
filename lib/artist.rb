class Artist
  attr_accessor :name
  attr_reader :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
  
  def add_song(song)
    songs << song unless songs.include? song
    song.artist = self if song.artist == nil
  end
  
  def genres
    self.songs.map { |song| song.genre }.uniq
  end
  
end