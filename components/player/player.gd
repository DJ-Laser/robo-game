class_name Player extends CharacterBody2D

const ACCELERATION = 300
const MAX_SPEED = 700.0
const MAX_JUMP_VELOCITY = 700.0

var start_pos: Transform2D
var target_velocity = 0
var remaining_ticks = 0
var instructions: Array[AstNode] = []

func _ready() -> void:
	self.start_pos = self.transform

func reset(instructions: Array[AstNode]) -> void:
	self.transform = self.start_pos
	self.remaining_ticks = 0
	self.target_velocity = 0
	self.instructions = instructions

func jump(velocity: float) -> void:
	if is_on_floor():
		self.velocity.y = -clamp(velocity, 0, MAX_JUMP_VELOCITY)

func process_instruction() -> void:
	var ast_node = self.instructions.pop_front()
	
	if ast_node == null:
		self.target_velocity = 0
		return
	
	if ast_node is InstructionAstNode:
		var instruction: InstructionAstNode = ast_node
		match instruction.kind:
			InstructionAstNode.InstructionKind.FORWARD:
				self.target_velocity = 300
			InstructionAstNode.InstructionKind.JUMP:
				jump(500)
			InstructionAstNode.InstructionKind.WAIT:
				self.remaining_ticks = 30

func _physics_process(delta: float) -> void:
	if self.remaining_ticks > 0:
		self.remaining_ticks -= 1
	else:
		process_instruction()
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	self.velocity.x = move_toward(velocity.x, target_velocity, ACCELERATION)
	self.velocity.x = clamp(self.velocity.x, -MAX_SPEED, MAX_SPEED)

	move_and_slide()
