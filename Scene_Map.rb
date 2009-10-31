class Scene_Map
	attr_reader :mapa
	attr_reader :hero
	attr_reader :screen_x
	attr_reader :screen_y
	def initialize(window, map, tileset, position)
		@window = window
		@screen_x = 0
		@screen_y = 0
		@mapa = Map.new(@window, map, tileset)
		@hero = Character_Hero.new(@window, position[0], position[1])
		@npcs = []
		for npc in @mapa.npcs
			x,y,filename,movement,face,solid,route,commands = *Database.load_npcs(npc)
			@npcs.push(Character.new(@window, x, y, filename, movement, face, solid, route, commands))
		end
		
		#@npcs.push(Character.new(@window, 800, 200, 2, "npc3.png", 'static', 'left'))
		#@npcs.push(Character.new(@window, 600, 300, 2, "npc3.png", 'static', 'right'))
		#@npcs.push(Character.new(@window, 700, 350, 2, "npc3.png", 'static', 'up'))
		
	end
	
	def button_down(id)
		if id == Button::KbEscape
			$temp.actual_map = @mapa.filename
			$temp.actual_map_tileset = @mapa.tileset_filename
			$temp.actual_position = [(@hero.x/32+1),((@hero.y+24)/32+1)]
			@window.scene = Transition.new(@window, Scene_Menu.new(@window), :in, false)
		end
	end
	
	def solid_event_infront?(character)
		case character.direccion
			when :left
				for i in 0...@npcs.size
					return true if @npcs[i].solid == true and @npcs[i].x == character.x - 24 and character.y >= @npcs[i].y - 20 and character.y <= @npcs[i].y + 20
				end
				return true if @hero.x == character.x - 24 and character.y >= @hero.y and character.y <= @hero.y + 20
				return false
			when :right
				for i in 0...@npcs.size
					return true if @npcs[i].solid == true and @npcs[i].x == character.x + 24 and character.y >= @npcs[i].y - 20 and character.y <= @npcs[i].y + 20
				end
				return true if @hero.x == character.x + 24 and character.y >= @hero.y - 20 and character.y <= @hero.y + 20
				return false
			when :up
				for i in 0...@npcs.size
					return true if @npcs[i].solid == true and @npcs[i].y == character.y - 16 and character.x >= @npcs[i].x - 20 and character.x <= @npcs[i].x + 20
				end
				return true if @hero.y == character.y - 16 and character.x >= @hero.x - 20 and character.x <= @hero.x + 20
				return false
			when :down
				for i in 0...@npcs.size
					return true if @npcs[i].solid == true and @npcs[i].y == character.y + 16 and character.x >= @npcs[i].x - 20 and character.x <= @npcs[i].x + 20
				end
				return true if @hero.y == character.y + 16 and character.x >= @hero.x - 20 and character.x <= @hero.x + 20
				return false
		end
	end
	
	def update
		@screen_x = [[@hero.x - 320, 0].max, @mapa.width * 32 - 640].min
		@screen_y = [[@hero.y - 240, 0].max, @mapa.height * 32 - 480].min
		@npcs.each { |npc| if @hero.y > npc.y then npc.z = 2 else npc.z = 4 end }
		@hero.update
		@npcs.each { |npc|npc.update }
		@mapa.update
	end
	
	def draw
	end
end
