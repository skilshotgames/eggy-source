class_name player extends KinematicBody2D

onready var anims := $AnimatedSprite
onready var HC := $healthcompnent
onready var crackMP3 := $CrackSound
export var speed := 200.0

var velocity: Vector2

func _ready() -> void:
	HC.setBase()
	anims.play("default")

func _process(delta):
	if !Gamebase.isRunning:
		crackMP3.play()
		anims.play("Cooked") 

func _physics_process(delta) -> void:
	velocity = Vector2()
	var hm := Input.get_axis("LEFT","RIGHT")
	var vm := Input.get_axis("UP","DOWN")
	
	if Gamebase.isRunning:
		velocity.x = speed * hm
		velocity.y = speed * vm
		
		velocity = velocity.normalized() * speed
	
	velocity = move_and_slide(velocity)
	
	if velocity != Vector2(0,0):
		anims.play("Walk")
	else:
		anims.play("default")

func _on_damagezone_body_entered(body) -> void:
	if body.is_in_group("bad"):
		HC.damage()

func laserhurt():
	HC.damage()

