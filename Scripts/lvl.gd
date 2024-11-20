extends Node2D

@onready var brickObj = preload("res://Scenes/block.tscn")

var columns = 20
var rows = 7
var margin = 50 #Margin is allowing a little gap in between the bricks

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setupLevel()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setupLevel():
	
	for r in rows:
		for c in columns: #loops through each row and column
			
			var newBrick = brickObj.instantiate() #creates obj in game
			add_child(newBrick) #adds as child to lvl
			newBrick.position = Vector2(margin + (34 * c), margin + (34 * r))
			
			
			
			
			
			
			
			
			
			
			
