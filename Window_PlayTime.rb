

class Window_PlayTime < Window_Base
	
	def initialize(window, x, y, z)
		super(window, x, y, 160, 70, 10)
		@font = Font.new(window ,$initial.font_name, $initial.font_size)
		colors
	end
	
	def adapt_time
		if $window.hours < 10
			@hours_display = "0" + $window.hours.to_s
		else
			@hours_display = $window.hours.to_s
		end
		if $window.minutes < 10
			@minutes_display = "0" + $window.minutes.to_s
		else
			@minutes_display = $window.minutes.to_s
		end
		if $window.seconds < 10
			@seconds_display = "0" + $window.seconds.to_s
		else
			@seconds_display = $window.seconds.to_s
		end
	end
	
	def update
		adapt_time
		self.draw
	end
	
	def draw
		self.drawBox(@x, @y, @width, @height, @z)
		@font.draw("Play Time:", self.x+20, self.y+10, @z, 1, 1, @blue_text)
		@font.draw_rel(@hours_display+":"+@minutes_display+":"+@seconds_display, self.x + @width - 15, self.y + 50, @z, 1.0, 0.5)
	end
end

	