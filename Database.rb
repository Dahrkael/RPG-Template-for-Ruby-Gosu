
	module Database
	
		def self.load_items
			$data_items = Array.new(1)
			items = File.readlines("database/objects.txt").map { |line| line.chomp }
			@items = []
			for i in 0...items.size
				$data_items.push(items[i].split(';'))
			end
		end
	
	end