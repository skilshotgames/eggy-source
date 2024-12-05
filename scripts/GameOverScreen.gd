extends Control

onready var finalScoretxt := $totalscore

func _process(delta):
	finalScoretxt.text = "SCORE: " + str(Gamebase.score)
	
	if Gamebase.isRunning:
		visible = false
	else:
		visible = true


func _on_replayBTN_pressed():
	get_tree().change_scene("res://scenes/level.tscn")
