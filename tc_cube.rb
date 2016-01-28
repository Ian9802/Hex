require_relative "cube"
require "test/unit"

class TestGrid < Test::Unit::TestCase
	def test_creation_center
		center = Cube.new(0, 0)
		assert_equal(0, center.getX)
		assert_equal(0, center.getY)
		assert_equal(0, center.getZ)
	end

	def test_creation
		ozn = Cube.new(1, 0)
		assert_equal(1, ozn.getX)
		assert_equal(0, ozn.getY)
		assert_equal(-1, ozn.getZ)
		zno = Cube.new(0, -1)
		assert_equal(0, zno.getX)
		assert_equal(-1, zno.getY)
		assert_equal(1, zno.getZ)
	end

	def test_nonzero_creation
		subject1 = Cube.new(4, 3)
		assert_equal(4, subject1.getX)
		assert_equal(3, subject1.getY)
		assert_equal(-7, subject1.getZ)
		subject2 = Cube.new(-8, 2)
		assert_equal(-8, subject2.getX)
		assert_equal(2, subject2.getY)
		assert_equal(6, subject2.getZ)
	end

	def test_large_creation
		subject1 = Cube.new(234324, -1245)
		assert_equal(234324, subject1.getX)
		assert_equal(-1245, subject1.getY)
		assert_equal(-233079, subject1.getZ)
		subject2 = Cube.new(-8888888, 8888888)
		assert_equal(-8888888, subject2.getX)
		assert_equal(8888888, subject2.getY)
		assert_equal(0, subject2.getZ)
	end

	def test_add
		subject1 = Cube.new(4, 3)
		subject2 = Cube.new(-8, 2)
		result = subject1.add(subject2)
		assert_equal(-4, result.getX)
		assert_equal(5, result.getY)
		assert_equal(-1, result.getZ)
	end

	def test_equal
		subject1 = Cube.new(4, 3)
		assert_equal(true, subject1.equals(Cube.new(4, 3)))
		subject2 = Cube.new(-8, 2)
		assert_equal(true, subject2.equals(Cube.new(-8, 2)))
		assert_equal(false, subject1.equals(subject2))
	end

	def test_tl_adj
		center = Cube.new(0,0)
		tl = Cube.new(-1, 1)
		assert_equal(true, center.isAdjacent(tl))
	end

	def test_tr_adj
		center = Cube.new(0,0)
		tr = Cube.new(0, 1)
		assert_equal(true, center.isAdjacent(tr))
	end

	def test_cl_adj
		center = Cube.new(0,0)
		cl = Cube.new(-1, 0)
		assert_equal(true, center.isAdjacent(cl))
	end

	def test_cr_adj
		center = Cube.new(0,0)
		cr = Cube.new(0, 1)
		assert_equal(true, center.isAdjacent(cr))
	end

	def test_bl_adj
		center = Cube.new(0,0)
		bl = Cube.new(0, -1)
		assert_equal(true, center.isAdjacent(bl))
	end

	def test_br_adj
		center = Cube.new(0,0)
		br = Cube.new(1, -1)
		assert_equal(true, center.isAdjacent(br))
	end

	def test_not_adj
		subject1 = Cube.new(4, 3)
		subject2 = Cube.new(-8, 2)
		assert_equal(false, subject1.isAdjacent(subject2))
	end

	def test_line
		center = Cube.new(0,0)
		tl = Cube.new(-1, 1)
		assert_equal(1, center.line(tl))

		tr = Cube.new(0, 1)
		assert_equal(1, center.line(tr))

		cl = Cube.new(-1, 0)
		assert_equal(1, center.line(cl))

		cr = Cube.new(0, 1)
		assert_equal(1, center.line(cr))

		bl = Cube.new(0, -1)
		assert_equal(1, center.line(bl))

		br = Cube.new(1, -1)
		assert_equal(1, center.line(br))

		dist = Cube.new(15, -15)
		assert_equal(15, center.line(dist))
	end

	def test_line_ext
		subject1 = Cube.new(4, 3)
		subject2 = Cube.new(-8, 2)
		assert_equal(-1, subject1.line(subject2))

		subject3 = Cube.new(17, -10)
		assert_equal(13, subject1.line(subject3))
		assert_equal(13, subject3.line(subject1))
	end

	def test_doubleEquality
		subject1 = Cube.new(0,0)
		subject2 = Cube.new(0,0)
		array = Array.new(1) {subject1}
		assert(array.include? subject1)
		assert(array.include? subject2)
	end
end