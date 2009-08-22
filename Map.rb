
include Gosu

class Map
	attr_reader :width
	attr_reader :height
	attr_reader :filename
	attr_reader :tileset_filename
	def initialize(window, filename, tileset)
		@filename = filename
		@tileset_filename = tileset
		@tileset = Image.load_tiles(window, tileset, 32, 32, true)
		@data_1 = Tileset::load_map(window, filename)
		@width = @data_1[1]
		@height = @data_1[2]
		@capa_1 = @data_1[0]
		@data_2 = Tileset::load_map(window, filename+"-2")
		@width_2 = @data_2[1]
		@height_2 = @data_2[2]
		@capa_2 = @data_2[0]
	end
	
	def update
		@height.times do |y|
			@width.times do |x|
				tile = @capa_1[x][y]
				next if x * 32 > $scene.screen_x + 640
				next if x * 32 < $scene.screen_x - 32
				next if y * 32 > $scene.screen_y + 480
				next if y * 32 < $scene.screen_y - 32
				if tile
					@tileset[tile].draw(x * 32 - $scene.screen_x, y * 32- $scene.screen_y, 1)
				end
			end
		end
		@height_2.times do |y|
			@width_2.times do |x|
				tile = @capa_2[x][y]
				next if x * 32 > $scene.screen_x + 640
				next if x * 32 < $scene.screen_x - 32
				next if y * 32 > $scene.screen_y + 480
				next if y * 32 < $scene.screen_y - 32
				if tile
					@tileset[tile].draw(x * 32 - $scene.screen_x, y * 32 - $scene.screen_y, 1)
				end
			end
		end
	end
	def solid(x, y)
		begin
			return true if @capa_2[x/32][y/32]
		rescue
		end
		return false
	end
end

