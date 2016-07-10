class Rotation
	@id
	@owner
	@title
	@year
	@token
	@rmembers

	attr_accessor :id
	attr_accessor :owner
	attr_accessor :title
	attr_accessor :year
	attr_accessor :token
	attr_accessor :rmembers

	def set_rotation(id, owner, title, year, token, rmembers)
		@id = id
		@owner = owner
		@title = title
		@year = year
		@token = token
		@rmembers = rmembers
	end   #def

	def show_rotation
		# rotations.each do |rotation|
			result = "Rotation ##{@id}. #{@owner} - #{@title} (#{@year}) \n"
			counter = 0
			@rmembers.each do |rmember|
				#result += "#{rmember} \n"
				counter += 1
				result = result + " Member #{rmember.id}. #{rmember.name} \n"
			end #do each
		# end
		puts result
		# puts "The person who as the turn is #{@rmember[@token - 1].name}\n"
	end   #def

	def get_token_holder(token_holder)
		# rotations.each do |rotation|
		# result = "Rotation ##{@id}. #{@owner} - #{@title} (#{@year}) \n"
		# counter = 0
		token_holder = token_holder
		token_holder_name = ""
		@rmembers.each do |rmember|
			#result += "#{rmember} \n"
			# puts "token_holder = #{token_holder}"
			# puts "rmember.id = #{rmember.id}"
			if rmember.id == token_holder
				# puts "They equal -- yeay!"
				token_holder_name = rmember.name
				# puts "token_holder_name = #{token_holder_name}"
				# puts "rmember.name = #{rmember.name}"
				# puts
				# counter += 1
				# result = result + " Member #{rmember.id}. #{rmember.name} \n"
			else
				# puts "They don't equal"
				# puts "token_holder_name = #{token_holder_name}"
				# puts "rmember.name = #{rmember.name}"
				# puts
			# end
			# puts "The person who as the turn is #{@rmember[@token - 1].name}\n"
			end   #if
		end   #do each
		return token_holder_name
	end   #def
end   #class

class RMember
	@id
	@name
	@rotation_id

	attr_accessor :id
	attr_accessor :name
	attr_accessor :rotation_id

end   #class

# class RToken
# 	@id
# 	@rotation_id
# 	@rmember_id
#
# 	attr_accessor :id
# 	attr_accessor :rotation_id
# 	attr_accessor :rmember_id
#
# end

# Main program
puts "\nWelcome to Rotate! -- the app that keeps track of "
puts "whose turn it is to do something like: "
puts "  - Buy lunch "
puts "  - Pick the movie "
puts "  - Take out the trash "
puts "Rotate! remembers so you don't have to!"
rotation_array = []
rotation = Rotation.new
rotation_count = 0
exit = false
until exit == true
	puts "\nWhat would you like to do?\na) add a rotation \ns) show your rotations\nx) exit"
	action = gets.chomp.downcase
	case action
		when "a"
			# rotation = Rotation.new
			rotation_count += 1
			puts "Enter the rotation title? (e.g., Pay for lunch)"
			title = gets.chomp
			puts "Enter the rotation manager?"
			owner = gets.chomp
			puts "Enter the year that the rotation was created"
			year = gets.chomp.to_i
			done = false
			rmember_array = []
			rmember_count = 0
			token_holder = 0
			until done
				rmember = RMember.new
				puts "\nEnter a rotation member. Or enter 'd' when done"
				rmember_count += 1
				response = gets.chomp
				if response.downcase != "d"
					rmember.name = response
					rmember.id = rmember_count
					rmember.rotation_id = rotation_count
					rmember_array << rmember
					puts "Member #{rmember.id}. #{rmember.name}"
#					puts rmember_array
					puts "\nDo you want this person to have the next turn? [Enter 'y' or 'n']"
					response = gets.chomp.downcase

					if response == "y"

						if token_holder == 0
							puts "It's now #{rmember.name}'s turn in the rotation."
						else
							puts "The rotation has been modified. It's now #{rmember.name}'s turn."
						end   #if

						token_holder = rmember_count
						# puts " Member #{rmember_count}. #{rmember.name}"
						#puts rmember_array
					end   #if

				else
					rotation_array << rotation
					rotation.set_rotation(rotation_count,owner, title, year, token_holder, rmember_array)
					# puts rotation_array
					# puts "The person who has the turn is #{rmember_array[token_holder - 1].name}"
					puts "It's Rotation Member ##{rotation_array[((rotation.id).to_i) - 1].token}'s turn"
					puts
					# puts "That person who has the turn is #{rotation_array[ ((rotation_array[((rotation.id).to_i) - 1].token).to_i - 1) ].name}"
					done = true
				end   #if

			end   #until

		when "s"
			rotation = Rotation.new
			puts "\n\n\nHere are your rotations and rotation members: "
			puts
#			puts rotation_array  #<-- doesn't work
			rotation_array.each do |rotation|
				puts rotation.show_rotation
				token_holder = rotation_array[((rotation.id).to_i) - 1].token
				puts "It is currently Rotation Member ##{token_holder}'s turn"
				# rmember_holder = rotation_array[((rotation.id).to_i) - 1].rmember
				# token_holder_name = rotation_array[((rotation.id).to_i) - 1].rmember[token_holder - 1].name
				token_holder_name = rotation.get_token_holder(token_holder)
				puts "That person is #{token_holder_name}"
				# puts "The name in rotation_token is #{rotation_array[((rotation.id).to_i) - 1].token}"
				puts
				puts
			end   #do each
			# puts "The person who has the turn is #{rotation_array[rotation_array.length - 1][token_holder - 1][1]}"
			# rotation_array.each do |rotation|
			# 	puts rotation.show_rotation
			# 	puts

		when "x"
			puts "\nThanks for using Rotate!"
			puts
			exit = true
	end   #case

end   #main
