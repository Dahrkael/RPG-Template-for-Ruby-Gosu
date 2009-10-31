class Party
	attr_accessor :main_party
	attr_accessor :reserve_party
	attr_accessor :steps
	attr_accessor :gold
	attr_reader :items
	def initialize(window)
		@window = window
		@main_party = []
		@reserve_party = []
		@gold = @window.initial.gold
		@steps = 0
		@items = {}
		@weapons = {}
		@armors = {}
	end
	
	def setup_initial_party
		for i in @window.initial.party
			@main_party.push(i)
			i.chara = Image.load_tiles(@window, i.chara_filename, 32, 48, false)
		end
	end
	
	def add_hero(name, job, filename)
		if @main_party.size < 4
			@main_party.push(Hero.new(name, job, filename))
		elsif @main_party >= 4
			@reserve_party.push(Hero.new(name, job, filename))
		end
	end
	
	def move_hero(from, position, where)
		where.push(from[position])
		from.slice!(position)
	end
	
	def delete_hero(from, position)
		from.slice!(position)
	end
	
	def gain_gold(n)
		@gold = [[@gold + n, 0].max, 9999999].min
	end

	def lose_gold(n)
		gain_gold(-n)
	end

	def increase_steps
		@steps = [@steps + 1, 9999999].min
	end
	
	def item_number(item_id)
		if @items.include?(item_id)
			return @items[item_id]
		else
			return 0
		end
	end
	
	def gain_item(item_id, n)
		@items[item_id] = [[item_number(item_id) + n, 0].max, 99].min
	end
end
