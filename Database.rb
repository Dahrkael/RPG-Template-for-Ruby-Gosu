
	module Database
	
		def self.load_items
			$data_items = Array.new(1)
			items = File.readlines("database/objects.txt").map { |line| line.chomp }
			#@items = []
			for i in 0...items.size
				$data_items.push(items[i].split(';'))
			end
		end
		
		def self.load_npcs(npc)
			npc_load = File.readlines("events/"+npc+".txt").map { |line| line.chomp }
			x = npc_load[1]
			x.gsub!('x:', '')
			y = npc_load[2]
			y.gsub!('y:', '')
			filename = npc_load[3]
			filename.gsub!('filename:', '')
			movement = npc_load[4]
			movement.gsub!('movement:', '')
			face = npc_load[5]
			face.gsub!('face:', '')
			solid = npc_load[6]
			solid.gsub!('solid:', '')	
			solid = eval(solid)			
			route = npc_load[7] 
			route.gsub!('route:', '')
			commands = []
			for i in 0...npc_load.size
				next if (0...8).include?(i)
				commands.push(npc_load[i]) 
			end
			commands.to_s.gsub!('commands:', '')
			return x.to_i,y.to_i,filename,movement,face,solid,route,commands
		end
		
	end