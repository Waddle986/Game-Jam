extends Camera2D

var fixed_y = 0

func _ready():
	fixed_y = global_position.y

func _process(delta):
	global_position = Vector2(global_position.x, fixed_y)
