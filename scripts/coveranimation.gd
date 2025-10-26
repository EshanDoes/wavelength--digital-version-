extends StaticBody2D

#func _ready():
#	CoverOpen(60)

# Cover opening animation (currently unused due to not working, will fix later)
func CoverOpen(animationTime):
	for i in animationTime:
		self.rotation_degrees = ease(i/animationTime, 0.3) * 180
