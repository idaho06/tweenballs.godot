extends Node2D

export(int) var balls = 20
export(float) var time_between_balls = 0.5

#onready var minx = 128
#onready var maxx = 960 - 128
#onready var miny = 128
#onready var maxy = 540 -128
#onready var halftimex = 0.5
#onready var halftimey = 0.5
#onready var mins = Vector2(0.2, 0.2)
#onready var maxs = Vector2(0.8, 0.8)

onready var ShinyBallScene = preload("res://shinyball.tscn")
onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start(0.5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	if balls>0:
		var shinyballInstance = ShinyBallScene.instance()
		get_tree().current_scene.add_child(shinyballInstance)
		balls-=1
		timer.start(time_between_balls)
