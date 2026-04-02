# Componentful

## A simple set-of-ready to use Godot components for games.

### Combat components
I crated some basic combat related components:
- `AttackComponent2D`: This component is just like the tower that shoots, the shots being `HitBoxComponent2D`s.
- `HealthData`: Basically a numeric value. A resource can be create to have a value. The `Resource.changed` signal can be observed to get updates about the new value.
- `HitBoxComponent2D`: This component is just like the bullet or spell. It deals makes the `BaseDamageData` apply its damage to the `HealthData`.

### State Machine
I basically copied the state machine from [GDQuest](https://www.gdquest.com/tutorial/godot/design-patterns/finite-state-machine/). There they have a good usage example and explanation.
