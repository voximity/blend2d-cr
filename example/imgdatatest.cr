require "../src/blend2d.cr"

# Create a new image that is 480x480 and assign a new context to it
image = Blend2D::Image.new 480, 480
ctx = Blend2D::Context.new image

# Clear the context
ctx.composition_operator = Blend2D::CompositionOperator::SourceCopy
ctx.fill_all

# Create a radial gradient for the circle
radial_gradient = Blend2D::Gradient.radial x0: 180, y0: 180, x1: 180, y1: 180, r: 180
radial_gradient.add_stop 0, Blend2D::RGBA32::WHITE
radial_gradient.add_stop 1, Blend2D::RGBA32.new r: 255, g: 150, b: 80, a: 255

# Draw a circle using the gradient
ctx.composition_operator = Blend2D::CompositionOperator::SourceOver
ctx.fill_style = radial_gradient
ctx.fill_geometry(Blend2D::Geometry::Circle.new cx: 180, cy: 180, r: 160)

# Create a linear gradient for the rounded rectangle
linear_gradient = Blend2D::Gradient.linear x0: 195, y0: 195, x1: 470, y1: 470
linear_gradient.add_stop 0, Blend2D::RGBA32::WHITE
linear_gradient.add_stop 1, Blend2D::RGBA32.new r: 80, g: 150, b: 255, a: 255

# Draw the rounded rectangle
ctx.composition_operator = Blend2D::CompositionOperator::Difference
ctx.fill_style = linear_gradient
ctx.fill_geometry(Blend2D::Geometry::RoundRect.new x: 195, y: 195, w: 270, h: 270, r: 25)

# End the context
ctx.end

codec = Blend2D::Codec.new "BMP"
io = image.write_io(codec)
File.open("example/imgdatatest.bmp", "w") do |f|
    IO.copy(io, f)
end
