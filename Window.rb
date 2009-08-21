include Gosu
class Game_Window < Window
	attr_reader :screen_x
	attr_reader :screen_y
	attr_reader :timer
	def initialize
		super(640, 480, false)
		self.caption = "RPG Template using Gosu"
		@fpscounter = FPSCounter.new(self)
		@timer = Timer.new(self)
		$scene = Scene_Intro.new(self)
	end
	
	def button_down(id)
		$scene.button_down(id)
		if id == Button::KbF
			@fpscounter.show_fps = !@fpscounter.show_fps
		end
	end
	

	def update
		@fpscounter.update
		@timer.update
		$scene.update
	end
	
	def draw
	end
	
end






