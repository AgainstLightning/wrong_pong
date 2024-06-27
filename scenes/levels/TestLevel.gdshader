shader_type canvas_item;

uniform vec2 mouse_pos; // Mouse position relative to the viewport
uniform vec2 viewport_size; // Dimensions of the viewport
uniform float grid_size = 20.0; // Size of each grid cell
uniform float max_length = 18.0; // Maximum length of the hairs
uniform float hair_width = 1; // Width of the hairs

void fragment() {
    vec2 cell_center = (floor(FRAGCOORD.xy / grid_size) + 0.5) * grid_size;
    vec2 norm_mouse_pos = mouse_pos / viewport_size;
    vec2 norm_cell_center = cell_center / viewport_size;

    // Calculate direction and distance from cell center to mouse
    vec2 direction = norm_mouse_pos - norm_cell_center;
    float distance = length(direction);
    direction = normalize(direction);

    // Normalize the distance to a range and calculate hair length inversely
    float max_distance = sqrt(1.0 + pow(viewport_size.y / viewport_size.x, 2.0));
    float normalized_distance = clamp(distance / max_distance, 0.0, 1.0);
    float hair_length = max_length * normalized_distance; // Inverse relationship for length

    // Adjust the direction based on distance
    if (normalized_distance < 0.01) { // If very close, make the hair stand up
        direction = vec2(0.0, -1.0); // Stand up straight
    }

    // Endpoint of the hair
    vec2 end_point = cell_center + direction * hair_length;

    // Color based on distance remains the same
    vec4 color = vec4(1.0 - normalized_distance, 1.0 - normalized_distance, 1.0 - normalized_distance, 0.33);

    // Calculate the shortest distance to the line segment
    vec2 to_point = FRAGCOORD.xy - cell_center;
    float proj = dot(to_point, direction);
    vec2 proj_point = cell_center + proj * direction;
    float line_dist = length(FRAGCOORD.xy - proj_point);

    // Check if the fragment is within the hair width
    if (proj >= 0.0 && proj <= hair_length && line_dist <= hair_width / 2.0) {
        COLOR = color;
    } else {
        COLOR = vec4(0.0, 0.0, 0.0, 0.0); // Transparent
    }
}

