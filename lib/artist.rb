

class Artist
    attr_accessor :name, :songs

    @all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def add_song(song)
        song.artist = self
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
        p_songs = self.songs
        p_songs.each do |song|
            puts song.name
        end
    end

end