extends Node

onready var mob = preload("res://mob.tscn")

var mobs_remaining = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#begin timer
	$mob_spawn_timer.start(1)
	mobs_remaining = 5



func _on_mob_spawn_timer_timeout():
	#make an instance of the mob
	var mob_instance = null
	mob_instance = mob.instance()
	
	#set starting position and destination
	mob_instance.position = $start_position.position
	mob_instance.destination = $end_position.position
	
	# set the path it'll follow
	var path = $nav.get_simple_path($start_position.position, $end_position.position)
	mob_instance.set_path(path)
	
	#add the mob to the entities container
	$entities.add_child(mob_instance)
	
	mobs_remaining -= 1 
	if mobs_remaining > 0:
		$mob_spawn_timer.start(1)
