class Knight
	attr_accessor :position, :next_moves, :parent

	def initialize(position, parent = [])
		@position = position
		@parent = parent
	end

	def set_moves
		start_x = position[0]
		start_y = position[1]
		ones_array = [-1, 1]
		twos_array = [-2, 2]
		next_moves = []

		ones_array.map do |n|
			new_x = n + start_x
			twos_array.map do |n|
				new_y = n + start_y
				if new_x.between?(0,7) && new_y.between?(0,7)
					next_moves << [new_x, new_y]
				end
			end
		end		

		twos_array.map do |n|
			new_x = n + start_x
			ones_array.map do |n|
				new_y = n + start_y
				if new_x.between?(0,7) && new_y.between?(0,7)
					next_moves << [new_x, new_y]
				end
			end
		end

		return next_moves
	end

end

class Game

	def initialize
		@board = []
		for n in 0..7
			for q in 0..7
				square = [n, q]
				@board.push(square)
			end
		end
	end

	def display

	end

	def knight_moves(start, finish)
	start_node = Knight.new(start)
	queue = [start_node]

	until queue.empty?
		checking = queue.shift
		if checking.position == finish
			p checking.position
			return checking
		else
			next_moves = checking.set_moves
			next_moves.each do |move|
				move = Knight.new(move, checking)
				queue << move unless queue.include?(move)
			end
		end

	end
    		
	end

end

stuff = Game.new
p stuff.knight_moves([0, 0], [3, 7])
