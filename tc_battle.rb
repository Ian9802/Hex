require_relative 'being'
require_relative 'battle'
require "test/unit"

class TestBattle < Test::Unit::TestCase
	def test_initialize
		battle = Battle.new()
		assert(!battle.getCreatures().nil?)
		assert_equal(7, battle.getCreatures.length)
		for i in (0..7)
			assert(battle.getCreatures[i].nil?)
		end
	end
	def test_addition
		battle = Battle.new()
		being = Rando.new()
		being.setTeam(0)
		battle.addCreature(being)
		assert_equal(1, battle.getCreatures[0].length)
		for i in (1..7)
			assert(battle.getCreatures[i].nil?)
		end
	end
	def test_targets
		battle = Battle.new()

		being = Rando.new()
		being.setTeam(0)
		being.setLoc(Cube.new(0,0))
		battle.addCreature(being)

		being = Rando.new()
		being.setTeam(0)
		being.setLoc(Cube.new(0,1))
		battle.addCreature(being)

		being = Rando.new()
		being.setTeam(1)
		being.setLoc(Cube.new(0,0))
		battle.addCreature(being)

		assert_equal(2, battle.getCreatures[0].length)
		assert_equal(1, battle.getCreatures[1].length)
		for i in (2..7)
			assert(battle.getCreatures[i].nil?)
		end
		targetted = [Cube.new(0,0)]
		targets = battle.getTargets(targetted)

		assert_equal(1, targets[0].length)
		assert_equal(1, targets[1].length)
		for i in (2..7)
			assert(targets[i].nil?)
		end
	end
	def test_ringTargets
		battle = Battle.new()
		loc = Cube.new(0,0)
		targets = battle.ringTargets(0, 1, loc)
		assert_equal(7, targets.length)
		assert(targets.include? Cube.new(0,0))
		assert(targets.include? Cube.new(0,-1))
		assert(targets.include? Cube.new(0,1))
		assert(targets.include? Cube.new(1,-1))
		assert(targets.include? Cube.new(1,0))
		assert(targets.include? Cube.new(-1,1))
		assert(targets.include? Cube.new(-1,0))
	end
	def test_wideRingTargets
		battle = Battle.new()
		loc = Cube.new(1,1)
		targets = battle.ringTargets(3, 3, loc)
		assert_equal(18, targets.length)
		assert(targets.include? Cube.new(4,-2))
		assert(targets.include? Cube.new(2,-4))
		assert(targets.include? Cube.new(-2,-2))
		assert(targets.include? Cube.new(-4,2))
		assert(targets.include? Cube.new(-2,4))
		assert(targets.include? Cube.new(2,2))
		assert(targets.include? Cube.new(4,-1))
		assert(targets.include? Cube.new(3,-4))
		assert(targets.include? Cube.new(-1,-3))
		assert(targets.include? Cube.new(-4,1))
		assert(targets.include? Cube.new(-3,4))
		assert(targets.include? Cube.new(1,3))
		assert(targets.include? Cube.new(4,0))
		assert(targets.include? Cube.new(4,-4))
		assert(targets.include? Cube.new(0,-4))
		assert(targets.include? Cube.new(-4,0))
		assert(targets.include? Cube.new(-4,4))
		assert(targets.include? Cube.new(0,4))
	end
end