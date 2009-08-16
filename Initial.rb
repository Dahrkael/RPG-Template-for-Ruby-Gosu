class Initial_Settings
	attr_reader :font_name
	attr_reader :font_size
	attr_reader :title_background_picture
	attr_reader :title_background_music
	attr_reader :title_commands
	attr_reader :move_se
	attr_reader :accept_se
	attr_reader :buzzer_se
	attr_reader :player_start
	attr_reader :map_start
	attr_reader :map_tileset_start
	attr_reader :party
	attr_reader :gold
	
	def initialize
		@font_size = 18
		@font_name = "Verdana"
		@title_background_picture = "graphics/background.png"
		@title_background_music = "music/background.ogg"
		@title_commands = ["New Game", "Load Game", "Exit Game"]
		@move_se = "se/move.ogg"
		@accept_se = "se/accept.ogg"
		@buzzer_se = "se/buzzer.ogg"
		@player_start = [400, 100]
		@map_start = "maps/Test Map.txt"
		@map_tileset_start = "graphics/tilesets/tileset.png"
		@party = [Hero.new("Ryan", "Fighter", "graphics/charasets/hero.png"),
				Hero.new("Mr. Unnamed", "Mage", "graphics/charasets/npc3.png"),
				Hero.new("Sally", "NekoGirl", "graphics/charasets/npc.png"),
				Hero.new("Little George", "Killer", "graphics/charasets/npc2.png")]
		@gold = 100
	end
end
