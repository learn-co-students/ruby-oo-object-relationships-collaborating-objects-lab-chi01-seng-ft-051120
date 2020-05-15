require 'pry'

class Song 
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def self.new_by_filename(filename)
         new_song_info = filename.split(/ - /)
         new_song = self.new(new_song_info[1])
         new_song_artist = Artist.new(new_song_info[0])
         new_song.artist = new_song_artist 
         new_song
    end 

    def artist_name=(artist)
        artist_check = (Artist.find_or_create_by_name(artist))
        artist_check.add_song(self)
    end 
end