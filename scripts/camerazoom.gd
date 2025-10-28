extends Node

var zoomLevel = 1.0

# Detect the input and zoom in camera for a slight bit of extra juice
func _input(event):
	if(event.is_action_pressed("click") and $"/root/Main/Board Cover".rotation_degrees == 0):
		for i in 50:
			zoomLevel = (ease(i/50.0, 0.4)*0.05) + 1
			self.zoom.x = zoomLevel
			self.zoom.y = zoomLevel
			
			await get_tree().create_timer(0.01).timeout
		await get_tree().create_timer(2.25).timeout
		for i in 50:
			zoomLevel = 1.05 - (ease(i/50.0, 0.4)*0.05)
			self.zoom.x = zoomLevel
			self.zoom.y = zoomLevel
			
			await get_tree().create_timer(0.01).timeout
