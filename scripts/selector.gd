extends CharacterBody2D

var direction = 0

var pointsadded = 0
var totalpoints = 0

# Direction facing code, taken abd modified from https://docs.godotengine.org/en/stable/tutorials/2d/2d_movement.html
func _process(delta):
	direction = rad_to_deg(get_global_mouse_position().angle_to_point(position)) - 90
	
	if(not(direction > 90 or direction < -90) and $"/root/Main/Board Cover".rotation_degrees == 0):
		rotation_degrees = direction

# Detect click and process where it is
func _input(event):
	if(event.is_action_pressed("click") and $"/root/Main/Board Cover".rotation_degrees == 0):
		totalpoints += pointsadded
		$"/root/Main/Points Counter".text = str(totalpoints)

# Detect collision (slightly unoptimized)
func four_entered(area: Area2D) -> void:
	pointsadded = 4
	
	print("Four point entered.")
func four_exited(area: Area2D) -> void:
	if pointsadded == 4:
		pointsadded = 3
		
	print("Four point exited.")
func three_entered(area: Area2D) -> void:
	if pointsadded == 2:
		pointsadded = 3
		
	print("Three point entered.")
func three_exited(area: Area2D) -> void:
	if pointsadded >= 3:
		pointsadded = 2
		
	print("Three point exited.")
func two_entered(area: Area2D) -> void:
	if pointsadded == 0:
		pointsadded = 2
		
	print("Two point entered.")
func two_exited(area: Area2D) -> void:
	pointsadded = 0
	
	print("Two point exited.")
