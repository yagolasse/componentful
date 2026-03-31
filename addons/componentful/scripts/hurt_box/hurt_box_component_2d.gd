class_name HurtBoxComponent2D extends Area2D

signal damage_taken(from: HitBoxComponent2D, damage: BaseDamageData)

@export var health: HealthData


func take_damage(from: HitBoxComponent2D, damage: BaseDamageData) -> void:
	damage_taken.emit(from, damage)
	damage.apply_damage(health)
