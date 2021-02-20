extends Sprite

export(float) var minx = 128
export(float) var maxx = 960 - 128
export(float) var miny = 128
export(float) var maxy = 540 -128
export(float) var halftimex = 5.0
export(float) var halftimey = 1.0
export(Vector2) var mins = Vector2(0.2, 0.2)
export(Vector2) var maxs = Vector2(0.4, 0.4)

export(bool) var start = true

onready var tweenx = $TweenX
onready var tweeny = $TweenY
onready var tweens = $TweenS

# Called when the node enters the scene tree for the first time.
func _ready():
	if start:
		tweenx.interpolate_property(self,"position:x", minx, maxx, halftimex, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0)
		tweenx.interpolate_property(self,"position:x", maxx, minx, halftimex, Tween.TRANS_SINE, Tween.EASE_IN_OUT, halftimex)
		tweenx.repeat = true
		tweenx.seek(halftimex/2.0)

		tweeny.interpolate_property(self,"position:y", miny, maxy, halftimey, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0)
		tweeny.interpolate_property(self,"position:y", maxy, miny, halftimey, Tween.TRANS_SINE, Tween.EASE_IN_OUT, halftimey)
		tweeny.repeat = true
		#tweeny.seek(halftimey/2)

		tweens.interpolate_property(self,"scale", maxs, mins, halftimex, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0)
		tweens.interpolate_property(self,"scale", mins, maxs, halftimex, Tween.TRANS_SINE, Tween.EASE_IN_OUT, halftimex)
		
		var maxz = int(maxs.length_squared()*1024.0)
		var minz = int(mins.length_squared()*1.0)
		tweens.interpolate_property(self,"z_index", maxz, minz, halftimex, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0)
		tweens.interpolate_property(self,"z_index", minz, maxz, halftimex, Tween.TRANS_SINE, Tween.EASE_IN_OUT, halftimex)
		
		tweens.repeat = true
		tweens.start()
		#tweens.seek(halftimex/2.0)

		tweenx.start()
		tweeny.start()

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
