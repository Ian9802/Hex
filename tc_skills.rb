# require_relative 'skills'
# require_relative 'being'
# require_relative 'cube'
# require "test/unit"
# This whole thing is going to stay a mess until battle is sorted out, because it really needs it
# class TestSkillsFull < Test::Unit::TestCase
# 	def setup
# 		establishCreatures()
# 		@randoList = Array.new()
# 		for i in (0..37)
# 			@randoList.push(Rando.new())
# 		end
# 		counter = 0
# 		for i in (-3..3)
# 			for j in (-3..(3-(i.abs)))
# 				@randoList[counter].setloc(Cube.new(i,j))
# 				inputCreature(@randoList[counter])
# 				counter+=1
# 			end
# 		end
# 		# @beast = @randoList[19]
# 		# @beast.setteam(0)
# 		# @beast.setskillList([send(:randomSelection, $creatures)])
# 	end

# 	def teardown
# 		$creatures.clear()
# 	end

# 	def test_setup
# 	end

# 	def test_randomSelection
# 		# @team = 0
# 		# assert(!randomSelection($creatures).nil?)
# 		# @team = @beast.getteam()
# 		# assert(!@beast.activate().nil?)
# 		# assert(!@beast.activate(randomSelection($creatures)).nil?)
# 		# assert(!@beast.activate(randomSelection($creatures)).nil?)
# 		# assert(!@beast.activate(randomSelection($creatures)).nil?)
# 		# assert(!@beast.activate(randomSelection($creatures)).nil?)
# 	end

# 	# def test_rangedRandomAttack
# 	# 	@loc = Cube.new(0,0)
# 	# 	rangedRandomAttack[]
# 	# end

# end

