extends CanvasLayer

signal start_game

func _on_button_pressed() -> void:
	$Button.hide()
	$Message.hide()
	start_game.emit()
