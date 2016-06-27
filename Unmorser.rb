# 1.8b UnMorser

def morser(code_phrase)
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
		
	puts "\nHere's your morse code phrase decrypted: "
	(0..(code_phrase.split('  ').length - 1)).each do |i|
		code_word = code_phrase.split('  ')[i]
		(0..(code_word.split(" ").length - 1)).each do |j|
			code_letter = code_word.split(" ")[j]
			if i==0 && j==0
				print morse_hashkey.invert[code_letter].upcase
			else
				print morse_hashkey.invert[code_letter]
			end
		end
		print " "
	end
	print "\n\n" 
	
end


puts "\nEnter a morse code phrase"
morser (gets.chomp)
	

