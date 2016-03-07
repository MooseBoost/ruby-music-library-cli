require 'pry'

class MusicLibraryController
  attr_reader :song_list
  
  def initialize(file_path = './db/mp3s')
    music_importer = MusicImporter.new(file_path)
    music_importer.import
    @song_list = Song.all
  end
  
  def call
    puts "What would you like to do?"
    input = nil
    
    until input == "exit"
      input = gets.chomp
      
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_'artist'
      elsif input == "list genres"
        list_'genre'
      elsif input == "play song"
        list_songs
        play_song
      elsif input == "list artist" 
        list_artist
      elsif input == "list genre"
        list_genre
      elsif input != "exit"
        puts "Invalid input. Please try again."
        input = gets.chomp
      end
    end
  end
  
  
  
  def sort_by_artist
    self.song_list.sort_by do |song|
      "#{song.artist.name} #{song.name}"
    end    
  end
  
  def song_format(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
  
  def list_songs
    counter = 0
    sort_by_artist.each do |song| 
      counter += 1
      puts "#{counter}. #{song_format(song)}"
    end    
  end
  
  def list_(x)
    sort_by_artist.each do |song|
      puts "#{song.__send__(x).name}"
    end    
  end
  
  def list_match_(x, input)
    sort_by_artist.each do |song|
      if song.__send__(x).name == input
        puts "#{song_format(song)}"
      end  
    end     
  end
  
  def play_song
    puts "Enter a number."
    input = gets.chomp.to_i
    unless input == 0
      song = sort_by_artist[input - 1]
      puts "Playing #{song_format(song)}" 
    else
      puts "Let's try that again."
      play_song
    end
  end
  
  def list_artist
    list_('artist').uniq.each { |artist| puts artist }
    puts "Choose an artist."
    input = gets.chomp
    list_match_('artist', input)    
  end
  
  def list_genre
    list_('genre').uniq.each { |genre| puts genre }
    puts "Choose a genre."
    input = gets.chomp
    list_match_('genre', input)
  end
  
end