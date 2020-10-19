class Genre

    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
      @name = name
      @songs = []
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

    def self.create(new_genre)
      new_genre = Genre.new(name)
      new_genre.save
      new_genre
    end

    def add_song(song)
      if !song.genre
        song.genre = self
      end
      if !@songs.include?(song)
        @songs << song
      end
    end

    def artists
      # genres returns a collection of genres for all of the artist's songs
      # artist has many genres through songs
      # does not return duplicate genres if the artist has more than one song of a particular genre
      artist_array = self.songs.collect do |song|
        song.artist
        #binding.pry
     end
     artist_array.uniq
   end



  end
