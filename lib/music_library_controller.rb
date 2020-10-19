class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    importer = MusicImporter.new(path)
    importer.import

  end

  def call
    input = ""
    until input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
    end
  end

  def list_songs
    song_list = Song.all.sort {|song1, song2| song1.name <=> song2.name}
    song_list.each.with_index(1) { |song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artist
    artist_list = Artist.all.sort {|artist1, artist2| artist1.name <=> artist2.name}
    artist_list.each.with_index(1) { |artist, index| puts "#{index}. #{artist.name}"}
  end

  def list_genre
    genre_list = Genre.all.sort {|genre1, genre2| genre1.name <=> genre2.name}
    genre_list.each.with_index(1) { |genre, index| puts "#{index}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
    if Artist.find_by_name(artist_name)
      list = Artist.find_by_name(artist_name).songs.sort do |song1, song2|
        song1.name <=> song2.name
      end
      list.each.with_index(1) do |song, index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end
end
