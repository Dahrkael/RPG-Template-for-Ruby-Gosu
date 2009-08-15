class Hero
	attr_accessor :name
	attr_accessor :job
	attr_accessor :chara
	attr_accessor :LVL
	attr_accessor :HP
	attr_accessor :MAX_HP
	attr_accessor :MP
	attr_accessor :MAX_MP
	attr_accessor :attack
	attr_accessor :defense
	attr_accessor :m_attack
	attr_accessor :m_defense
	attr_accessor :EXP
	attr_accessor :NXT_EXP
	
	def initialize(name, job, filename)
		@name = name
		@job = job
		@chara = filename
		@LVL = 1
		@HP = 100
		@MAX_HP = 100
		@MP = 25
		@MAX_MP = 25
		@attack = 10
		@defense = 10
		@m_attack = 10
		@m_defense = 10
		@EXP = 0
		@NXT_EXP = 100
	end
	
	def up_level
		if @EXP >= @NXT_EXP
			@LVL += 1
			@EXP = 0
			@NXT_EXP *= 1.1
			@NXT_EXP.to_i
		end
	end
end
