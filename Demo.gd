extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var minx = 128
onready var maxx = 960 - 128
onready var miny = 128
onready var maxy = 540 -128
onready var halftimex = 1.0
onready var halftimey = 0.3
onready var mins = Vector2(0.2, 0.2)
onready var maxs = Vector2(0.8, 0.8)


# Called when the node enters the scene tree for the first time.
func _ready():
	var tweenx = get_node("TweenX")
	tweenx.interpolate_property($ShinyBall,"position:x", minx, maxx, halftimex, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0)
	tweenx.interpolate_property($ShinyBall,"position:x", maxx, minx, halftimex, Tween.TRANS_SINE, Tween.EASE_IN_OUT, halftimex)
	tweenx.repeat = true
	tweenx.start()
	tweenx.seek(halftimex/2.0)

	var tweeny = get_node("TweenY")
	tweeny.interpolate_property($ShinyBall,"position:y", miny, maxy, halftimey, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0)
	tweeny.interpolate_property($ShinyBall,"position:y", maxy, miny, halftimey, Tween.TRANS_SINE, Tween.EASE_IN_OUT, halftimey)
	tweeny.repeat = true
	#tweeny.seek(halftimey/2)
	tweeny.start()

	var tweens = get_node("TweenS")
	tweens.interpolate_property($ShinyBall,"scale", maxs, mins, halftimex, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0)
	tweens.interpolate_property($ShinyBall,"scale", mins, maxs, halftimex, Tween.TRANS_SINE, Tween.EASE_IN_OUT, halftimex)
	tweens.repeat = true	
	tweens.start()
	#tweens.seek(halftimex/2.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
