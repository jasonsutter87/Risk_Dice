class Dice
	attr_reader :sides
	
	def initialize(args={})
		@sides = [1,2,3,4,5,6]
	end

	def roll
		sides.sample
	end
end
