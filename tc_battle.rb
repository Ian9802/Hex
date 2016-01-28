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
	def test_removal
		battle = Battle.new()
		being = Rando.new()
		being.setTeam(0)
		battle.addCreature(being)
		assert_equal(1, battle.getCreatures[0].length)
		battle.removeCreature(being)
		for i in (0..7)
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
	def test_getTargets
		battle = Battle.new()

		being1 = Rando.new()
		being1.setTeam(0)
		being1.setLoc(Cube.new(0,0))
		battle.addCreature(being1)

		being2 = Rando.new()
		being2.setTeam(0)
		being2.setLoc(Cube.new(0,1))
		battle.addCreature(being2)

		being3 = Rando.new()
		being3.setTeam(1)
		being3.setLoc(Cube.new(0,0))
		battle.addCreature(being3)

		being4 = Rando.new()
		being4.setTeam(1)
		being4.setLoc(Cube.new(2,0))
		battle.addCreature(being4)

		loc = Cube.new(0,0)
		hexes = battle.ringTargets(0, 1, loc)
		targets = battle.getTargets(hexes)
		assert_equal(7, targets.length)
		assert_equal(2, targets[0].length)
		assert_equal(1, targets[1].length)
		for i in (2..7)
			assert(targets[i].nil?)
		end
		assert(targets[0].include?(being1))
		assert(targets[0].include? being2)
		assert(targets[1].include? being3)
		assert(!(targets.include? being4))
	end
	def test_randomTargetSelection
		battle = Battle.new()

		being1 = Rando.new()
		being1.setTeam(0)
		being1.setLoc(Cube.new(0,0))
		battle.addCreature(being1)

		being2 = Rando.new()
		being2.setTeam(0)
		being2.setLoc(Cube.new(0,1))
		battle.addCreature(being2)

		being3 = Rando.new()
		being3.setTeam(1)
		being3.setLoc(Cube.new(0,0))
		battle.addCreature(being3)

		target = battle.randomTargetSelection(battle.getCreatures, 0, 0)
		assert_equal(0, target.length)

		target = battle.randomTargetSelection(battle.getCreatures, 0, 1)
		selected = target[0]
		creature = battle.getCreatures[selected[:team]][selected[:target]]
		assert_equal(1, target.length)
		assert_equal(being3, creature)

		target = battle.randomTargetSelection(battle.getCreatures, 0, 2)
		selected = target[0]
		creature = battle.getCreatures[selected[:team]][selected[:target]]
		assert_equal(2, target.length)
		assert_equal(being3, creature)
		selected = target[1]
		creature = battle.getCreatures[selected[:team]][selected[:target]]
		assert_equal(2, target.length)
		assert_equal(being3, creature)
	end
	def test_randomTargetAny
		battle = Battle.new()

		being1 = Rando.new()
		being1.setTeam(0)
		being1.setLoc(Cube.new(0,0))
		battle.addCreature(being1)

		being2 = Rando.new()
		being2.setTeam(0)
		being2.setLoc(Cube.new(0,1))
		battle.addCreature(being2)

		being3 = Rando.new()
		being3.setTeam(1)
		being3.setLoc(Cube.new(0,0))
		battle.addCreature(being3)

		target = battle.randomTargetAny()
		assert_equal(1, target.length)
		selected = target[0]
		creature = battle.getCreatures[selected[:team]][selected[:target]]
		if creature == being1
			assert(true)
		elsif creature == being2
			assert(true)
		elsif creature == being3
			assert(true)
		else
			assert(false)
		end
	end
	def test_complete
		battle = Battle.new()

		being1 = Rando.new()
		being1.setTeam(0)
		being1.setLoc(Cube.new(0,0))
		battle.addCreature(being1)

		being2 = Rando.new()
		being2.setTeam(0)
		being2.setLoc(Cube.new(0,1))
		battle.addCreature(being2)

		being3 = Rando.new()
		being3.setTeam(1)
		being3.setLoc(Cube.new(0,0))
		battle.addCreature(being3)
		
		assert(!battle.complete)
		battle.removeCreature(being3)
		assert(battle.complete)
	end

end