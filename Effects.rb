module Effects
	def self.fade_in
		@opacity = 255
		@color = Color.new(@opacity, 0, 0, 0)
		@fade = $window.draw_quad(0, 0, @color, 640, 0, @color, 0, 480, @color, 640, 480, @color, 500)
		for i in 1...255
			@opacity -= 1
			@color = Color.new(@opacity, 0, 0, 0)
			@fade = $window.draw_quad(0, 0, @color, 640, 0, @color, 0, 480, @color, 640, 480, @color, 500)
		end
	end
	def self.fade_out
		@opacity = 0
		@color = Color.new(@opacity, 0, 0, 0)
		@fade = $window.draw_quad(0, 0, @color, 640, 0, @color, 0, 480, @color, 640, 480, @color, 500)
		for i in 1...255
			@opacity += 1
			@color = Color.new(@opacity, 0, 0, 0)
			@fade = $window.draw_quad(0, 0, @color, 640, 0, @color, 0, 480, @color, 640, 480, @color, 500)
		end
	end
	def draw
		
	end
end