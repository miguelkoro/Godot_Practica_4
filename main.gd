extends Node2D

@export var lights: Array[PointLight2D] 
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var lightsPower: bool = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		switch_lights()

func switch_lights():
	if lightsPower:
		for light in lights:
			light.visible=false
		animation_player.play("lights_blink")
		lightsPower = false
	else:
		for light in lights:
			light.visible=true
		lightsPower = true
		animation_player.stop()
