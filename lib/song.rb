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
        song_info = filename.split(" - ")
        song_artists = song_info[0]
        song_names = song_info[1]

        song_artist = Artist.find_or_create_by_name(song_artists)

        song = Song.new(song_names)
        song.artist = song_artist
        song
    end

    def artist_name=(artist_name)
        song_artist = Artist.find_or_create_by_name(artist_name)
        self.artist = song_artist
    end




end