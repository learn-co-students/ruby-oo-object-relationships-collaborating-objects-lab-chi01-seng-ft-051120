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
        # returns all songs that
        # belong to this artist
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(artist_name)
        found  = @@all.find do |artist|
            artist.name == artist_name
        end

        return Artist.new(artist_name) if !found
        found
    end

    def print_songs
        songs = [] # will hold songs

        Song.all.find_all do |song| 
        # loop through songs array and 
        # find songs that match with
        # this artist
           if song.artist == self
            songs << song.name
           end
        end

        puts songs
    end
end