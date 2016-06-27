class Cash
	@change
	
	attr_accessor :change
	
	def get_change(price, paid)
		@change = paid.round(3) - price.round(3)
		cash = ""

		counter = 0
		until @change.round(3) < 10
			@change -= 10
			#puts @change
			counter += 1
		end
		if counter > 1
			cash += "\n\s#{counter} $10 bills"
		elsif counter == 1
			cash += "\n\s#{counter} $10 bill"
		end

		counter = 0
		until @change.round(3) < 5
			@change -= 5
			#puts @change
			counter += 1
		end
		if counter > 1
			cash += "\n\s#{counter} $5 bills"
		elsif counter == 1
			cash += "\n\s#{counter} $5 bill"
		end

		counter = 0
		until @change.round(3) < 1
			@change -= 1
			#puts @change
			counter += 1
		end
		if counter > 1
			cash += "\n\s#{counter} $1 bills"
		elsif counter == 1
			cash += "\n\s#{counter} $1 bill"
		end

		counter = 0
		until @change.round(3) < 0.25
			@change -= 0.25
			#puts @change
			counter += 1
		end
		if counter > 1
			cash += "\n\s#{counter} quarters"
		elsif counter == 1
			cash += "\n\s#{counter} quarter"
		end

		counter = 0
		until @change.round(3) < 0.10
			@change -= 0.10
			#puts @change
			counter += 1
		end
		if counter > 1
			cash += "\n\s#{counter} dimes"
		elsif counter == 1
			cash += "\n\s#{counter} dime"
		end

		counter = 0
		until @change.round(3) < 0.05
			@change -= 0.05
			#puts @change
			counter += 1
		end
		if counter > 1
			cash += "\n\s#{counter} nickles"
		elsif counter == 1
			cash += "\n\s#{counter} nickle"
		end

		counter = 0
		until @change.round(3) < 0.01
			@change -= 0.01
			#puts @change
			counter += 1
		end
		if counter > 1
			cash += "\n\s#{counter} pennies"
		elsif counter == 1
			cash += "\n\s#{counter} penny"
		end
		
		return cash
		
	end
	
end

register = Cash.new
puts "\nWhat is the price of the item?"
price = gets.chomp.to_f
puts "\nHow much was given to pay for the item?"
paid = gets.chomp.to_f
owed = paid - price
#puts paid
puts "\nThe change is #{owed.round(2)}"
puts "Paid as: #{register.get_change(price, paid)}\n\n"
