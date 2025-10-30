extends Node

var leftColor = Color.from_hsv(1,1,1)
var rightColor = Color.from_hsv(1,1,1)

func _ready():
	randomColors()

# Generate a random color for each half of the card (the code Color.from_hsv(randf(), 1, 1) is taken from Copilot AI Summary)
func randomColors():
	leftColor = Color.from_hsv(randf(), 1, 0.8)
	rightColor = Color.from_hsv(randf(), 1, 0.8)
	
	$lefthalf.modulate = leftColor
	$righthalf.modulate = rightColor
