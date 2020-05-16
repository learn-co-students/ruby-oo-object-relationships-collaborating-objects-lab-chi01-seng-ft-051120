class Song
    attr_accessor :artist, :name 
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file_name)
        # split the data
        split = file_name.split(" - ")
        song_artist_name = split[0]
        song_name = split[1]

        song_artist = Artist.find_or_create_by_name(song_artist_name)

        # create new song
        song = Song.new(song_name)
        song.artist = song_artist
        song
    end

    def artist_name=(artist_name)
        song_artist = Artist.find_or_create_by_name(artist_name)
        self.artist = song_artist
    end

end