		new_x = start[0] -1
		new_y = start[1] -2
		knight_moves([new_x, new_y], finish) if new_x.between?(0,7) && new_y.between?(0,7)
		new_x = start[0] -1
		new_y = start[1] +2
		knight_moves([new_x, new_y], finish) if new_x.between?(0,7) && new_y.between?(0,7)
		new_x = start[0] +1
		new_y = start[1] -2
		knight_moves([new_x, new_y], finish) if new_x.between?(0,7) && new_y.between?(0,7)
		new_x = start[0] +1
		new_y = start[1] +2
		knight_moves([new_x, new_y], finish) if new_x.between?(0,7) && new_y.between?(0,7)

		new_x = start[0] -2
		new_y = start[1] -1
		knight_moves([new_x, new_y], finish) if new_x.between?(0,7) && new_y.between?(0,7)
		new_x = start[0] -2
		new_y = start[1] +1
		knight_moves([new_x, new_y], finish) if new_x.between?(0,7) && new_y.between?(0,7)
		new_x = start[0] +2
		new_y = start[1] -1
		knight_moves([new_x, new_y], finish) if new_x.between?(0,7) && new_y.between?(0,7)
		new_x = start[0] +2
		new_y = start[1] +1
		knight_moves([new_x, new_y], finish) if new_x.between?(0,7) && new_y.between?(0,7)