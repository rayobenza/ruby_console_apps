class Song
	@name
	@duration

	attr_accessor :name
	attr_accessor :duration

	#def set_song(number, name, duration)
	#	@num = num
	#	@name = name
	#	@duration = duration
	#end
	#
	#def get_song
	#	@name = name
	#	@duration = duration
	#end
end

class Album
	@artist
	@title
	@year
	@tracks

	#attr_accessor :artist
	#attr_accessor :title
	#attr_accessor :year
	#attr_accessor :tracks

	def set_album(artist, title, year, tracks)
		@artist = artist
		@title = title
		@year = year
		@tracks = tracks
	end

	def get_album
		result = "#{@artist} - #{@title} (#{@year}) \n"
		counter = 0
		@tracks.each do |track|
			#result += "#{track} \n"
			counter += 1
			result = result + " Track #{counter}. #{track.name} (#{track.duration}) \n"
		end
		return result
	end

end

=begin
song_array = []   #create array of unknown length vs. Array.new(10)
song = Song.new
song.name = "Purple Rain"
song.duration = "3.53"
song_array << song  #add song instance to song_array
#line above is that same as saying next 2 lines
#song_array.length + 1
#song_array[-1] = song

song = Song.new
song.name = "1999"
song.duration = "4.19"
song_array << song


prince = Album.new
#prince.set_album("Prince", "1999", 1993, ["One", "Two"])
prince.set_album("Prince", "1999", 1993, song_array)
#prince.print_album
puts
puts "Here's your album and tracklist: "
puts prince.get_album
puts
=end

album_array = []
album = Album.new
exit = false
until exit == true
	puts "What would you like to do?\na) add an album \nb) list your albums\nx) exit"
	action = gets.chomp.downcase
	case action
		when "a"
			album = Album.new
			puts "Enter the album artist?"
			artist = gets.chomp
			puts "Enter the album title?"
			title = gets.chomp
			puts "Enter the year that the album was released"
			year = gets.chomp.to_i
			done = false
			song_array = []
			counter = 0
			until done
				song = Song.new
				puts "Enter a track title. Or enter 'd' when done"
				counter += 1
				response = gets.chomp
				if response.downcase != "d"
					song.name = response
					puts "Enter the song duration [m:ss]"
					song.duration = gets.chomp
					puts " Track #{counter}. #{song.name} - #{song.duration}"
					song_array << song
					#puts song_array
				else
					done = true
				end
			end
			album_array << album
			album.set_album(artist, title, year, song_array)

		when "b"
			album = Album.new
			puts "\nHere are your albums and tracks: "
			#puts album_array  <-- doesn't work
			#puts album.get_album
			album_array.each do |album|
				puts album.get_album
				puts
			end

		when "x"
			exit = true

	end

end
