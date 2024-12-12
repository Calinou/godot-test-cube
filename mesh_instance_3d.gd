@tool
extends MeshInstance3D


func _ready() -> void:
	const TEST_TEXTURE_SIZE = 256
	var image := Image.create(TEST_TEXTURE_SIZE, TEST_TEXTURE_SIZE, false, Image.FORMAT_RGB8)

	for x in TEST_TEXTURE_SIZE:
		for y in TEST_TEXTURE_SIZE:
			var c: Color
			var r := 255 - (x + y) / 2

			if (x % (TEST_TEXTURE_SIZE / 8)) < 2 or (y % (TEST_TEXTURE_SIZE / 8)) < 2:
				c.r8 = y
				c.g8 = r
				c.b8 = x
			else:
				c.r8 = r
				c.g8 = x
				c.b8 = y

			image.set_pixel(x, y, c)

	image.generate_mipmaps()
	var test_texture := ImageTexture.create_from_image(image)

	material_override.albedo_texture = test_texture
