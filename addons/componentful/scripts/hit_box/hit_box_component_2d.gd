class_name HitBoxComponent2D extends Area2D

signal damage_dealt(from: HitBoxComponent2D, damage_data: BaseDamageData)

@export var damage_data: BaseDamageData


func _ready() -> void:
	area_entered.connect(_on_area_entered)


func _on_area_entered(area: Area2D) -> void:
	if area is HurtBoxComponent2D:
		damage_dealt.emit(self, damage_data)
		area.take_damage(self, damage_data)
