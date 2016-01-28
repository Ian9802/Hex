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

	def getName; return @name; end
	def getHp; return @hp; end
	def getMp; return @mp; end
	def getAtk; return @atk; end
	def getDfs; return @dfs; end
	def getMatk; return @matk; end
	def getMdfs; return @mdfs; end
	def getSpd; return @spd; end
	def getSkillList; return @skillList; end
	def getTeam; return @team; end

	def setName(mod); @name = mod; end
	def setHp(mod); @hp = mod; end
	def setMp(mod); @mp = mod; end
	def setAtk(mod); @atk = mod; end
	def setDfs(mod); @dfs = mod; end
	def setMatk(mod); @matk = mod; end
	def setMatk(mod); @matk = mod; end
	def setMdfs(mod); @mdfs = mod; end
	def setSpd(mod); @spd = mod; end
	def setSkillList(mod); @skillList = mod; end
	def setTeam(mod); @team = mod; end

	# This one doesn't even really make sense
	def adjustName(mod); @name += name; end
	def adjustHp(mod); @hp += mod; end
	def adjustMp(mod); @mp += mod; end
	def adjustAtk(mod); @atk += mod; end
	def adjustDfs(mod); @dfs += mod; end
	def adjustMatk(mod); @matk += mod; end
	def adjustMatk(mod); @matk += mod; end
	def adjustMdfs(mod); @mdfs += mod; end
	def adjustSpd(mod); @spd += mod; end
	# This one should probably be more complex, but leaving it for now, 
	# especially as it's an example.
	def adjustSkillList(mod); @skillList += mod; end
	# This one doesn't even really make sense
	def adjustTeam(mod); @team += team; end

	def getLoc
		return @loc
	end
	def setLoc(loc)
		@loc = loc
	end


	def dead()
		return @hp<=0
	end
	def defend(points)
		# This would need to be modified depending on how stats work
		result = points - @dfs
		if result > 0
			adjustHp(-result)
		end
		return self
	end
	def mdefend(points)
		# ^^
		result = points - @mdfs
		if result > 0
			adjustHp(-result)
		end
		return self
	end
	def dodge(points)
		# not even 100% sure what *I* mean here
		# something like hit chance vs dodge chance, assuming it's based off of speed
		# speed btw would be like literal steps as it currently stands
		return points > @spd *7.5
	end
	# should have an input for which to call, but this is testing.
	# probably also .call(args)
	def activate(number, args)
		args = args.merge({source: self})
		(@skillList[number]).call(args)
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
