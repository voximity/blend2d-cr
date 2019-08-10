require "../src/blend2d.cr"

img = Blend2D::Image.new 500, 260 # Create a new image that is 500x500
ctx = Blend2D::Context.new img # Create a context and bind it to the image

# Clear the image
ctx.composition_operator = Blend2D::CompositionOperator::SourceCopy
ctx.fill_all

# Set some simple colors up
red = Blend2D::RGBA32.new 255, 0, 0, 255
green = Blend2D::RGBA32.new 0, 255, 0, 255
blue = Blend2D::RGBA32.new 0, 0, 255, 255
yellow = Blend2D::RGBA32.new 255, 255, 0, 255

# Just some spacing parameters
padding : Float64 = 20
size : Float64 = 100

# Rectangle
ctx.fill_style = red
ctx.fill_geometry Blend2D::Rect.new x: padding, y: padding, w: size, h: size # Identical to ctx.fill_rect ...

# Rounded rectangle
ctx.fill_style = green
ctx.fill_geometry Blend2D::RoundRect.new x: size + padding * 2, y: padding, w: size, h: size, rx: 20, ry: 20

# Stroke rectangle
ctx.stroke_style = red
ctx.stroke_width = 5
ctx.stroke_geometry Blend2D::Rect.new x: size * 2 + padding * 3, y: padding, w: size, h: size

# Stroke rounded rectangle
ctx.stroke_style = green
ctx.stroke_geometry Blend2D::RoundRect.new x: size * 3 + padding * 4, y: padding, w: size, h: size, rx: 20, ry: 20

# Circle
ctx.fill_style = blue
ctx.fill_geometry Blend2D::Circle.new cx: padding + size / 2, cy: size * 1.5 + padding * 2, r: size / 2

# Pie arc
ctx.fill_style = yellow
ctx.fill_geometry Blend2D::Arc.new cx: size + padding * 2, cy: size + padding * 2, rx: size, ry: size, start: 0, sweep: Math::PI / 2, arc_type: Blend2D::ArcType::Pie

# Path stroke
path = Blend2D::Path.new
path.move_to size * 2 + padding * 3, size + padding * 2
path.line_to size * 2 + padding * 3, size * 2 + padding * 2
path.line_to size * 3 + padding * 3, size + padding * 2
path.line_to size * 3 + padding * 3, size * 2 + padding * 2
ctx.stroke_style = blue
ctx.stroke_width = 12
ctx.stroke_caps = Blend2D::StrokeCap::Triangle
ctx.stroke_join = Blend2D::StrokeJoin::Round
ctx.stroke_path path

# Path fill
path = Blend2D::Path.new
path.move_to size * 3 + padding * 4, size + padding * 2
path.line_to size * 3 + padding * 4, size * 2 + padding * 2
path.line_to size * 4 + padding * 4, size + padding * 2
path.line_to size * 4 + padding * 4, size * 2 + padding * 2
ctx.fill_style = yellow
ctx.fill_path path

# Make a new image codec we can use to output our image
codec = Blend2D::Codec.new
codec.find_by_name "BMP"
img.write_to_file "example/geometry.bmp", codec