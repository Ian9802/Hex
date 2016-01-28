include Enumerable
class Cube
	def initialize(x,y)
		@x = x
		@y = y 
		@z = -x-y
	end
	def getX; return @x; end
	def getY; return @y; end
	def getZ; return @z; end
	def add(shift)
		return Cube.new(@x+shift.getX, @y+shift.getY)
	end
	def equals(target)
		if @x == target.getX
			if @y == target.getY
				return true
			else 
				return false
			end
		else 
			return false
		end
	end
	@@directions = [
		Cube.new(0, 1),
		Cube.new(0, -1),
		Cube.new(-1, 1),
		Cube.new(-1, 0),
		Cube.new(1, -1),
		Cube.new(1, 0)
	]
	# Could also be a line length 1, leaving as is for now
	def isAdjacent(target)
		if self.add(@@directions[0]).equals(target)
			return true
		elsif self.add(@@directions[1]).equals(target)
			return true
		elsif self.add(@@directions[2]).equals(target)
			return true
		elsif self.add(@@directions[3]).equals(target)
			return true
		elsif self.add(@@directions[4]).equals(target)
			return true
		elsif self.add(@@directions[5]).equals(target)
			return true
		else
			return false
		end
	end
	def listAdjacents
		locations = Array.new()
		locations.push(self.add(@@directions[0]))
		locations.push(self.add(@@directions[1]))
		locations.push(self.add(@@directions[2]))
		locations.push(self.add(@@directions[3]))
		locations.push(self.add(@@directions[4]))
		locations.push(self.add(@@directions[5]))
		return locations
	end
	def distance(target)
		return [(@x - target.getX).abs, (@y - target.getY).abs, (@z - target.getZ)].max
	end
	def line(target)
		if @x == target.getX
			return distance(target)
		elsif @y == target.getY
			return distance(target)
		elsif @z == target.getZ
			return distance(target)
		else
			return -1
		end
	end
	def rotateIn()
		# clockwise
		return Cube.new(-@z, -@x)
	end
	def rotateOut()
		#anticlockwise
		return Cube.new(-@y, -@z)
	end
			
end



# xlen = 7
# ylen = 6

# x = Array.new(xlen)
# for i in (0..(x.length-1)) do
# 	x[i]=Array.new(ylen)
# end

# xc=0
# for y in x do
# 	yc=0
# 	for i in (0..(y.length-1)) do
# 		loc = Cube.new(xc, yc)
# 		y[i] = loc
# 		yc+=1
# 	end
# 	xc+=1
# end


