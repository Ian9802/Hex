require_relative 'cube'
def alo
	return "hoi"
end
def nameThySelf
	puts @name + "!"
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
	# targettedHexes = Array.new()
	# if range <= 0; return targettedHexes; end
	# for i in (1..range)
	# 	shiftCube = Cube.new(i, 0)
	# 	target = @loc.add(shiftCube)
	# 	targettedHexes.push(target)
	# 	for j in (1..5)
	# 		target = target.rotateIn()
	# 		targettedHexes.push(target)
	# 	end
	# end
	# targets = findTargets(targettedHexes)
	for selected in targets
		standardAttack(selected)
	end
end



