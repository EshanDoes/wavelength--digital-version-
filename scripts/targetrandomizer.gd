extends Node

# Prepreparing the usage of random numbers
var random = RandomNumberGenerator.new()

# Start the game by generating a random position for the target
func _ready():
	randomTargetPosition()

# Detect if the mouse is clicked, and randomize the target after the board animation
func _input(event):
	if(event.is_action_pressed("click") and $"/root/Main/Board Cover".rotation_degrees == 0):
		await get_tree().create_timer(3).timeout
		
		randomTargetPosition()

# Used to generate a random position and place the target in that position
func randomTargetPosition():
	self.rotation_degrees = random.randi_range(-70, 70)
