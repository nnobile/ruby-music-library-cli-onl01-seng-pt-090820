class Song
    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
      @name = name
      if artist
        self.artist=(artist)
      end
      if genre
        self.genre=(genre)
      end
    end

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end

    def genre=(genre)
      @genre = genre
      genre.add_song(self)
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end

    def save
      @@all << self
    end

    def self.create(new_song)
      new_song = Song.new(name)
      new_song.save
      new_song
    end
  end
