class Window_MenuStatus < Window_Selectable
	
	def initialize(window, index=0)
		super(window,482, 473, 118, 0)
		@window = window
		@font = Font.new(window,@window.initial.font_name, @window.initial.font_size)
		@item_max = $party.main_party.size - 1
	end
	
	def draw_characters
		for i in 0...$party.main_party.size
			x = self.x + 64
			y = i * 120
			draw_hero_graphic(i, x - 40, y + 50)
			draw_hero_name(i, @font, x - 40, y + 20)
			draw_hero_level(i, @font, x + 10, y + 60)
			draw_hero_state(i, @font, x + 100, y + 60)
			draw_hero_class(i, @font, x + 100, y + 20)
			draw_hero_hp(i, @font, x + 250, y + 20)
			draw_hero_mp(i, @font, x + 250, y + 60)
			draw_hero_exp(i, @font, x + 10, y + 90)
			next if i == 0
			@window.draw_line(x, y, 0xffffffff, x+400, y, 0xffffffff, @z)
		end
	end
	
	def button_down(id)
		if id == Button::KbDown and not @index == @item_max
			Sample.new(@window, @window.initial.move_se).play
			@index += 1
		end				
		if id == Button::KbUp and not @index == 0
			Sample.new(@window, @window.initial.move_se).play
			@index -= 1 
		end
	end
	
	def update
		super
		draw_characters
	end
	def draw
		super
		draw_index if self.active == true
	end
end
