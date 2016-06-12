require_relative 'attack'
require_relative 'dice'


p run = Attack.new(10, 7)
p run.attack
p run.display_all_rolls