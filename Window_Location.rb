

class Window_Location < Window_Base
	
	def initialize(window, x, y, z)
		super(window, x, y, 160, 70, 10)
		@window = window
		@font = Font.new(window ,@window.initial.font_name, @window.initial.font_size)
		@name = $temp.actual_map.gsub(".txt","")
		@name.gsub!("maps/","")
		colors
	end
	
	def update
		self.draw
	end
	
	def draw
		self.drawBox(@x, @y, @width, @height, @z)
		@font.draw("Location:", self.x+20, self.y+10, @z, 1, 1, @blue_text)
		@font.draw_rel(@name, self.x + @width - 15, self.y + 50, @z, 1.0, 0.5)
	end
end

	