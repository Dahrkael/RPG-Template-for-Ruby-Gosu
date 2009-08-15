
class Window_Selectable < Window_Base
	attr_accessor :index
	
	def initialize(window,width, height, space, index=0)
		super(window, 0, 0, width, 0)
		@index = index
		@x = 0
		@y = 0
		@z = 10
		@width = width
		@height = height
		@space = space
		@cursor_x = @x
		@cursor_y = @y
		@cursor_x_plus = 3
		@cursor_y_plus = 4
		@cursor_opacity = 200
		@fading_type = "IN"
		colors
	end

	def draw_index
		blue_border = Color.new(@cursor_opacity, 192, 224, 255)
		blue1 = Color.new(@cursor_opacity, 66, 68, 120)
		blue2 = Color.new(@cursor_opacity, 44, 45, 85) 
    
		$window.draw_quad(@cursor_x + 1, @cursor_y, blue_border, @cursor_x + @width - 7, @cursor_y, blue_border, 
					@cursor_x + 1, @cursor_y+@space, blue_border, @cursor_x + @width - 7, @cursor_y+@space, blue_border, @z)
                          
		$window.draw_quad(@cursor_x + 2, @cursor_y + 1, blue2, @cursor_x + @width - 8, @cursor_y + 1, blue1, 
					@cursor_x + 2, @cursor_y+@space-1, blue2, @cursor_x + @width - 8, @cursor_y+@space-1, blue1, @z)
    
		@cursor_opacity += 5 if @fading_type == "IN"
		@cursor_opacity -= 5 if @fading_type == "OUT"
    
		@fading_type = "IN" if @cursor_opacity <= 20
		@fading_type = "OUT" if @cursor_opacity >= 160

	end
	
	def update
		@cursor_x = @x + @cursor_x_plus
		@cursor_y = @y + @cursor_y_plus + @space * @index
		self.draw
	end
	
	def draw
		self.drawBox(@x, @y, @width, @height+(@cursor_y_plus*2), @z)
	end
	
end
