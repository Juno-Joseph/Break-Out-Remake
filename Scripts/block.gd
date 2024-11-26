extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func hit():
	
	GameManager.addPoints(1)
	
	$Sprite2D.visible = false
	$CollisionShape2D.disabled = true
	
	var bricksLeft = get_tree().get_nodes_in_group('Block')
	
	#Last brick, we go to next level and reload the scene
	if bricksLeft.size() == 1:
		get_parent().get_node("Ball").is_actve = false
		await  get_tree().create_timer(1).timeout
		GameManager.level += 1
		get_tree().reload_current_scene()
		#Not Last brick
	else:
		await get_tree().create_timer(1).timeout
		queue_free()
