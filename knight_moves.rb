class Square
	attr_accessor :position, :next_moves, :move_history

	def initialize(position)
		@position = position
		@next_moves = set_moves(position)
		@move_history = []
	end

	def set_moves(position)
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
		@paths = Array.new
	end

	def display
		p @paths
	end

	def knight_moves(start, finish)
	current_position = @board.select {|square| square.position == start}
	already_checked = []
	queue = [] << start
	until queue.empty?
		checking = queue.shift
		already_checked << checking unless already_checked.include?(checking)
		checking = @board.select {|square| square.position == checking}
		checking[0].move_history << checking[0].position

		if checking[0].position == finish
			p checking
			return checking
		else
			checking[0].next_moves.each do |move|
				square = @board.select {|square| square.position == move}
				square[0].move_history << checking[0].move_history 
				queue << move unless already_checked.include?(move) || queue.include?(move)
			end
		end

	end
    		
	end

end

stuff = Game.new
stuff.knight_moves([0, 0], [0, 0])
