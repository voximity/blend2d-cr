require "../src/blend2d.cr"

# Create a new image that is 480x480 and assign a new context to it
image = Blend2D::Image.new 64, 64
ctx = Blend2D::Context.new image

# Clear the context
ctx.composition_operator = Blend2D::CompositionOperator::SourceCopy
ctx.fill_style = Blend2D::RGBA32::RED
ctx.fill_all

# End the context
ctx.end

data = image.data
puts data