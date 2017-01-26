extends Node2D

var amount = randi()%100
var radius = 10

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _draw():
	draw_circle(get_pos(), radius, Color(1, 1, 1, 0.5))