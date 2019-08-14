require "../src/blend2d.cr"

text = "Hello blend2d-cr!"

image = Blend2D::Image.new 430, 160
ctx = Blend2D::Context.new image

ctx.composition_operator = Blend2D::CompositionOperator::SourceCopy
ctx.fill_all

face = Blend2D::FontFace.new "NotoSans-Regular.ttf" # This is freely available through fonts.google.com
font = Blend2D::Font.new face: face, size: 48

gradient = Blend2D::Gradient.linear 0, 0, 480, 0
gradient.add_stop 0, Blend2D::RGBA32.new 129, 80, 163, 255
gradient.add_stop 1, Blend2D::RGBA32.new 25, 201, 255, 255

ctx.composition_operator = Blend2D::CompositionOperator::SourceOver
ctx.fill_style = gradient
ctx.stroke_style = gradient
ctx.stroke_width = 1.5
ctx.fill_text Blend2D::Point.new(20, 68), font, text
ctx.stroke_text Blend2D::Point.new(20, 128), font, text

codec = Blend2D::Codec.new
codec.find_by_name "BMP"
image.write_to_file "example/text.bmp", codec
