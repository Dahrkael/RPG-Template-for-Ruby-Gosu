include Gosu

class Scene_Intro
	def initialize(window)
		#@font = Font.new(window, "Verdana", 18)
		@background = Image.new(window, "graphics/gosu-splash.png", true)
		@window = window
		@time = 0
		@fading = :in
		@fade_time = 255
		@color = Color.new(@fade_time, 0, 0 ,0)
	end
	
	def button_down(id)
	end
	
	def update
		@color = Color.new(@fade_time, 0, 0 ,0)
		case @fading
			
		when :in
			if @fade_time <= 0
				@fading = :wait
			else
				@fade_time -= 1 # 15 is cool
			end
		when :wait
			@time += 1
			if @time >= 200
				@fading = :out
			end
		when :out
			if @fade_time >= 255
				$scene = Transition.new(Scene_Title.new($window), :in, false)#Scene_Title.new($window)
			else
				@fade_time += 1 # 15 is cool
			end
		end
			
		self.draw
	end
	def draw
		@background.draw(0,0,0)
		@window.draw_quad(0, 0, @color, 640, 0, @color, 0, 480, @color, 640, 480, @color, 500)   
		#@font.draw("fade time: "+@fade_time.to_s, 0, 0, 600)
		#@font.draw("wait time: "+@time.to_s, 0, 30, 600)
		#@font.draw(@fading.to_s, 0, 60, 600)
	end
	
end
