

class Scene_Item
	def initialize(window)
		@window = window
		@item_window = Window_Item.new(window)
		@item_window.x = 240
		@item_window.active = true
	end
	
	def button_down(id)
		if @item_window.active == true
			@item_window.button_down(id)
			if id == Button::KbEscape
				@window.scene = Scene_Menu.new(@window)
			end
			if id == Button::KbReturn 
				#case @item_window.index
				#end
			end
		end
	end
	
	def update
		@item_window.update
		self.draw
	end
	
	def draw
	end
end