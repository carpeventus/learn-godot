extends ItemContainer

func be_hit() -> void:
	if not is_open:
		$LidSprite.hide()
		opened.emit($SpawnPosition.global_position, current_direction)
		is_open = true
