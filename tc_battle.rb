require_relative 'being'
require_relative 'battle'
require "test/unit"

class TestBattle < Test::Unit::TestCase
	def test_initialize
		battle = Battle.new()
		assert(!battle.getCreatures().nil?)
		assert_equal(7, battle.getCreatures.length)
	end
end