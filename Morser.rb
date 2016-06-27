# Morser

def morser(phrase)
	morse_hashkey = {
		"a" => ".-",
		"b" => "-...",
		"c" => "-.-.",
		"d" => "-..",
		"e" => ".",
		"f" => "..-.",
		"g" => "--.",
		"h" => "....",
		"i" => "..",
		"j" => ".---",
		"k" => "-.-",
		"l" => ".-..",
		"m" => "--",
		"n" => "-.",
		"o" => "---",
		"p" => ".--.",
		"q" => "--.-",
		"r" => ".-.",
		"s" => "...",
		"t" => "-",
		"u" => "..-",
		"v" => "...-",
		"w" => ".--",
		"x" => "-..-",
		"y" => "-.--",
		"z" => "--..",
		}

	chars = phrase.split("")
	puts "Number of characters is #{chars.length}"
	puts "Last character is #{chars[(chars.length - 1)]}"
	puts
	puts "Your phrase in morse code is:\n"
	
	chars.each do |chars|
		print morse_hashkey[chars]
		print " "


	end
	puts "\n\n"
end
	
puts "Enter a short phrase"
morser (gets.chomp.downcase)

