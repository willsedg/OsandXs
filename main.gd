extends Node

var turn = 0
var players = ["X", "O"]

var grid = []
var grid_width = 3
var grid_height = 3
var winner = ""

func _ready():
	$Board.hide()
	
func _process(delta):
	if winner != "":
		game_over()

func new_game():
	winner = ""
	_instantiate_grid()
	turn = randi_range(0,1)
	$Board.clear()
	$Board.show()
	
func game_over():
	$Board.hide()
	$Overlay/Message.text= winner + " WINS!"
	$Overlay/Message.show()
	print(winner + " WINS")
	winner = ""
	$GameOverTimer.start()

func _on_overlay_start_game() -> void:
	new_game()

func _on_board_board_square_pressed(coords) -> void:
	#check square is empty
	if grid[coords[0]][coords[1]] == "none":
		grid[coords[0]][coords[1]] = players[turn%2]
		#add mark in square grid
		$Board.play_square(coords, players[turn%2])
		#check win condition
		_check_win()
				
		turn+=1

func _check_win():
	#Check Vertical
	for i in grid_width:
		if (grid[i][0] == grid[i][1] && grid[i][1] == grid[i][2]) && grid[i][0] != "none":
			winner = grid[i][0]
	#Check Horizontal
	for i in grid_height:
		if (grid[0][i] == grid[1][i] && grid[1][i] == grid[2][i]) && grid[0][i] != "none":
			winner = grid[0][i]
	#Check Diagonals
	if (grid[0][0] == grid[1][1] && grid[1][1] == grid[2][2]) && grid[0][0] != "none":
		winner = grid[0][0]
	
	if (grid[2][0] == grid[1][1] && grid[1][1] == grid[0][2]) && grid[2][0] != "none":
		winner = grid[2][0]

func _instantiate_grid():
	grid=[]
	for i in grid_width:
		grid.append([])
		for j in grid_height:
			grid[i].append("none") # Set a starter value for each position

func _on_game_over_timer_timeout() -> void:
	$Overlay/Button.show()
	$Overlay/Message.text= "Noughts and Crosses!"
