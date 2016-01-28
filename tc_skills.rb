require_relative 'skills'
require_relative 'being'
require_relative 'cube'
require "test/unit"

class TestSkillsFull < Test::Unit::TestCase
	def setup
		@randoList = Array.new()
		for i in (0..37)
			@randoList.push(Rando.new())
		end
		counter = 0
		for i in (-3..3)
			for j in (-3..(3-(i.abs)))
				@randoList[counter].setloc(Cube.new(i,j))
				inputCreature(@randoList[counter])
				counter+=1
			end
		end
		@creature = @randoList[19]
		@creature.setteam(0)
	end

	# def test_jjjj
		
	# end

	# def test_randomSelection
		# @team = @creature.getteam
		# assert(!@creature.activate(method(:randomSelection)).nil?)
		# assert(!@creature.activate(randomSelection($creatures)).nil?)
		# assert(!@creature.activate(randomSelection($creatures)).nil?)
		# assert(!@creature.activate(randomSelection($creatures)).nil?)
		# assert(!@creature.activate(randomSelection($creatures)).nil?)
	# end

	# def test_rangedRandomAttack
	# 	@loc = Cube.new(0,0)
	# 	rangedRandomAttack[]
	# end

end

