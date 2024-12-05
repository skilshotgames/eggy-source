extends Area2D

var speed := 150.0

func _ready():
	look_at(get_parent().player.position)

func _process(delta):
	position += transform.x * speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Knife_body_entered(body):
	if body.is_in_group("player"):
		body.laserhurt()
