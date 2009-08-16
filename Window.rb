include Gosu
class Game_Window < Window
	attr_reader :screen_x
	attr_reader :screen_y
	attr_reader :hours
	attr_reader :minutes
	attr_reader :seconds
	def initialize
		super(640, 480, false)
		self.caption = "RPG Template using Gosu"
		@font = Font.new(self,$initial.font_name, $initial.font_size)
		@frames_counter = 0
		@milliseconds_before = Gosu::milliseconds
		@show_fps = false
		# timer
		@hours = 0
		@minutes = 0
		@seconds = 0
		@last_time = Gosu::milliseconds()
		$scene = Scene_Title.new(self)
	end
	
	def button_down(id)
		$scene.button_down(id)
		if id == Button::KbF
			@show_fps = !@show_fps
		end
	end
	

	def update
		@frames_counter += 1
		if Gosu::milliseconds - @milliseconds_before >= 1000
			@fps = @frames_counter.to_f / ((Gosu::milliseconds - @milliseconds_before) / 1000.0)
			@frames_counter = 0
			@milliseconds_before = Gosu::milliseconds
		end
		updateTimer
		$scene.update
	end
	
	def draw
		@font.draw(@fps.to_s, 0, 0, 20) if @show_fps
	end
	
	def updateTimer
		if (Gosu::milliseconds - @last_time) / 1000 == 1
			@seconds += 1
			@last_time = Gosu::milliseconds()
		end
		if @seconds > 59
			@seconds = 0
			@minutes += 1
		end
		if @minutes > 59
			@hours += 1
			@minutes = 0
		end
	end
end






