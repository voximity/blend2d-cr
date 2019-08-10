# blend2d-cr

Bindings for Blend2D's C API to Crystal.

[Blend2D](https://blend2d.com/) is a high performance 2D vector graphics engine.

## Usage

This is a very unfinished binding for Blend2D.

```cr
img = Blend2D::Image.new 200, 200
ctx = Blend2D::Context.new img

ctx.composition_operator = Blend2D::CompositionOperator::SourceCopy
ctx.fill_all

path = Blend2D::Path.new
path.move_to 25, 25
path.line_to 175, 25
path.line_to 175, 175
path.line_to 25, 175

gradient = Blend2D::Gradient.linear 25, 25, 175, 175
gradient.add_stop 0, Blend2D::RGBA32.new 255, 0, 0, 255
gradient.add_stop 1, Blend2D::RGBA32.new 0, 0, 255, 255

ctx.composition_operator = Blend2D::CompositionOperator::SourceOver
ctx.fill_style = gradient
ctx.fill_path path

ctx.end

codec = Blend2D::Codec.new
codec.find_by_name "BMP"
img.write_to_file "test.bmp", codec
```

![test.bmp](https://i.imgur.com/7hOREPm.png)

## Examples

See the `example` directory.