

class Scene_Title
	def initialize(window)
		@background = Image.new(window, $initial.title_background_picture, true)
		@command_window = Window_Command.new(window, 192, $initial.title_commands, 0)
		@command_window.x = @background.width/2 - 192/2
		@command_window.y = 360
		@command_window.active = true
		@bgm = Song.new(window, $initial.title_background_music)
		@bgm.play(true)
	end
	def button_down(id)
		if @command_window.active == true
			@command_window.button_down(id)
			if id == Button::KbReturn 
				case @command_window.index
					when 0 # New Game
						@bgm.stop
						Sample.new($window, $initial.accept_se).play
						$temp = Temp.new
						$party = Party.new
						Database.load_items
						$party.setup_initial_party
						$scene = Scene_Map.new($window, $initial.map_start, $initial.map_tileset_start, $initial.player_start)
					when 1 # Load Game
						Sample.new($window, $initial.buzzer_se).play
						# load game
					when 2 # Exit Game
						Sample.new($window, $initial.accept_se).play
						$window.close
				end
			end
		end
	end
		
	def update
		@command_window.update
		self.draw
	end
	def draw
		@background.draw(0,0,0)
	end
	
end
