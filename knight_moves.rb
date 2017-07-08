class Board
	attr_accessor :board

	def initialize
		@board = []
		for n in 0..7
			for x in 0..7
				@board.push([n,x])
			end
		end
	end

	def display
		count = 56
		8.times do |line|
			8.times do |squre|
				print @board[count]
				count += 1
			end
			count -= 16
			print "\n"
		end
	end
end

class Knight

	def initialize
		@traveled = []
		
	end

def knight_moves(start = [0, 0], finish = [7, 7])
		
		return start if start == finish
		print start 
		@traveled << start
		start_x = start[0]
		start_y = start[1]
		ones_array = [-1, 1]
		twos_array = [-2, 2]

		ones_array.map do |n|
			new_x = n + start_x
			twos_array.map do |n|
				new_y = n + start_y
				if new_x.between?(0,7) && new_y.between?(0,7) && @traveled.include?([new_x, new_y]) == false
					knight_moves([new_x, new_y], finish)
				end
			end
		end		

		twos_array.map do |n|
			new_x = n + start_x
			ones_array.map do |n|
				new_y = n + start_y
				if new_x.between?(0,7) && new_y.between?(0,7) && @traveled.include?([new_x, new_y]) == false
					knight_moves([new_x, new_y], finish)
				end
			end
		end


		
		return nil
	end

end

bord = Board.new
knight = Knight.new
puts knight.knight_moves([2,2], [3,4])