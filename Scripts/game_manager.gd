extends Node

var score = 0
var level = 1

# Called when the node enters the scene tree for the first time.
func addPoints(points):
	score += points  

func _process(delta: float) -> void:
	#we pull score label here beacuse we want to keep track of score 
	#and turn it into a string so that we can update it
	$CanvasLayer/ScoreLabel.text = str(score) 
	#same with level here
	$CanvasLayer/LevelLabel.text = "Level: " + str(level)
	
#Remeber for this type of UI stuff, add this scene to AutoLoad in GameManager so that when we reload
#it doesnt dissapear
