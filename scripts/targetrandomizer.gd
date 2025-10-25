extends Node

var random = RandomNumberGenerator.new()

func _ready():
	randomTargetPosition()

func randomTargetPosition():
	self.rotation_degrees = random.randi_range(-70, 70)
