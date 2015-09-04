
extends RigidBody2D

var input_states = preload("res://Scripts/input_states.gd")

export var playerSpeed = 200
export var jumpForce = 200
export var acceleration = 5
export var extra_gravity = 300

var raycast_down = null
var currentSpeed = Vector2(0,0)

var setaDireita = input_states.new("seta_direita")
var setaEsquerda = input_states.new("seta_esquerda")
var espaco = input_states.new("espaco")

func is_on_ground():
	if raycast_down.is_colliding():
		return true
	else:
		return false

func move(speed, acc, delta):
	currentSpeed.x = lerp(currentSpeed.x, speed, acc * delta)
	set_linear_velocity(Vector2(currentSpeed.x, get_linear_velocity().y))

func _ready():
	raycast_down = get_node("RayCast2D")
	raycast_down.add_exception(self)
	set_fixed_process(true)
	set_applied_force(Vector2(0, extra_gravity))
	
func _fixed_process(delta):
	
	set_friction(0)
	
	
	if setaDireita.check() == 2:
		move(playerSpeed,acceleration,delta)
		#set_linear_velocity(Vector2(playerSpeed, get_linear_velocity().y))
	elif setaEsquerda.check() == 2:
		move(-playerSpeed,acceleration,delta)
		#set_linear_velocity(Vector2(-playerSpeed, get_linear_velocity().y))
	else:
		move(0,acceleration,delta)
		#set_linear_velocity(Vector2(0, get_linear_velocity().y))
		
	if is_on_ground():
		if espaco.check() == 1:
			set_axis_velocity(Vector2(0, -jumpForce))
	
	


