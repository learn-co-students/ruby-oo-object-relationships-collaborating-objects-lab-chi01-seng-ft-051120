require 'pry'

class Artist
    attr_accessor :name 

@@all = []

    def initialize(name)
        @name = name 
        @@all << self 
    end    
    
    def self.all 
        @@all 
    end 

    def add_song(song)
        song.artist = self
    end 

    def songs 
        my_songs = Song.all.select do |song|
            song.artist == self
        end 
        my_songs
    end 

    def self.find_or_create_by_name(name)
        new_artist = @@all.find do |artist| 
            artist.name == name  
        end      
        if new_artist == nil 
            new_artist = self.new(name)
        end 
        new_artist 
    end 

    def print_songs 
        output_list = self.songs
        output_list.each do |song|
            puts song.name 
        end 
    end 

end 