require 'pry'
class Artist
attr_accessor :name
@@all = []
def initialize (name)
  @name = name
  @@all << self
end

def self.all
  @@all
end

def songs
  Song.all.select {|song| song.artist == self}
end

def add_song(song)
  song.artist = self
end

def self.find_or_create_by_name(name)
  found = self.all.select {|artist_name| artist_name.name == name}
    if found == []
      return self.new(name)
    else
      found[0]
    end
end

def print_songs
  puts songs.map {|song| song.name}
end

end