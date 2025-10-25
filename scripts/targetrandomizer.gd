extends Node

# Prepreparing the usage of random numbers
var random = RandomNumberGenerator.new()

func _ready():
	randomTargetPosition()

# Used to generate a random position and place the target in that position
func randomTargetPosition():
	self.rotation_degrees = random.randi_range(-70, 70)
