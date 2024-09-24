extends Node2D

signal square_pressed

@export var column = 0
@export var row = 0

@export var X_Texture: CompressedTexture2D
@export var O_Texture: CompressedTexture2D

func set_texture(texture):
	match texture:
		"none":
			$Sprite2D.texture = null
		"X":
			$Sprite2D.texture = X_Texture
		"O":
			$Sprite2D.texture = O_Texture

func _on_button_pressed() -> void:
	var coords = [column, row]
	print("button pressed: " + str(coords))	
	square_pressed.emit(coords)
