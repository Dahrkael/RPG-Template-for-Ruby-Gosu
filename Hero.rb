class Hero
	attr_accessor :name
	attr_accessor :job
	attr_accessor :chara_filename
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
	attr_accessor :state
	attr_accessor :EXP
	attr_accessor :NXT_EXP
	
	def initialize(name, job, filename, max_hp=100, max_mp=50, attack=10, defense=10, m_attack=10, m_defense=10)
		@name = name
		@job = job
		@chara_filename = filename
		@chara = nil
		@LVL = 1
		@MAX_HP = max_hp
		@HP = @MAX_HP
		@MAX_MP = max_mp
		@MP = @MAX_MP
		@attack = attack
		@defense = defense
		@m_attack = m_attack
		@m_defense = m_defense
		@state = "Normal"
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
