

	class Window_Item < Window_Selectable
		def initialize(window)
			super(window,400, 473, 32, 0)
			@font = Font.new(window,$initial.font_name, $initial.font_size)
			load_items
		end
		
		def button_down(id)
			if id == Button::KbDown and not @index == @item_max - 1
				Sample.new($window, $initial.move_se).play
				@index += 1
			end				
			if id == Button::KbUp and not @index == 0
				Sample.new($window, $initial.move_se).play
				@index -= 1 
			end
		end
		
		def load_items
			@data = []
			for i in 1...$data_items.size
				if $party.item_number($data_items[i][0].to_i) > 0
					@data.push([$data_items[i][0], $data_items[i][1]])
				end
			end
			
		end
		
		def draw_items
			if @data.size != 0
				@item_max = @data.size
				for i in 0...@item_max
					y = @y + (32 * i)  + 10
					@font.draw(@data[i][1].to_s+" : "+$party.item_number(@data[i][0].to_i).to_s, @x + 20, y, @z + 5, 1, 1, @white)
				end
			else 
				@item_max = 1
			end
			
		end
		
		def update
			super
			draw_items
			self.draw
		end
		
		def draw
			super
			draw_index if self.active == true
		end
		
	end
	