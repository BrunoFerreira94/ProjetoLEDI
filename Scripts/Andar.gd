
extends RigidBody2D

export var playerSpeed = 200
export var acceleration = 5

var currentSpeed = Vector2(0,0)

var setaDireita = Input.is_action_pressed("seta_direita")
var setaEsquerda = Input.is_action_pressed("seta_esquerda")

func move(speed, acc, delta):
	currentSpeed.x = lerp(currentSpeed.x, speed, acc * delta)
	set_linear_velocity(Vector2(currentSpeed.x, get_linear_velocity().y))

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):

	setaDireita = Input.is_action_pressed("seta_direita")
	setaEsquerda = Input.is_action_pressed("seta_esquerda")
	
	set_friction(0)
	
	
	if setaDireita:
		move(playerSpeed,acceleration,delta)
		#set_linear_velocity(Vector2(playerSpeed, get_linear_velocity().y))
	elif setaEsquerda:
		move(-playerSpeed,acceleration,delta)
		#set_linear_velocity(Vector2(-playerSpeed, get_linear_velocity().y))
	else:
		move(0,acceleration,delta)
		#set_linear_velocity(Vector2(0, get_linear_velocity().y))
		
	
	


