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
		if value >= 100:
			value = 100
		if value <= 0:
			value = 0
		health = value
		stat_changed.emit()
		
