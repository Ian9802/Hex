
class Battle
	def initialize()
		# 0 PC 1-5 monster 6 reserved for solo beasts
		@creatures = Array.new(7)
	end
	def getCreatures; return @creatures; end
	def addCreature(being)
		@creatures = addCreatureRaw(being, @creatures)
	end
	def addCreatureRaw(being, list)
		if(list[being.getTeam].nil?)
			list[being.getTeam] = Array.new(1) {being}
		else
			list[being.getTeam].push(being)
		end
		return list
	end
	def removeCreature(being)
		@creatures = @creatures[being.getTeam].delete_if{ |e| e == being }
	end
	# these too hopefully won't be use much, if at all
	def findCreature(being)
		return @creatures.index(being)
	end
	def setCreature(being, location)
		@creatures[being.getTeam][location] = being
	end
	def ringTargets(min, max, loc)
		# max and min inclusive
		targettedHexes = Array.new()
		if min < 0; min = 0; end
		if max < min; return targettedHexes; end
		if min == 0
			targettedHexes.push(loc)
			min += 1
		end
		if max < min; return targettedHexes; end
		for i in (min..max)
			for j in (-max..(max-i-1))
				shiftCube = Cube.new(i, j)
				target = loc.add(shiftCube)
				targettedHexes.push(target)
				for j in (1..5)
					target = target.rotateIn()
					targettedHexes.push(target)
				end
			end
		end
		return targettedHexes
	end
	# needs to be modified to produce {team, target}
	def getTargets(targettedHexes)
		targets = Array.new(7)
		teamCount = 0
		hexes = targettedHexes
		for list in @creatures
			creatureCount = 0
			if(!list.nil?)
				for i in list
					for j in hexes
						if j.equals(i.getLoc)
							targets = addCreatureRaw(@creatures[teamCount][creatureCount], targets)
							# if there can only be one creature on a hex
							# hexes = hexes - [j]
							break
						end
					end
					creatureCount += 1
				end
			end
			teamCount += 1
		end
		return targets
	end
	def randomTargetSelection(creatureList, team, hitCount)
		if hitCount <= 0; return []; end
		creatureList
		teamCount = 0
		teamList = Array.new()
		for i in creatureList
			teamList.push(teamCount)
			teamCount+=1
		end
		if team >= 0
			teamList.delete_at(team)
		end
		hits = 0
		targets = Array.new()
		begin
			if creatureList.length == 0; return targets; end
			# rand does not include the max
			team = teamList[rand(teamList.length)]
			# can still currently double target groups, but won't target own team
			# leaving the second part of the if for if/when I know how to fix it elegantly
			# not just basically rebuild the entire thing, but numbers
			# that is, if it should be fixed and not be able to hit multiple times
			if !creatureList[team].nil? && creatureList[team].length > 0
				hits += 1
				target = rand(creatureList[team].length)
				targets.push({team: team, target: target})
			else
				teamList.delete_at(team)
			end
		end while hits < hitCount
		return targets
	end
	def randomTargetAny
		return randomTargetSelection(@creatures, -1, 1)
	end
	def complete
		count = 0
		for i in (0..@creatures.length-1)
			if !@creatures[i].nil?
				if @creatures[i].length > 0
					count+=1
				end
			end
		end
		if count <= 1
			return true
		else
			return false
		end
	end
end