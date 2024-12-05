extends Node2D

export (PackedScene) var laser
export (PackedScene) var knife
onready var player := $Player
onready var scoretxt := $ScoreTrack
onready var spawntimer := $Timer
onready var knifespawn := $Timer2
onready var scoretime := $updatescore

func _ready():
	Gamebase.isRunning = true
	Gamebase.score = 0
	
	spawntimer.start()
	knifespawn.start()
	scoretime.start()

func _process(delta):
	scoretxt.text = "SCORE: " + str(Gamebase.score)   
	spawntimer.wait_time = rand_range(1,5)
	knifespawn.wait_time = rand_range(0.8,1.5)

func _on_Timer_timeout():
	var bad = laser.instance()
	add_child(bad)
	bad.position.y = player.position.y


func _on_updatescore_timeout():
	if Gamebase.isRunning:
		Gamebase.score += 1
		scoretime.start()
	else:
		scoretime.stop()


func _on_Timer2_timeout():
	var bad = knife.instance()
	bad.set_position(randomize_spawn_point())
	add_child(bad)

func randomize_spawn_point():
	var s = 0
	var spawn_point

	randomize()
	s = int(round(rand_range(0.51, 4.49)))

	if s == 1: # top edge
		spawn_point = Vector2(rand_range(0, get_viewport_rect().size.x),0)
	if s == 3: # bottom edge
		spawn_point = Vector2(rand_range(0, get_viewport_rect().size.x), get_viewport_rect().size.y)
	if s == 2: # right edge
		spawn_point = Vector2(get_viewport_rect().size.x, rand_range(0, get_viewport_rect().size.y))
	if s == 4: # left edge
		spawn_point = Vector2(0, rand_range(0, get_viewport_rect().size.y))

	return spawn_point
