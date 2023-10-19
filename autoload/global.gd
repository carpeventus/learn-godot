extends Node

signal stat_changed()

var laser_amount := 20:
	set(value):
		laser_amount = value
		stat_changed.emit()

var grenade_amount := 5:
	set(value):
		grenade_amount = value
		stat_changed.emit()


var health := 50:
	set(value):
		health = value
		stat_changed.emit()
		
