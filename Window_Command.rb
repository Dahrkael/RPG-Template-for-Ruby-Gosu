
class Window_Command < Window_Selectable
	attr_accessor :index
	
	def initialize(window,width=192, options=[], index=0)
		super(window, width, options.size * 32, 32, index)
		@commands = options
		@font = Font.new(window, $initial.font_name, $initial.font_size)
	end
	
	def draw_commands
		spacing = 32
		for i in 0...@commands.size
			position = spacing * i+1
			adjust = @font.text_width(@commands[i], 1)
			@font.draw(@commands[i], @x+((@width/2)-(adjust/2)), @y+8 + position, @z+1)
		end
	end
	
	def button_down(id)
		if id == Button::KbDown and not @index == @commands.size - 1
			Sample.new($window, $initial.move_se).play
			@index += 1
		end				
		if id == Button::KbUp and not @index == 0
			Sample.new($window, $initial.move_se).play
			@index -= 1 
		end
	end
	
	def update
		super
		self.draw
	end
	
	def draw
		super
		self.draw_commands
		self.draw_index if @active == true
	end
	
end
