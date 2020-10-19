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



  end
