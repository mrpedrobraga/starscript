

--script1
    with brush
        select Pencil1
        stroke %screen_center (32 32)
    shader apply my_shader
        image: %current_image
        strength: 0.5




--save <variable> into <target_path> [with <protocol>]

###
Saves the value stored in <variable> into <target_path>.

The optionally specified <protocol> dictates what's done
to the value before it's saved.

###


string: Hello World.

save string into my_string.txt

sh echo what

my_shader: ```glsl
	layout (set = 0, binding = 0, rgba32f) uniform image2D image;

	void main() {
		ivec2 fcoord = ivec2(gl_GlobalInvocationID.xy);
		vec2 uv = gl_GlobalInvocationID.xy / vec2(imageSize(image));
		
		vec4 col = imageLoad (
			image,
			fcoord
		);
		
		float luma = 0.2126 * col.r + 0.7152 * col.g + 0.0722 * col.b;
		
		vec4 col_grayscale = vec4(vec3(luma), 1.0);
		
		imageStore(image, fcoord, col_grayscale);
	}
```

save my_shader into grayscale.glsl with ElementsRasterDataModifier