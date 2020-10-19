require 'pry'

class Artist

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

    def self.create(new_artist)
      new_artist = Artist.new(name)
      new_artist.save
      new_artist
    end

    def add_song(song)
      if !song.artist
        song.artist = self
      end
      if !@songs.include?(song)
        @songs << song
      end
    end

    def genres
      # genres returns a collection of genres for all of the artist's songs
      # artist has many genres through songs
      # does not return duplicate genres if the artist has more than one song of a particular genre
      genre_array = self.songs.collect do |song|
        song.genre
        #binding.pry
     end
     genre_array.uniq
   end



 end
