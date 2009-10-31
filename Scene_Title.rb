

class Scene_Title
	def initialize(window)
		@window = window
		@background = Image.new(window, @window.initial.title_background_picture, true)
		@command_window = Window_Command.new(window, 192, @window.initial.title_commands, 0)
		@command_window.x = @background.width/2 - 192/2
		@command_window.y = 360
		@command_window.active = true
		@bgm = Song.new(window, @window.initial.title_background_music)
		@bgm.play(true)
	end
	def button_down(id)
		if @command_window.active == true
			@command_window.button_down(id)
			if id == Button::KbReturn 
				case @command_window.index
					when 0 # New Game
						@bgm.stop
						Sample.new(@window, @window.initial.accept_se).play
						$temp = Temp.new
						$party = Party.new(@window)
						Database.load_items
						$party.setup_initial_party
						@window.scene = Transition.new(@window, Scene_Map.new(@window, @window.initial.map_start, @window.initial.map_tileset_start, @window.initial.player_start), :in, true)
					when 1 # Load Game
						Sample.new(@window, @window.initial.buzzer_se).play
						# load game
					when 2 # Exit Game
						Sample.new(@window, @window.initial.accept_se).play
						@window.close
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
