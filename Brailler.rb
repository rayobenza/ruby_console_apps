# Convert to Braille

def brailler(phrase)
	braille_hashkey1 = {
		"a" => "0 ",
		"b" => "0 ",
		"c" => "00",
		"d" => "00",
		"e" => "0 ",
		"f" => "00",
		"g" => "00",
		"h" => "0 ",
		"i" => " 0",
		"j" => " 0",
		"k" => "0 ",
		"l" => "0 ",
		"m" => "00",
		"n" => "00",
		"o" => "0 ",
		"p" => "00",
		"q" => "00",
		"r" => "0 ",
		"s" => " 0",
		"t" => " 0",
		"u" => "0 ",
		"v" => "0 ",
		"w" => "00",
		"x" => "00",
		"y" => "00",
		"z" => "0 ",
		}

	braille_hashkey2 = {
		"a" => "  ",
		"b" => "0 ",
		"c" => "  ",
		"d" => " 0",
		"e" => " 0",
		"f" => "0 ",
		"g" => "00",
		"h" => "00",
		"i" => "0 ",
		"j" => "00",
		"k" => "  ",
		"l" => "0 ",
		"m" => "  ",
		"n" => " 0",
		"o" => " 0",
		"p" => "0 ",
		"q" => "00",
		"r" => "00",
		"s" => "0 ",
		"t" => "00",
		"u" => "  ",
		"v" => "0 ",
		"w" => "00",
		"x" => "  ",
		"y" => " 0",
		"z" => " 0",
		}

	braille_hashkey3 = {
		"a" => "  ",
		"b" => "  ",
		"c" => "  ",
		"d" => "  ",
		"e" => "  ",
		"f" => "  ",
		"g" => "  ",
		"h" => "  ",
		"i" => "  ",
		"j" => "  ",
		"k" => "0 ",
		"l" => "0 ",
		"m" => "0 ",
		"n" => "0 ",
		"o" => "0 ",
		"p" => "0 ",
		"q" => "0 ",
		"r" => "0 ",
		"s" => "0 ",
		"t" => "0 ",
		"u" => "00",
		"v" => "00",
		"w" => " 0",
		"x" => "00",
		"y" => "00",
		"z" => "00",
		}
		
		
	chars = phrase.split("")
	puts "\nNumber of characters is #{chars.length}"
	puts "Last character is #{chars[(chars.length - 1)]}"
	puts
	puts "Your phrase in braille is:\n"
	
	chars.each do |chars|
		print braille_hashkey1[chars]
		print " "
	end
	puts 
	chars.each do |chars|
		print braille_hashkey2[chars]
		print " "
	end
	puts 
	chars.each do |chars|
		print braille_hashkey3[chars]
		print " "
	end
	puts
end
	
puts "Enter a short phrase"
brailler(gets.chomp.downcase)

