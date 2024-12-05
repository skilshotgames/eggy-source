extends Node2D
onready var anims := $AnimationPlayer
onready var monitor := $Area2D

var active := false

func _ready():
	monitor.monitoring = false
	anims.play("load")

func _process(delta):
	pass

func _on_AnimationPlayer_animation_started(anim_name):
	if anim_name == "fire":
		active = true
		monitor.monitoring = true


func _on_Area2D_body_entered(body):
	if active:
		if body.is_in_group("player"):
			body.laserhurt()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "load":
		anims.play("fire")
	if anim_name == "fire":
		queue_free()
