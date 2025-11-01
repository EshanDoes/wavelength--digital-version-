extends CharacterBody2D

var direction = 0

var pointsadded = 0
var totalpoints = 0

var pointsDisplay
var boardCover

# Initializing the variables for other nodes
func _ready():
	pointsDisplay = $"/root/Main/Points Counter"
	boardCover = $"/root/Main/Board Cover"

# Direction facing code, taken abd modified from https://docs.godotengine.org/en/stable/tutorials/2d/2d_movement.html
func _process(delta):
	direction = rad_to_deg(get_global_mouse_position().angle_to_point(position)) - 90
	
	if(not(direction > 90 or direction < -90) and boardCover.rotation_degrees == 0):
		rotation_degrees = direction

# Detect click and process where it is
func _input(event):
	if(event.is_action_pressed("click") and boardCover.rotation_degrees == 0):
		totalpoints += pointsadded
		
		if(not pointsadded == 0):
			await get_tree().create_timer(3.8).timeout
			textEffect(25.0)
			print("Text updated!")

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

# Text points effect for extra juice
func textEffect(animationTime):
	var currentColor = Color(1.0, 0.7, 0.0, 1.0)
	pointsDisplay.text = str(totalpoints)
	$pointsfx.play()
	
	for i in animationTime:
		var currentEase = ease(i/animationTime, 0.4)
		
		currentColor = Color(1.0, currentEase*0.3+0.7, currentEase, 1.0)
		pointsDisplay.label_settings.font_color = currentColor
		
		pointsDisplay.position.y = currentEase*-10 + 10
		
		await get_tree().create_timer(0.01).timeout
