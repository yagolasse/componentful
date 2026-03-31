class_name HealthData extends Resource

@export var amount: float:
	get(): return amount
	
	set(value):
		if is_equal_approx(amount, value): return
		amount = max(0, value)
		emit_changed()

var is_alive: bool:
	get(): return amount > 0

var is_dead: bool:
	get(): return amount < 0 || is_zero_approx(amount)
