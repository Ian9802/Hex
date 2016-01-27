include Enumerable
class Cube
	def initialize(x,y)
		@x = x
		@y = y 
		@z = -x-y
	end
	def getx; return @x; end
	def gety; return @y; end
	def getz; return @z; end
	def add(shift)
		return Cube.new(@x+shift.getx, @y+shift.gety)
	end
	def equals(target)
		if @x == target.getx
			if @y == target.gety
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
		return [(@x - target.getx).abs, (@y - target.gety).abs, (@z - target.getz)].max
	end
	def line(target)
		if @x == target.getx
			return distance(target)
		elsif @y == target.gety
			return distance(target)
		elsif @z == target.getz
			return distance(target)
		else
			return -1
		end
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


