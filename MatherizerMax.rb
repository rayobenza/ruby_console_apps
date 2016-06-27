# 1.4b Matherizer

## Math calculation Method
def matherizer(math_phrase)
		
	math_word = Array.new(1)
	#math_int = Array.new(2)
	puts "\nHere's the result: "
	if math_phrase.count('+') > 0
		(0..(math_phrase.split('+').length - 1)).each do |i|
			math_word[i] = math_phrase.split('+')[i].to_i
			#math_int[i] = math_word[i].to_i
		end
		result = math_word[0] + math_word[1] 
		puts "#{math_word[0]} + #{math_word[1]} = #{result}"

	elsif math_phrase.count('-') > 0
		(0..(math_phrase.split('-').length - 1)).each do |i|
			math_word[i] = math_phrase.split('-')[i].to_i
		end
		result = math_word[0] - math_word[1] 
		puts "#{math_word[0]} - #{math_word[1]} = #{result}"

	elsif math_phrase.count('*') > 0
		(0..(math_phrase.split('*').length - 1)).each do |i|
			math_word[i] = math_phrase.split('*')[i].to_i
		end
		result = math_word[0] * math_word[1] 
		puts "#{math_word[0]} * #{math_word[1]} = #{result}"

	elsif math_phrase.count('/') > 0
		(0..(math_phrase.split('/').length - 1)).each do |i|
			math_word[i] = math_phrase.split('/')[i].to_f.round(2)
		end
		result = (math_word[0] / math_word[1]).round(4) 
		puts "#{math_word[0].round(0)} \u00f7 #{math_word[1].round(0)} = #{result}"
	end
	
end


## Main program
exit = false
until exit == true
	puts "\nEnter a math operation with integers like '11 - 8' or '3 * 2' or '6 / 4'"
	matherizer(gets.chomp)
	
	puts "\nPerform another math operation? [type 'y' or 'n']"
	action = gets.chomp.downcase
	if action == "n"
		exit = true
	end
end

	