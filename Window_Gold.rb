

class Window_Gold < Window_Base
	
	def initialize(window, x, y, z)
		super(window, x, y, 160, 70, 10)
		@font = Font.new(window ,$initial.font_name, $initial.font_size)
		colors
	end
	
	def update
		self.draw
	end
	
	def draw
		self.drawBox(@x, @y, @width, @height, @z)
		@font.draw("Money:", self.x+20, self.y+10, @z, 1, 1, @blue_text)
		draw_gold(@font, self.x+ @width - 15, self.y + 50)
	end
end

	