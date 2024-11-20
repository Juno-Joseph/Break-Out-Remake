extends Node2D

@onready var blockObj = preload("res://Scenes/block.tscn") #Loads block into scene

var columns = 22
var rows = 7
var margin = 50 #Margin is allowing a little gap in between the blocks

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setupLevel()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setupLevel():
	
	var colors = _getColors() #calls colors func so that we can use it to change blocks
	colors.shuffle() #shuffles color order
	
	for r in rows:
		for c in columns: #loops through each row and column
			var randomNumber = randi_range(0, 2) # gives us random #between 0,1,&2
			if randomNumber > 0: #now this randomizes block placement
				
				var newBlock = blockObj.instantiate() #creates obj in game
				add_child(newBlock) #adds as child to lvl
				newBlock.position = Vector2(margin + (50 * c), margin + (34 * r))
				
				var sprite = newBlock.get_node('Sprite2D') #reference to sprite
				if r <= 9: #sets up color changing by rows
					sprite.modulate = colors[0]
				if r < 6:
					sprite.modulate = colors[1]
				if r < 3:
					sprite.modulate = colors[2]


func _getColors():
	var colors = [ #Array of colors to choose from for blocks
		Color(0, 1, 1, 1,),
		Color(0.54, 0.17, 0.89, 1),
		Color(0.68, 1, 0.18, 1),
		Color(1, 1, 1, 1),
	]
	return colors
