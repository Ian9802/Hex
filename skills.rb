require_relative 'cube'
# just have to make sure this is initialized, should probably be shifted to like a 'battle'
# file at some point in the future
$creatures = Array.new(7)
# 0 PC 1-5 monster 6 reserved for solo beasts
for i in (0..($creatures.length-1)) do
	$creatures[i] = Array.new()
end
def inputCreature(being)
	($creatures[being.getteam]).push(being)
end

#-----
def alo
	return "hoi"
end
def nameThySelf
	puts @name + "!"
end

def randomSelection(creatureList)
	localCreatures = Array.new(creatureList)
	teamCount = 0
	teamList = Array.new()
	for i in localCreatures
		teamList.push(teamCount)
		teamCount+=1
	end
	localCreatures.delete_at(@team)
	teamList.delete_at(@team)
	hit = false
	targetTeam = -1
	begin
		if localCreatures.length == 0
			return nil
		end
		team = rand(localCreatures.length)
		if localCreatures[team].length > 0
			hit = true
			targetTeam = team
		else
			localCreatures.delete_at(team)
			teamList.delete_at(team)
		end
	end while !hit
	target = rand(localCreatures[targetTeam].length)
	return {targetTeam: targetTeam, target: target}
end

def findTargets(targettedHexes)
	targets = Array.new()
	listCount = 0
	for list in $creatures
		creatureCount = 0
		for i in list
			for j in targettedHexes
				if j.equals(i.getloc)
					targets.push({targetTeam: listCount, target: creatureCount})
					break
				end
			end
			creatureCount += 1
		end
		listCount += 1
	end
	return targets
end

# hits all locals, spin to win
def localAttack
	targettedHexes = listAdjacents
	targets = findTargets(targettedHexes)
	for selected in targets
		standardAttack(selected)
	end
end

def standardAttack(selected)
	targetTeam = selected[:targetTeam]
	target = selected[:target]
	$creatures[targetTeam][target].defend(@atk)
	if $creatures[targetTeam][target].dead()
		$creatures[targetTeam].delete_at(target)
	end
end

def randomAttack
	selected = randomSelection($creatures)
	standardAttack(selected)
end

def rangedRandomAttack(range)
	# range probably needs to be set in the creature for how this currently works
	# could also set a lower limit to make it so that they could ONLY attack at range
	targettedHexes = Array.new()
	if range <= 0; return targettedHexes; end
	counter = 0
	for i in (1..range)
		shiftCube = Cube.new(i, 0)
		target = @loc.add(shiftCube)
		targettedHexes.push(target)
		for j in (1..5)
			target = target.rotateIn()
			targettedHexes.push(target)
		end
	end
	targets = findTargets(targettedHexes)
	for selected in targets
		standardAttack(selected)
	end
end



def complete
	count = 0
	for i in $creatures
		if $creatures[0].length > 0
			count+=1
		end
	end
	if count >= 1
		return true
	else
		return false
	end
end