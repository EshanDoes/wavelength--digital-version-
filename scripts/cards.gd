extends Node

var leftColor = Color.from_hsv(1,1,1)
var rightColor = Color.from_hsv(1,1,1)

var addedY = 0

var oppositesJSON = "res://other/opposites.tres"

func _ready():
	randomColors()

# Generate a random color for each half of the card (the code Color.from_hsv(randf(), 1, 1) is taken from Copilot AI Summary)
func randomColors():
	leftColor = Color.from_hsv(randf(), 1, 0.8)
	rightColor = Color.from_hsv(randf(), 1, 0.8)
	
	$lefthalf.modulate = leftColor
	$righthalf.modulate = rightColor

# Detect when the mouse clicks and hide the card while the cover is open
func _input(event):
	if(event.is_action_pressed("click") and $"/root/Main/Board Cover".rotation_degrees == 0):
		for i in 50:
			addedY = ease(i/50.0, 0.3) * 220
			self.position.y = 500 + addedY
			
			await get_tree().create_timer(0.01).timeout
		randomColors()
		await get_tree().create_timer(3).timeout
		for i in 50:
			addedY = 220 - ease(i/50.0, 0.3) * 220
			self.position.y = 500 + addedY
			
			await get_tree().create_timer(0.01).timeout

func readOpposites():
	print(JSON.new().parse(oppositesJSON))
