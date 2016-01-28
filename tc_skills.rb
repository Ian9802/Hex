require_relative 'skills'
require_relative 'being'
require_relative 'cube'
require_relative 'battle'
require "test/unit"

class TestSkillsFull < Test::Unit::TestCase
	def test_localAttack
		battle = Battle.new()
		rando1 = Rando.new()
		rando1.setTeam(0)
		rando1.setLoc(Cube.new(0,0))
		rando1.setSkillList([method(:localAttack)])
		prior1 = rando1.getHp

		rando2 = Rando.new()
		rando2.setLoc(Cube.new(1,0))
		rando2.setDfs(0)
		rando2.setTeam(1)
		prior2 = rando2.getHp

		rando3 = Rando.new()
		rando3.setLoc(Cube.new(1,1))
		rando3.setDfs(0)
		rando3.setTeam(1)
		prior3 = rando3.getHp

		battle.addCreature(rando1)
		battle.addCreature(rando2)
		battle.addCreature(rando3)

		args = {battle: battle}
		battle.getCreatures[0][0].activate(0, args)
		assert(prior1 == battle.getCreatures[0][0].getHp)
		assert(prior2 >  battle.getCreatures[1][0].getHp)
		assert(prior3 == battle.getCreatures[1][1].getHp)
	end
	def test_randomAttack
		battle = Battle.new()
		rando1 = Rando.new()
		rando1.setTeam(0)
		rando1.setLoc(Cube.new(0,0))
		rando1.setSkillList([method(:randomAttack)])
		prior1 = rando1.getHp

		rando2 = Rando.new()
		rando2.setLoc(Cube.new(1,0))
		rando2.setDfs(0)
		rando2.setTeam(1)
		prior2 = rando2.getHp

		rando3 = Rando.new()
		rando3.setLoc(Cube.new(1,1))
		rando3.setDfs(0)
		rando3.setTeam(0)
		prior3 = rando3.getHp

		battle.addCreature(rando1)
		battle.addCreature(rando2)
		battle.addCreature(rando3)

		args = {battle: battle}
		battle.getCreatures[0][0].activate(0, args)
		assert(prior1 == battle.getCreatures[0][0].getHp)
		assert(prior2 >  battle.getCreatures[1][0].getHp)
		assert(prior3 == battle.getCreatures[0][1].getHp)
	end
	def test_rangedAttack
		battle = Battle.new()
		rando1 = Rando.new()
		rando1.setTeam(0)
		rando1.setLoc(Cube.new(0,0))
		rando1.setSkillList([method(:rangedAttack)])
		prior1 = rando1.getHp

		rando2 = Rando.new()
		rando2.setLoc(Cube.new(1,0))
		rando2.setDfs(0)
		rando2.setTeam(1)
		prior2 = rando2.getHp

		rando3 = Rando.new()
		rando3.setLoc(Cube.new(1,1))
		rando3.setDfs(0)
		rando3.setTeam(1)
		prior3 = rando3.getHp

		battle.addCreature(rando1)
		battle.addCreature(rando2)
		battle.addCreature(rando3)

		args = {battle: battle, min: 2, max: 2}
		battle.getCreatures[0][0].activate(0, args)
		assert(prior1 == battle.getCreatures[0][0].getHp)
		assert(prior2 == battle.getCreatures[1][0].getHp)
		assert(prior3 >  battle.getCreatures[1][1].getHp)
	end
end
