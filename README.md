# blend2d-cr

Ridiclously unfinished Blend2D bindings for Crystal.

## Usage

This library is unbelievably unfinished. If you wish to use it or develop with it, go for it.

### Things I'm pretty sure work

```cr
include Blend2D

img = Image.new 480, 480
ctx = Context.new img

ctx.set_composition_operator CompositionOperator::SOURCE_COPY
ctx.fill_all

path = Path.new
path.move_to 26, 31
path.cubic_to 642, 132, 587, -136, 25, 464
path.cubic_to 882, 404, 144, 267, 27, 31

ctx.set_composition_operator CompositionOperator::SOURCE_OVER
ctx.set_fill_style RGBA32.new 255, 255, 255, 255
ctx.fill_path path

ctx.end

codec = Codec.find_by_name "BMP"
img.write_to_file "test.bmp", codec
```