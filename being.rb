require_relative 'skills'
require_relative 'cube'
class Being
	def initialize(name, hp, mp, atk, dfs, matk, mdfs, spd, skillList, team, loc)
		@name = name
		@hp = hp
		@mp = mp
		@atk = atk
		@dfs = dfs
		@matk = matk
		@mdfs = mdfs
		@spd = spd
		@skillList = skillList
		@team = team
		@loc = loc
	end

	def getname; return @name; end
	def gethp; return @hp; end
	def getmp; return @mp; end
	def getatk; return @atk; end
	def getdfs; return @dfs; end
	def getmatk; return @matk; end
	def getmatk; return @matk; end
	def getmdfs; return @mdfs; end
	def getspd; return @spd; end
	def getskillList; return @skillList; end
	def getteam; return @team; end

	def setname(mod); @name = mod; end
	def sethp(mod); @hp = mod; end
	def setmp(mod); @mp = mod; end
	def setatk(mod); @atk = mod; end
	def setdfs(mod); @dfs = mod; end
	def setmatk(mod); @matk = mod; end
	def setmatk(mod); @matk = mod; end
	def setmdfs(mod); @mdfs = mod; end
	def setspd(mod); @spd = mod; end
	def setskillList(mod); @skillList = mod; end
	def setteam(mod); @team = mod; end

	# This one doesn't even really make sense
	def adjustname(mod); @name += name; end
	def adjusthp(mod); @hp += mod; end
	def adjustmp(mod); @mp += mod; end
	def adjustatk(mod); @atk += mod; end
	def adjustdfs(mod); @dfs += mod; end
	def adjustmatk(mod); @matk += mod; end
	def adjustmatk(mod); @matk += mod; end
	def adjustmdfs(mod); @mdfs += mod; end
	def adjustspd(mod); @spd += mod; end
	# This one should probably be more complex, but leaving it for now, 
	# especially as it's an example.
	def adjustskillList(mod); @skillList += mod; end
	# This one doesn't even really make sense
	def adjustteam(mod); @team += team; end

	def getloc
		return @loc
	end
	def setloc(loc)
		@loc = loc
	end


	def dead()
		return @hp<=0
	end
	def defend(points)
		# This would need to be modified depending on how stats work
		result = points - @dfs
		if result > 0
			adjusthp(-result)
		end
	end
	def mdefend(points)
		# ^^
		result = points - @mdfs
		if result > 0
			adjusthp(-result)
		end
	end
	def dodge(points)
		# not even 100% sure what *I* mean here
		# something like hit chance vs dodge chance, assuming it's based off of speed
		# speed btw would be like literal steps as it currently stands
		return points > @spd *7.5
	end
	# apparently this does not now, nor will it ever, work
	# def activate(funciton)
	# 	function.call
	# end
	def activate()
		@skillList[0].call
	end
end

class Rando < Being
	def initialize()
		super("The Unnameable", 
			(rand()*400).round(0) + 100,
			(rand()*70).round(0) + 10,
			(rand()*70).round(0) + 10,
			(rand()*70).round(0) + 10,
			(rand()*70).round(0) + 10,
			(rand()*70).round(0) + 10,
			(rand()*4).round(0) + 1,
			[method(:nameThySelf)],
			# this could also be (rand()*5).round(0) to allow friendly rando's
			(rand()*4).round(0) +1,
			# needs to be changed after creation
			Cube.new(0,0)
		)
	end
end
