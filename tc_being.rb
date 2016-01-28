require_relative 'being'
require_relative 'cube'
require "test/unit"

class TestBeing < Test::Unit::TestCase
	def test_get_frank
		frank = Being.new("frank", 4, 10, 100, 50, 100, 50, 4, [method(:alo)], 1, Cube.new(0,0))
		assert_equal("frank", frank.getName)
		assert_equal(4, frank.getHp)
		assert_equal(10, frank.getMp)
		assert_equal(100, frank.getAtk)
		assert_equal(50, frank.getDfs)
		assert_equal(100, frank.getMatk)
		assert_equal(50, frank.getMdfs)
		assert_equal(4, frank.getSpd)
		assert_equal(method(:alo), frank.getSkillList[0])
		assert_equal(1, frank.getTeam)
		assert(frank.getLoc.equals(Cube.new(0,0)))

		assert_equal("hoi", frank.getSkillList[0].call([]))
		assert_equal("hoi", frank.activate(0, []))
	end

	def test_rando
		rando = Rando.new()
		# also checked to make sure these work at exactly 0 and max
		assert_equal("The Unnameable", rando.getName)
		assert(rando.getHp.between?(100, 500))
		assert(rando.getMp.between?(10, 80))
		assert(rando.getAtk.between?(10, 80))
		assert(rando.getDfs.between?(10, 80))
		assert(rando.getMatk.between?(10, 80))
		assert(rando.getMdfs.between?(10, 80))
		assert(rando.getSpd.between?(1, 5))
		# missign skill list
		assert(rando.getTeam.between?(0, 5))
	end
end