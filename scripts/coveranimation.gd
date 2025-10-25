extends StaticBody2D

func _ready():
	CoverOpen(60)

func CoverOpen(animationTime):
	for i in animationTime:
		self.rotation_degrees = ease(i/animationTime, 0.3) * 180
