require "../src/blend2d.cr"

img = Blend2D::Image.new 480, 480
ctx = Blend2D::Context.new img

ctx.set_composition_operator Blend2D::CompositionOperator::SOURCE_COPY
ctx.fill_all

path = Blend2D::Path.new
path.move_to 26, 31
path.cubic_to 642, 132, 587, -136, 25, 464
path.cubic_to 882, 404, 144, 267, 27, 31

ctx.set_composition_operator Blend2D::CompositionOperator::SOURCE_OVER
ctx.set_fill_style Blend2D::RGBA32.new 255, 255, 255, 255
ctx.fill_path path

ctx.end

codec = Blend2D::Codec.new
codec.find_by_name "BMP"
img.write_to_file "getting_started.bmp", codec