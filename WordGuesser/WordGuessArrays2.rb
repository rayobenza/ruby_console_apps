# WordGuessArrays2

def wordfinder(word)
	
	phrase_array = []
	letter_array = []
	word_array = []
	word_array = word.split{""}
	(0..(word.split("").length - 1)).each do |i|
		word_array[i] = word.split("")[i]
	end
	puts "You entered #{word_array}"

	File.foreach( 'WordBank20Kclean.txt' ) do |line|
		letter_array = line.split("")
		phrase_array << letter_array
		
	end
	puts

	i = 0
	puts "\nThe following common words start with '#{word}':"	
	
	(0..(phrase_array.length - 1)).each do |i|
		match = true
		
		
		(0..(word_array.length - 1)).each do |j|
			if word_array[j] != phrase_array[i][j]
				match = false
			end
			
		end
		if match == true
			(0..(phrase_array[i].length - 1)).each do |k|
				print phrase_array[i][k]
			end
		
		end
	end
	
end


puts "\nType in the first several letters of the word you're looking for: "
wordfinder(gets.chomp)

