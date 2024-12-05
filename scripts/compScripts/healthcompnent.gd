class_name healthcomponent extends Node2D

export var hp: int

func setBase():
	hp = 1

func damage():
	hp -= 1
	if hp < 1:
		Gamebase.isRunning = false
