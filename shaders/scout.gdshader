shader_type canvas_item;
uniform vec3 color: source_color = vec3(1);
uniform float progress: hint_range(0.0, 1.0, 0.1) = 0;

void fragment() {
	
	float a = texture(TEXTURE, UV).a;
	COLOR  = mix(texture(TEXTURE,UV), vec4(vec3(1), a), progress);
}
