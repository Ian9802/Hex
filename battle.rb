
class Battle
	def initialize()
		# 0 PC 1-5 monster 6 reserved for solo beasts
		@creatures = Array.new(7)
		for i in (0..(@creatures.length-1)) do
			@creatures[i] = Array.new()
		end
	end
	def getCreatures; return @creatures; end
	def addCreature(being)
		@creatures[being.getteam].push(being)
	end
end