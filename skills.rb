# just have to make sure this is initialized, should probably be shifted to like a 'battle'
# file at some point in the future
$creatures = Array.new(7)
# 0 PC 1-5 monster 6 reserved for solo beasts
for i in (0..($creatures.length-1)) do
	$creatures[i] = Array.new()
end

#-----
def alo
	return "hoi"
end
def nameThySelf
	puts @name + "!"
end

def randomSelection
	localCreatures = Array.new($creatures)
	teamCount = 0
	teamList = Array.new
	for i in localCreatures
		teamList.push(teamCount)
		teamCount+=1
	end
	localCreatures.delete_at(@team)
	teamList.delete_at(@team)
	hit = false
	targetTeam = -1
	begin
		team = rand(localCreatures.length)
		if team.length > 0
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

def randomAttack
	selected = randomSelection()
	targetTeam = selected[:targetTeam]
	target = selected[:target]
	$creatures[targetTeam][target].defend(@atk)
	if $creatures[targetTeam][target].dead()
		$creatures[targetTeam].delete_at(target)
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