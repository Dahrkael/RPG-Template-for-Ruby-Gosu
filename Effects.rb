
include Gosu

class Transition
	attr_reader :screen_x
	attr_reader :screen_y
	attr_reader :mapa
	def initialize(scene, type, map)
		@next_scene = scene
		@map = map
		@time = 0
		@fading = type
		@fade_time = 255 if @fading == :in
		@fade_time = 0 if @fading == :out
		@color = Color.new(@fade_time, 0, 0 ,0)
		
		if @map == true
			@mapa = @next_scene.mapa
			@screen_x = [[@next_scene.hero.x - 320, 0].max, @next_scene.mapa.width * 32 - 640].min
			@screen_y = [[@next_scene.hero.y - 240, 0].max, @next_scene.mapa.height * 32 - 480].min
		end
	end
	
	def button_down(id)
	end
	
	def solid_event_infront?(character)
	end
	
	def update
		@color = Color.new(@fade_time, 0, 0 ,0)
		case @fading
			
		when :in
			if @fade_time <= 0
				$scene = @next_scene
			else
				@fade_time -= 15 # 15 is cool
			end
		when :out
			if @fade_time >= 255
				$scene = @next_scene
			else
				@fade_time += 15 # 15 is cool
			end
		end
			
		self.draw
	end
	
	def draw
		@next_scene.update
		$window.draw_quad(0, 0, @color, 640, 0, @color, 0, 480, @color, 640, 480, @color, 500)   
	end
	
end


	
	

