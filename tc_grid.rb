require_relative "grid"
require "test/unit"

class TestGrid < Test::Unit::TestCase
	def creation_center
		center = Cube.new(0, 0)
		assert_equal(0, center.getx)
		assert_equal(0, center.gety)
		assert_equal(0, center.getz)
	end

	def test_creation
		ozn = Cube.new(1, 0)
		assert_equal(1, ozn.getx)
		assert_equal(0, ozn.gety)
		assert_equal(-1, ozn.getz)
		zno = Cube.new(0, -1)
		assert_equal(0, zno.getx)
		assert_equal(-1, zno.gety)
		assert_equal(1, zno.getz)
	end

	def nonzero_creation
		subject1 = Cube.new(4, 3)
		assert_equal(4, subject1.getx)
		assert_equal(3, subject1.gety)
		assert_equal(-7, subject1.getz)
		subject2 = Cube.new(-8, 2)
		assert_equal(-8, subject2.getx)
		assert_equal(2, subject2.gety)
		assert_equal(6, subject2.getz)
	end

	def large_creation
		subject1 = Cube.new(234324, -1245)
		assert_equal(234324, subject1.getx)
		assert_equal(-1245, subject1.gety)
		assert_equal(-233079, subject1.getz)
		subject2 = Cube.new(-8888888, 8888888)
		assert_equal(-8888888, subject2.getx)
		assert_equal(8888888, subject2.gety)
		assert_equal(0, subject2.getz)
	end

	def add_test
		subject1 = Cube.new(4, 3)
		subject2 = Cube.new(-8, 2)
		result = subject1.add(subject2)
		assert_equal(-4, subject2.getx)
		assert_equal(5, subject2.gety)
		assert_equal(-1, subject2.getz)
	end

	def equal_test
		subject1 = Cube.new(4, 3)
		assert(true, subject1.equal(Cube.new(4, 3)))
		subject2 = Cube.new(-8, 2)
		assert(true, subject1.equal(Cube.new(-8, 2)))
		assert(false, subject1.equal(subject2))
	end

	def tl_adj
		center = Cube.new(0,0)
		tl = Cube.new(-1, 1)
		assert(true, center.adjacent(tl))
	end

	def tr_adj
		center = Cube.new(0,0)
		tr = Cube.new(0, 1)
		assert(true, center.adjacent(tr))
	end

	def cl_adj
		center = Cube.new(0,0)
		cl = Cube.new(-1, 0)
		assert(true, center.adjacent(cl))
	end

	def cr_adj
		center = Cube.new(0,0)
		cr = Cube.new(0, 1)
		assert(true, center.adjacent(cr))
	end

	def bl_adj
		center = Cube.new(0,0)
		bl = Cube.new(0, -1)
		assert(true, center.adjacent(bl))
	end

	def br_adj
		center = Cube.new(0,0)
		br = Cube.new(1, -1)
		assert(true, center.adjacent(br))
	end

	def not_adj
		subject1 = Cube.new(4, 3)
		subject2 = Cube.new(-8, 2)
		assert(false, subject1.adjacent(subject2))
	end
end