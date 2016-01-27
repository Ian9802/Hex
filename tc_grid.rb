require_relative "grid"
require "test/unit"

class TestGrid < Test::Unit::TestCase
	def test_creation_center
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

	def test_nonzero_creation
		subject1 = Cube.new(4, 3)
		assert_equal(4, subject1.getx)
		assert_equal(3, subject1.gety)
		assert_equal(-7, subject1.getz)
		subject2 = Cube.new(-8, 2)
		assert_equal(-8, subject2.getx)
		assert_equal(2, subject2.gety)
		assert_equal(6, subject2.getz)
	end

	def test_large_creation
		subject1 = Cube.new(234324, -1245)
		assert_equal(234324, subject1.getx)
		assert_equal(-1245, subject1.gety)
		assert_equal(-233079, subject1.getz)
		subject2 = Cube.new(-8888888, 8888888)
		assert_equal(-8888888, subject2.getx)
		assert_equal(8888888, subject2.gety)
		assert_equal(0, subject2.getz)
	end

	def test_add
		subject1 = Cube.new(4, 3)
		subject2 = Cube.new(-8, 2)
		result = subject1.add(subject2)
		assert_equal(-4, result.getx)
		assert_equal(5, result.gety)
		assert_equal(-1, result.getz)
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
		assert_equal(true, center.adjacent(tl))
	end

	def test_tr_adj
		center = Cube.new(0,0)
		tr = Cube.new(0, 1)
		assert_equal(true, center.adjacent(tr))
	end

	def test_cl_adj
		center = Cube.new(0,0)
		cl = Cube.new(-1, 0)
		assert_equal(true, center.adjacent(cl))
	end

	def test_cr_adj
		center = Cube.new(0,0)
		cr = Cube.new(0, 1)
		assert_equal(true, center.adjacent(cr))
	end

	def test_bl_adj
		center = Cube.new(0,0)
		bl = Cube.new(0, -1)
		assert_equal(true, center.adjacent(bl))
	end

	def test_br_adj
		center = Cube.new(0,0)
		br = Cube.new(1, -1)
		assert_equal(true, center.adjacent(br))
	end

	def test_not_adj
		subject1 = Cube.new(4, 3)
		subject2 = Cube.new(-8, 2)
		assert_equal(false, subject1.adjacent(subject2))
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
end