class_name AttackComponent2D extends Area2D

signal targets_changed(target_array: Array[Area2D])
signal attack_triggered(target: Area2D)

@export var cooldown: float
@export var auto_attack: bool

var _cooldown_timer: float = 0
var _targets: Array[Area2D] = []


func _ready() -> void:
	area_entered.connect(_on_attack_area_entered)
	area_exited.connect(_on_attack_area_exited)


func _process(delta: float) -> void:
	_cooldown_timer -= delta
	
	attack_if_possible(auto_attack)


func _on_attack_area_entered(area: Area2D) -> void:
	if not _targets.has(area):
		_targets.append(area)
		
		targets_changed.emit(_targets)


func _on_attack_area_exited(area: Area2D) -> void:
	var i := _targets.find(area)
	
	if i != -1:
		_targets.remove_at(i)
		
		targets_changed.emit(_targets)


func attack_if_possible(authorized: bool = true) -> void:
	if authorized and _cooldown_timer < 0 and not _targets.is_empty():
		_cooldown_timer = cooldown
		attack_triggered.emit(_targets[0])
