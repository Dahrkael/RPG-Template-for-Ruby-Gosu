

module Tileset
	def self.load_map(window, filename)
		
		@capa = File.readlines(filename).map { |line| line.chomp }
		@height = @capa.size - 1
		@width = @capa[1].size
		@tiles = Array.new(@width) do |x|
				Array.new(@height) do |y|
					case @capa[y+1][x, 1]
					when '0'
						0
					when '1'
						1
					when '2'
						2
					when '3'
						3
					when '4'
						4
					when '5'
						5
					when '6'
						6
					when '7'
						7
					when '8'
						8
					when '9'
						9
					when 'a'
						10
					when 'b'
						11
					when 'c'
						12
					when 'd'
						13
					when 'e'
						14
					when 'f'
						15
					when 'g'
						16
					when 'h'
						17
					when 'i'
						18
					when 'j'
						19
					when 'k'
						20
					when 'l'
						21
					when 'm'
						22
					when 'n'
						23
					when 'o'
						24
					when 'p'
						25
					when 'q'
						26
					when 'r'
						27
					when 's'
						28
					when 't'
						29
					when 'u'
						30
					when 'v'
						31
					when 'w'
						32
					when 'x'
						33
					when 'y'
						34
					when 'z'
						35
					when 'A'
						36
					when 'B'
						37
					when 'C'
						38
					when 'D'
						39
					when 'E'
						40
					when 'F'
						41
					when 'G'
						42
					when 'H'
						43
					when 'I'
						44
					when 'J'
						45
					when 'K'
						46
					when 'L'
						47
					when 'M'
						48
					when 'N'
						49
					when 'O'
						50
					when 'P'
						51
					when 'Q'
						52
					when 'R'
						53
					when 'S'
						54
					when 'T'
						55
					when 'U'
						56
					when 'V'
						57
					when 'W'
						58
					when 'X'
						59
					when 'Y'
						60
					when 'Z'
						61
					#when '%'
					#	'%'
					else
						nil
					end #case
				end # y
			end # x
			@npcs = @capa[0].to_s.split(';')
		@data = [@tiles, @width, @height, @npcs]
		return @data
	end # def
end #module
