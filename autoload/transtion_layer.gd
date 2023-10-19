extends CanvasLayer

func transtion_scene(scnene: String) -> void:
	$AnimationPlayer.play("fade_to_black")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(scnene)
	$AnimationPlayer.play_backwards("fade_to_black")
