extends Control

@onready
var code_editor = %CodeEditor
var parser: Parser

@export
var player: Player

func _init() -> void:
	parser = Parser.new()

func _process(delta: float) -> void:
	pass

func _on_run_button_pressed() -> void:
	if player != null:
		player.reset(parse_code(code_editor.text))

func parse_code(code: String) -> Array[AstNode]:
	return self.parser.parse(code)
	
