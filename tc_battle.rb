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
end