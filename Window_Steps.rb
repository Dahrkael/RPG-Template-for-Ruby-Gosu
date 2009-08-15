

class Window_Steps < Window_Base
	
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
		@font.draw("Steps:", self.x+20, self.y+10, @z, 1, 1, @blue_text)
		@font.draw_rel($party.steps.to_s, self.x + @width - 15, self.y + 50, @z, 1.0, 0.5)
	end
end

	