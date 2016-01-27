require_relative "being"
require "test/unit"

class TestBeing < Test::Unit::TestCase
	def test_get_frank
		frank = Being.new("frank", 4, 10, 100, 50, 100, 50, 4, [method(:alo)], 1)
		assert_equal("frank", frank.getname)
		assert_equal(4, frank.gethp)
		assert_equal(10, frank.getmp)
		assert_equal(100, frank.getatk)
		assert_equal(50, frank.getdfs)
		assert_equal(100, frank.getmatk)
		assert_equal(50, frank.getmdfs)
		assert_equal(4, frank.getspd)
		assert_equal(method(:alo), frank.getskillList[0])
		assert_equal(1, frank.getteam)

		assert_equal("hoi", frank.getskillList[0].call)
	end

	def test_rando
		rando = Rando.new()
		# also checked to make sure these work at exactly 0 and max
		assert_equal("The Unnameable", rando.getname)
		assert(rando.gethp.between?(100, 500))
		assert(rando.getmp.between?(10, 80))
		assert(rando.getatk.between?(10, 80))
		assert(rando.getdfs.between?(10, 80))
		assert(rando.getmatk.between?(10, 80))
		assert(rando.getmdfs.between?(10, 80))
		assert(rando.getspd.between?(1, 5))
		# missign skill list
		assert(rando.getteam.between?(0, 5))
	end
end