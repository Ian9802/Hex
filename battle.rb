
class Battle
	def initialize()
		# 0 PC 1-5 monster 6 reserved for solo beasts
		@creatures = Array.new(7)
	end
	def getCreatures; return @creatures; end
	def addCreature(being)
		if(@creatures[being.getTeam].nil?)
			@creatures[being.getTeam] = Array.new(1) {being}
		else
			@creatures[being.getTeam].push(being)
		end
	end
end