

class Window_PlayTime < Window_Base
	
	def initialize(window, x, y, z)
		super(window, x, y, 160, 70, 10)
		@window = window
		@font = Font.new(window ,@window.initial.font_name, @window.initial.font_size)
		colors
	end
	
	def adapt_time
		if @window.timer.hours < 10
			@hours_display = "0" + @window.timer.hours.to_s
		else
			@hours_display = @window.timer.hours.to_s
		end
		if @window.timer.minutes < 10
			@minutes_display = "0" + @window.timer.minutes.to_s
		else
			@minutes_display = @window.timer.minutes.to_s
		end
		if @window.timer.seconds < 10
			@seconds_display = "0" + @window.timer.seconds.to_s
		else
			@seconds_display = @window.timer.seconds.to_s
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

	