
class Window_Base
	attr_accessor :x
	attr_accessor :y
	attr_accessor :z
	attr_accessor :active
	def initialize(window, x, y, width, height, z = 10)
		if x != 0 then @x = x else @x = 0 end
		@z = z
		if y != 0 then @y = y else @y = 0 end
		if width != 0 then @width = width else @width = 0 end
		if height != 0 then @height = height else @height = 0 end
		@active = false
	end
	
	def colors
		@white = Color.new(255, 255, 255, 255)
		@blueBorder = Color.new(255, 33, 35, 79)
		@blue1 = Color.new(255, 66, 68, 120)
		@blue2 = Color.new(255, 56,58, 110)
		@blue3 = Color.new(255, 40, 41, 81) 
		@blue_text = Color.new(255, 192, 224, 255)
	end
	
	def drawBox(x, y, w, h, z = 1)  
		# blue border
		$window.draw_quad(x, y, @blueBorder, x + w, y, @blueBorder, x, y + h, @blueBorder, x + w, y + h, @blueBorder, z)     
		# white border
		$window.draw_quad(x + 1, y + 1, @white, x + w - 1, y + 1, @white, x + 1, y + h - 1, @white, x + w - 1, y + h - 1, @white, z)    
		# blue gradient
		$window.draw_quad(x + 3, y + 3, @blue1, x + w - 3, y + 3, @blue2, x + 3, y + h - 3, @blue2, x + w - 3, y + h - 3, @blue3, z) 
	end
	
	def draw_hero_graphic(i, x, y)
		chara = $party.main_party[i].chara
		poses = Image.load_tiles($window, chara, 32, 48, false)
		pose = poses[0]
		pose.draw(x, y, @z)
	end
	
	def draw_hero_name(i, font, x, y)
		name = $party.main_party[i].name
		font.draw(name, x, y, @z)
	end
	
	def draw_hero_class(i, font, x, y)
		job = $party.main_party[i].job
		font.draw("Class: ", x, y, @z, 1, 1, @blue_text)
		font.draw(job, x + 55, y, @z)
	end
	
	def draw_hero_level(i, font, x, y)
		level = $party.main_party[i].LVL
		font.draw("Lvl: ", x, y, @z, 1, 1, @blue_text)
		font.draw(level.to_s, x+ 35, y, @z)
	end
	
	def draw_hero_hp(i, font, x, y)
		hp = $party.main_party[i].HP
		maxhp = $party.main_party[i].MAX_HP
		font.draw("HP:", x, y, @z, 1, 1, @blue_text)
		font.draw(hp.to_s+"/"+maxhp.to_s, x+ 35, y, @z)
	end
	
	def draw_hero_mp(i, font, x, y)
		mp = $party.main_party[i].MP
		maxmp = $party.main_party[i].MAX_MP
		font.draw("MP:", x, y, @z, 1, 1, @blue_text)
		font.draw(mp.to_s+"/"+maxmp.to_s, x+ 40, y, @z)
	end
	
	def draw_hero_exp(i, font, x, y)
		exp = $party.main_party[i].EXP
		nxtexp = $party.main_party[i].NXT_EXP
		font.draw("Exp:", x, y, @z, 1, 1, @blue_text)
		font.draw(exp.to_s, x+40, y, @z)
		font.draw("Next Lvl:", x + 140, y, @z, 1, 1, @blue_text)
		font.draw(nxtexp.to_s, x + 230, y, @z)
	end
	
	def draw_gold(font, x, y)
		gold = $party.gold
		font.draw_rel(gold.to_s+" Gold", x, y, @z, 1.0, 0.5)
	end

end
