
# FPS Counter based in fguillens fpscounter
	class FPSCounter
		
		attr_accessor :show_fps
		attr_reader :fps
		
		def initialize(window)
			@font = Font.new(window,$initial.font_name, $initial.font_size)
			@frames_counter = 0
			@milliseconds_before = Gosu::milliseconds
			@show_fps = false
			@fps = 0
		end
		
		def update
			@frames_counter += 1
			if Gosu::milliseconds - @milliseconds_before >= 1000
				@fps = @frames_counter.to_f / ((Gosu::milliseconds - @milliseconds_before) / 1000.0)
				@frames_counter = 0
				@milliseconds_before = Gosu::milliseconds
			end
			@font.draw("FPS: "+@fps.to_s, 0, 0, 20) if @show_fps
		end
	end
