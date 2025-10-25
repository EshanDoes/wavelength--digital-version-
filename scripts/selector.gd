extends CharacterBody2D

var direction = 0
# Direction facing code taken from https://docs.godotengine.org/en/stable/tutorials/2d/2d_movement.html
func _process(delta):
	direction = rad_to_deg(get_global_mouse_position().angle_to_point(position)) - 90
	
	if(not(direction > 90 or direction < -90)):
		rotation_degrees = direction
	print(direction)
