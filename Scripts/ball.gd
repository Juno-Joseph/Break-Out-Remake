extends CharacterBody2D

var speed = 200.0
var dir = Vector2.DOWN
var is_active = true

func _ready():
	velocity = Vector2(speed * -1, speed) #vector2 is x and y, sets velocity of ball down and to the left based on speed val

func _physics_process(delta):
	if is_active:
		var collision = move_and_collide(velocity * delta) #moves ball each frame based on delta time
		
		if collision: #when ball collides with paddle
			velocity = velocity.bounce(collision.get_normal())#gives us bounce direction for ball and sets vel for opposite direction
			
			if collision.get_collider().has_method("hit"):
				collision.get_collider().hit() #calls hit function on brick when abll hit it
			
		if(velocity.y > 0 and velocity.y < 100):# prevents ball from just boucing left and right continuously beacuse the vertival velocity would be to slow to make a difference
			velocity.y = -200 #if velocity y is to low we shoot it up a little bit
		
		if(velocity.x == 0): #prevents ball from just boucing up and down continuously beacuse the horizontal velocity would be to slow to make a difference
			velocity.x = -200 #if velocity x is to low we will shoot it right a bit
		

func gameOver():
	get_tree().reload_current_scene()

func _on_deathzone_body_entered(body: Node2D) -> void:
	gameOver()
