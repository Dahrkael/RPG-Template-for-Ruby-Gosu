
include Gosu

class Character_Hero
	attr_accessor :x
	attr_accessor :y
	attr_accessor :z
	attr_accessor :direccion
	def initialize(window, x, y)
		@x = x
		@y = y
		@z = 3
		@poses = $party.main_party[0].chara
		@pose = @poses[0]
		@direccion = "standing"
		@speed = 4
		@step = 0
		@walking = false
	end
	def can_walk?
		!@walking
	end
	def walk
		
		 if @step >= 32
			@walking = false
			@step = 0
		return
	end
		case @direccion
			when 'up'
				for i in 0...@speed
					@y -= 1 if not $scene.solid_event_infront?(self)
				end
			when 'down'
				for i in 0...@speed
					@y += 1 if not $scene.solid_event_infront?(self)
				end
			when 'left'
				for i in 0...@speed
					@x -= 1 if not $scene.solid_event_infront?(self)
				end
			when 'right'
				for i in 0...@speed
					@x += 1 if not $scene.solid_event_infront?(self)
				end
		end
		if @step >= 32
			@step = 0
		else
			@step+=1
		end
		return [@x, @y]
	end
	
	def draw
		if @direccion == "left"
			if milliseconds / 175 % 4 == 0
				@pose = @poses[4]
			elsif milliseconds / 175 % 4 == 1
				@pose = @poses[5]
			elsif milliseconds / 175 % 4 == 2
				@pose = @poses[6]
			elsif milliseconds / 175 % 4 == 3
				@pose = @poses[7]
			end
		elsif @direccion == "right"
				if milliseconds / 175 % 4 == 0
					@pose = @poses[8]
				elsif milliseconds / 175 % 4 == 1
					@pose = @poses[9]
				elsif milliseconds / 175 % 4 == 2
					@pose = @poses[10]
				elsif milliseconds / 175 % 4 == 3
					@pose = @poses[11]
				end
		elsif @direccion == "up"
			if milliseconds / 175 % 4 == 0
					@pose = @poses[12]
				elsif milliseconds / 175 % 4 == 1
					@pose = @poses[13]
				elsif milliseconds / 175 % 4 == 2
					@pose = @poses[14]
				elsif milliseconds / 175 % 4 == 3
					@pose = @poses[15]
				end
		elsif @direccion == "down"
			if milliseconds / 175 % 4 == 0
					@pose = @poses[0]
				elsif milliseconds / 175 % 4 == 1
					@pose = @poses[1]
				elsif milliseconds / 175 % 4 == 2
					@pose = @poses[2]
				elsif milliseconds / 175 % 4 == 3
					@pose = @poses[3]
				end
		end
		@pose.draw(@x - $scene.screen_x,@y - $scene.screen_y, @z)
	end
  
	def update
		@x_pies = @x + (@pose.width/2)
		@y_pies = @y + @pose.height
		if $window.button_down?(Button::KbLeft) and @x > 0 - $scene.screen_x
			@direccion = "left"
			if not $scene.mapa.solid(@x_pies-16, @y_pies) and not $scene.solid_event_infront?(self)
				walk if can_walk?
			end
		elsif $window.button_down?(Button::KbRight) and @x < ($scene.mapa.width * 32) - @pose.width
			@direccion = "right"
			if not $scene.mapa.solid(@x_pies+16, @y_pies) and not $scene.solid_event_infront?(self)
				walk if can_walk?
			end
		elsif $window.button_down?(Button::KbUp) and @y > 0 - $scene.screen_y
			@direccion = "up"
			if not $scene.mapa.solid(@x_pies, @y_pies-16) and not $scene.solid_event_infront?(self)
				walk if can_walk?
			end
		elsif $window.button_down?(Button::KbDown) and @y < ($scene.mapa.height * 32) - @pose.height
			@direccion = "down"
			if not $scene.mapa.solid(@x_pies, @y_pies+6) and not $scene.solid_event_infront?(self)
				walk if can_walk?
			end
		else 
			case @direccion
				when "left"
					@pose = @poses[4]
				when "right"
					@pose = @poses[8]
				when "up"
					@pose = @poses[12]
				when"down"
					@pose = @poses[0]
			end
			@direccion = "standing"
		end
		self.draw
	end
end