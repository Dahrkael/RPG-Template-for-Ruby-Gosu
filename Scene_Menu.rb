

class Scene_Menu
	def initialize(window)
		@window = window
		main
	end
	
	def main
		s1 = "Items"
		s2 = "Skills"
		s3 = "Equip"
		s4 = "State"
		s5 = "Save"
		s6 = "Exit"
		@command_window = Window_Command.new(@window, 160, [s1,s2,s3,s4,s5,s6], 0)
		@command_window.active = true
		@status_window = Window_MenuStatus.new(@window, 0)
		@status_window.active = false
		@status_window.x = 159
		@gold_window = Window_Gold.new(@window, 0, 200, 0)
		@steps_window = Window_Steps.new(@window, 0, 270, 0)
		@location_window = Window_Location.new(@window, 0, 410, 0)
		@playtime_window = Window_PlayTime.new(@window, 0, 340, 0)
	end
	
	def button_down(id)
		if @command_window.active == true
			@command_window.button_down(id)
			if id == Button::KbEscape
				@window.scene = Transition.new(@window, Scene_Map.new(@window, $temp.actual_map, $temp.actual_map_tileset, $temp.actual_position), :in, true)
			end
			if id == Button::KbReturn 
				case @command_window.index
					when 0
					# Inventory
					@window.scene = Scene_Item.new(@window)
					when 1 
					@command_window.active = false
					@status_window.active = true
					when 2 
					@command_window.active = false
					@status_window.active = true
					when 3 
					@command_window.active = false
					@status_window.active = true
					when 4 
					# Save
					when 5
					@window.scene = Transition.new(Scene_Title.new(@window), :in, false)
				end
			end
		end
		if @status_window.active == true
			@status_window.button_down(id)
			if id == Button::KbEscape
				@status_window.active = false
				@command_window.active = true
			end
		end
		
	end
	
	def update
		@command_window.update
		@status_window.update
		@gold_window.update
		@steps_window.update
		@playtime_window.update
		@location_window.update
		self.draw
	end
	
	def draw
	end
end