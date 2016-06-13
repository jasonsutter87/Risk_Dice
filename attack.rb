class Attack

	@@current_roll = []
	@@total_rolls = []

	attr_accessor :attackers, :defenders

	def initialize(attackers, defenders)
		@attackers = attackers
		@defenders = defenders
	end

	def new_dice_obj
		Dice.new
	end

	def add_dice
		@@current_roll << new_dice_obj.roll
	end


	def attack
		return "attackers is the only one left, count: #{[@attackers, @defenders]}" if @defenders < 1
		return "defenders is the only one left , count: #{[@attackers, @defenders]}" if @attackers < 1
		puts "Im counting down on attackers, current count is at: #{attackers}"
		
		if @attackers >= 3
			3.times { add_dice }
			@@total_rolls << {name: "attacker", roll: @@current_roll.sort.reverse }
		elsif @attackers >= 2
			2.times { add_dice }
			@@total_rolls << {name: "attacker", roll: @@current_roll.sort.reverse }
		else
			add_dice
			@@total_rolls << {name: "attacker", roll: @@current_roll }
		end
		attackers_last_roll = @@current_roll.sort.reverse  
		@@current_roll = []
		
		puts "Im counting down on defenders, current count is at: #{defenders}"
	
		if @defenders >= 2
			2.times { add_dice }
			@@total_rolls << {name: "defender", roll: @@current_roll.sort.reverse }
		else
			add_dice
			@@total_rolls << {name: "defender", roll: @@current_roll }
		end

		if  attackers_last_roll[1] != nil && @@current_roll.sort.reverse[1] != nil 
			if attackers_last_roll[0] > @@current_roll.sort.reverse[0] &&  attackers_last_roll[1] >= @@current_roll.sort.reverse[1]
				@defenders -= 2
			elsif attackers_last_roll[0] < @@current_roll.sort.reverse[0] &&  attackers_last_roll[1] <= @@current_roll.sort.reverse[1]
				@attackers -= 2
			elsif attackers_last_roll[0] >= @@current_roll.sort.reverse[0] &&  attackers_last_roll[1] <= @@current_roll.sort.reverse[1]
				@attackers -= 1
				@defenders -= 1
			elsif attackers_last_roll[0] <= @@current_roll.sort.reverse[0] &&  attackers_last_roll[1] >= @@current_roll.sort.reverse[1]
				@attackers -= 1
				@defenders -= 1

			end
		else
			if attackers_last_roll[0] > @@current_roll.sort.reverse[0]
				@defenders -= 1
			else 
				@attackers -= 1
				
			end
		end
			
		p "the last roll was #{[attackers_last_roll, @@current_roll.sort.reverse ]}"

		@@current_roll = []
		attack
	end

	def display_all_rolls
		@@total_rolls 
	end

end