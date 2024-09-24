extends Node2D

signal board_square_pressed

func _ready():
	for square in $Squares.get_children():
		square.set_texture("none")
		square.connect("square_pressed", _on_square_pressed)

func play_square(coords, texture):
	for square in $Squares.get_children():
		if square.column == coords[0] && square.row == coords[1]:
			square.set_texture(texture)

func clear():
	for square in $Squares.get_children():
		square.set_texture("none")

func _on_square_pressed(coords):
	print("grid button pressed: " + str(coords))
	board_square_pressed.emit(coords)
