extends CharacterBody2D

class_name Enemy
var speed: float = 250.0

@onready var targer = $"../CharacterBody2D"
@onready var sprite_2d = $Sprite2D

func _ready():
	sprite_2d.animation = "enemy"

func _physics_process(delta):
	if targer == null: get_tree().get_nodes_in_group("Player")[0]
	if targer != null:
		velocity = position.direction_to(targer.position) * speed
		move_and_slide()
		
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
