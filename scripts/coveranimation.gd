extends StaticBody2D

# Detect click and animate cover when clicked
func _input(event):
	if(event.is_action_pressed("click") and self.rotation_degrees == 0):
		CoverOpen(50.0)
		await get_tree().create_timer(3).timeout
		CoverClose(50.0)

# Cover opening animation
func CoverOpen(animationTime):
	for i in animationTime:
		self.rotation_degrees = ease(i/animationTime, 0.3) * 180
		await get_tree().create_timer(0.01).timeout
		
		print(self.rotation_degrees)

# Cover closing animation
func CoverClose(animationTime):
	for i in animationTime:
		self.rotation_degrees = 180 + round(-ease(i/animationTime, 0.3) * 180)
		await get_tree().create_timer(0.01).timeout
		
		print(self.rotation_degrees)
