require_relative 'cube'
def alo(args)
	return "hoi"
end
def nameThySelf(args)
	puts @name + "!"
end

# hits all locals, spin to win
def localAttack(args)
	battle = args[:battle]
	source = args[:source]
	hexes = battle.ringTargets(1, 1, source.getLoc)
	targets = battle.getTargets(hexes)
	hitAll(battle, targets, source)
end

# needs to be fixed up so that it can have {team, target}
def hitAll(battle, targets, source)
	for team in targets
		if !team.nil?
			for target in team
				standardAttack(battle, target, source)
			end
		end
	end
end

# also a maybe, and might need to change depending on how variables are handles
# might need an assign function in battle to force updates
def standardAttack(battle, selected, source)
	team = selected[:team]
	target = selected[:target]
	battle.getCreatures[team][target].defend(source.getAtk)
	if battle.getCreatures[team][target].dead()
		battle.remove(battle.getCreatures[team][target])
	end
end

# only targets enemies, randomTargetAny for anyone
# single attack, can be modified for other skills
def randomAttack(args)
	battle = args[:battle]
	source = args[:source]
	selected = battle.randomTargetSelection(battle.getCreaturesAsTargets, source.getTeam, 1)
	standardAttack(battle, selected[0], source)
end

# hits all targets in a range of areas.
def rangedAttack(args)
	battle = args[:battle]
	source = args[:source]
	min = args[:min]
	max = args[:max]
	hexes = battle.ringTargets(min, max, source.getLoc)
	targets = battle.getTargets(hexes)
	hitAll(battle, targets, source)
end
