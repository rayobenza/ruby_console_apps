class RMember
	@name
	@hastoken

	attr_accessor :name
	attr_accessor :hastoken

end

class Rotation
	@owner
	@title
	@year
	@rmembers

	#attr_accessor :owner
	#attr_accessor :title
	#attr_accessor :year
	#attr_accessor :rmembers

	def set_rotation(owner, title, year, rmembers)
		@owner = owner
		@title = title
		@year = year
		@rmembers = rmembers
	end

	def get_rotation
		result = "#{@owner} - #{@title} (#{@year}) \n"
		counter = 0
		@rmembers.each do |rmember|
			#result += "#{rmember} \n"
			counter += 1
			result = result + " Member #{counter}. #{rmember.name} (#{rmember.hastoken}) \n"
		end
		return result
	end

end

rotation_array = []
rotation = Rotation.new
exit = false
until exit == true
	puts "What would you like to do?\na) add a rotation \nb) list your rotations\nx) exit"
	action = gets.chomp.downcase
	case action
		when "a"
			rotation = Rotation.new
			puts "Enter the rotation title?"
			title = gets.chomp
			puts "Enter the rotation manager?"
			owner = gets.chomp
			puts "Enter the year that the rotation was created"
			year = gets.chomp.to_i
			done = false
			rmember_array = []
			counter = 0
			until done
				rmember = RMember.new
				puts "Enter a rotation member. Or enter 'd' when done"
				counter += 1
				response = gets.chomp
				if response.downcase != "d"
					rmember.name = response
					rmember.hastoken = ""
					rmember_array << rmember
					puts "#{rmember.name} - #{rmember.hastoken}"
					puts rmember_array
					puts "Do you want this person to have the next turn? [Enter 'y' or 'n']"
					response = gets.chomp
						if response == "y"
							if !@rmembers.nil?
								puts "It's not nil"
#								rmember.hastoken = "My Turn"
#								puts "It's now #{rmember.name}'s turn in the rotation"
#							else
								rcounter = 0
								@rmembers.each do |rmember|
									rcounter += 1
									puts "rcounter is #{rcounter}"
	   							if rmember.hastoken == "My Turn"
										puts "Sorry, it's already someone else's turn"
										rmember.hastoken = ""
									else
										puts "It's now #{rmember.name}'s turn in the rotation"
										rmember.hastoken = "My Turn"
									end
								end
							end
						else
							rmember.hastoken = ""
						end
					puts " Member #{counter}. #{rmember.name} (#{rmember.hastoken})"
					#puts rmember_array
				else
					done = true
				end
			end
			rotation_array << rotation
			rotation.set_rotation(owner, title, year, rmember_array)

		when "b"
			rotation = Rotation.new
			puts "\nHere are your rotations and rotation members: "
			#puts rotation_array  <-- doesn't work
			#puts rotation.get_rotation
			rotation_array.each do |rotation|
				puts rotation.get_rotation
				puts
			end

		when "x"
			exit = true

	end

end
