require "../src/blend2d.cr"

# Create a new image that is 480x480 and assign a new context to it
image = Blend2D::Image.new 480, 480
ctx = Blend2D::Context.new image

# Clear the context
ctx.composition_operator = Blend2D::CompositionOperator::SourceCopy
ctx.fill_all

 # Create a radial gradient for the circle
radial_gradient = Blend2D::Gradient.radial 180, 180, 180, 180, 180
radial_gradient.add_stop 0, Blend2D::RGBA32.new 255, 255, 255, 255
radial_gradient.add_stop 1, Blend2D::RGBA32.new 255, 150, 80, 255

# Draw a circle using the gradient
ctx.composition_operator = Blend2D::CompositionOperator::SourceOver
ctx.fill_style = radial_gradient
ctx.fill_geometry Blend2D::Geometry::Circle.new cx: 180, cy: 180, r: 160

# Create a linear gradient for the rounded rectangle
linear_gradient = Blend2D::Gradient.linear 195, 195, 470, 470
linear_gradient.add_stop 0, Blend2D::RGBA32.new 255, 255, 255, 255
linear_gradient.add_stop 1, Blend2D::RGBA32.new 80, 150, 255, 255

# Draw the rounded rectangle
ctx.composition_operator = Blend2D::CompositionOperator::Difference
ctx.fill_style = linear_gradient
ctx.fill_geometry Blend2D::Geometry::RoundRect.new x: 195, y: 195, w: 270, h: 270, r: 25

# End the context
ctx.end

# Create a codec from one of the built-in ones, and output "example/composition.bmp"
codec = Blend2D::Codec.new
codec.find_by_name "BMP"
image.write_to_file "example/composition.bmp", codec