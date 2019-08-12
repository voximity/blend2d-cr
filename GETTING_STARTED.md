# Getting Started

*NOTE: This article is a conversion of [this page](https://blend2d.com/doc/getting-started.html) from the Blend2D website.*

blend2d-cr is a binding for Blend2D. You can visit the download page [here](https://blend2d.com/download.html).
It is recommended you build and install Blend2D in such a way that it is accessible to your whole system, as
blend2d-cr requires this.

# Preparation Steps

Find a spot you would like to start your new blend2d-cr project, and run `crystal init app <name>` assuming you are
looking to build an app.

```sh
# Create the app and move there.
$ crystal init app workspace
$ cd workspace
```

You need to tell Crystal that you depend on blend2d-cr. You can do this by adding to the `dependencies` in your `shard.yml`:

```yml
dependencies:
    blend2d:
        github: voximity/blend2d-cr.git
```

Refresh your dependencies using `shards install`.

# First Application

```cr
require "blend2d"

img = Blend2D::Image.new 480, 480

# Attach a rendering context onto `img`.
ctx = Blend2D::Context.new img

# Clear the image.
ctx.composition_operator = Blend2D::CompositionOperator::SourceCopy
ctx.fill_all

# Fill some path.
path = Blend2D::Path.new
path.move_to 26, 31
path.cubic_to 642, 132, 587, -136, 25, 464
path.cubic_to 882, 404, 144, 267, 27, 31

ctx.composition_operator = Blend2D::CompositionOperator::SourceOver
ctx.fill_style = Blend2D::RGBA32.new(0xFFFFFFFF) # or Blend2D::RGBA32::WHITE or Blend2D::RGBA32.new 255, 255, 255, 255
ctx.fill_path path

# Detach the rendering context from `img`.
ctx.end

# Let's use some built-in codecs provided by Blend2D.
codec = Blend2D::Codec.new "BMP"
img.write_to_file "bl-getting-started-1.bmp", codec
```

This should generate `bl-getting-started-1.bmp` in your working directory:

![bl-getting-started-1.bmp](https://blend2d.com/resources/images/getting-started-1.png)

# Gradients

blend2d-cr provides a `Gradient` class that can be used to describe the following gradients:

* Linear gradient from `[x0, y0]` to `[x1, y1]` constructed with `Blend2D::Gradient.linear`
* Radial gradient having the center at `[cx, cy]`, focal point at `[fx, fy]`, and radius `r` constructed with `Blend2D::Gradient.radial`
* Conical gradient having the center at `[cx, cy]` and angle `a` constructed with `Blend2D::Gradient.conical`

The next example shows how to create a linear gradient:

```cr
img = Blend2D::Image.new 480, 480
ctx = Blend2D::Context.new img

ctx.composition_operator = Blend2D::CompositionOperator::SourceCopy
ctx.fill_all

# Coordinates can be specified now or changed later.
linear = Blend2D::Gradient.linear x0: 0, y0: 0, x1: 0, y1: 480

# Color stops can be added in any order. Below are three different ways to add stops.
linear.add_stop 0, Blend2D::RGBA32.new(0xFFFFFFFF)
linear.add_stop Blend2D::GradientStop.new(offset: 0, rgba32: Blend2D::RGBA32.new 0xFF5FAFDF)
linear << Blend2D::GradientStop.new(offset: 1, rgba32: Blend2D::RGBA32.new 0xFF2F5FDF)

# `fill_style=` can be used for both colors and styles.
ctx.fill_style = linear

ctx.composition_operator = Blend2D::CompositionOperator::SourceOver
ctx.fill_geometry Blend2D::RoundRect.new x: 40, y: 40, w: 400, h: 400, r: 45.5
ctx.end

codec = Blend2D::Codec.new "BMP"
img.write_to_file "bl-getting-started-2.bmp", codec
```

This should generate `bl-getting-started-2.bmp` in your working directory:

![bl-getting-started-2.bmp](https://blend2d.com/resources/images/getting-started-2.png)

# Patterns

Patterns in Blend2D represent an image, transformation matrix, and other properties line extend mode and filter.
A single image can be used by multiple patterns and it's also possible to use only part of an image as a pattern.

```cr
img = Blend2D::Image.new 480, 480
ctx = Blend2D::Context.new img

ctx.composition_operator = Blend2D::CompositionOperator::SourceCopy
ctx.fill_all

# Read an image from a file.
texture = Blend2D::Image.new "texture.jpeg"

# Create a pattern and use it to fill a rounded rect.
pattern = Blend2D::Pattern.new texture

ctx.composition_operator = Blend2D::CompositionOperator::SourceOver
ctx.fill_style = pattern
ctx.fill_geometry Blend2D::RoundRect.new x: 40, y: 40, w: 400, h: 400, r: 45.5

ctx.end

codec = Blend2D::Codec.new "BMP"
img.write_to_file "bl-getting-started-3.bmp", codec
```

This should generate `bl-getting-started-3.bmp` in your working directory:

![bl-getting-started-3.bmp](https://blend2d.com/resources/images/getting-started-3.png)

# Transformations

Transformations can be applied to geometry, images, and styles.

```cr
img = Blend2D::Image.new 480, 480
ctx = Blend2D::Context.new img

ctx.composition_operator = Blend2D::CompositionOperator::SourceCopy
ctx.fill_all

# Read an image from a file.
texture = Blend2D::Image.new "texture.jpeg"

# Rotate by 45 degrees about a point at [240, 240].
ctx.rotate angle: Math::PI / 4, cx: 240, cy: 240

ctx.composition_operator = Blend2D::CompositionOperator::SourceOver
ctx.fill_style = Blend2D::Pattern.new texture
ctx.fill_geometry Blend2D::RoundRect.new x: 50, y: 50, w: 380, h: 380, r: 80.5

ctx.end

codec = Blend2D::Codec.new "BMP"
img.write_to_file "bl-getting-started-4.bmp", codec
```

This should generate `bl-getting-started-4.bmp` in your working directory:

![bl-getting-started-4.bmp](https://blend2d.com/resources/images/getting-started-4.png)

The exact same transformations that can be applied to a `Context` can also be applied to paths and styles.
It's also possible to use a `Matrix` to build a transformation matrix consisting of several consecutive
transformations and apply it at once.

# Composition

Blend2D supports all Porter & Duff composition operators and many blending operators that are described
in SVG and PDF specifications. These operators can be set via `Context#composition_operator=`.

```cr
img = Blend2D::Image.new 480, 480
ctx = Blend2D::Context.new img

ctx.composition_operator = Blend2D::CompositionOperator::SourceCopy
ctx.fill_all

# First shape filled by a radial gradient.
radial = Blend2D::Gradient.radial x0: 180, y0: 180, x1: 180, y1: 180, r: 180
radial.add_stop 0, Blend2D::RGBA32.new 0xFFFFFFFF
radial.add_Stop 1, Blend2D::RGBA32.new 0xFFFF6F3F

ctx.composition_operator = Blend2D::CompositionOperator::SourceOver
ctx.fill_style = radial
ctx.fill_geometry Blend2D::Circle.new cx: 180, cy: 180, r: 180

# Second shape filled by a linear gradient.
linear = Blend2D::Gradient.linear x0: 195, y0: 195, x1: 470, y1: 470
linear.add_stop 0, Blend2D::RGBA32.new 0xFFFFFFFF
linear.add_stop 1, Blend2D::RGBA32.new 0xFF3F9FFF

ctx.composition_operator = Blend2D::CompositionOperator::Difference
ctx.fill_style = linear
ctx.fill_geometry Blend2D::RoundRect.new x: 195, y: 195, w: 270, h: 270, r: 25

ctx.end

codec = Blend2D::Codec.new "BMP"
img.write_to_file "bl-getting-started-5.bmp", codec
```

This should generate `bl-getting-started-5.bmp` in your working directory:

![bl-getting-started-5.bmp](https://blend2d.com/resources/images/getting-started-5.png)

# Stroking

Stroking can be specified through `StrokeOptions` or set directly through `Context` as demonstrated in the example below.

```cr
img = Blend2D::Image.new 480, 480
ctx = Blend2D::Context.new img

ctx.composition_operator = Blend2D::CompositionOperator::SourceCopy
ctx.fill_all

linear = Blend2D::Gradient.linear 0, 0, 0, 480
linear.add_stop 0, Blend2D::RGBA32::WHITE
linear.add_stop 1, Blend2D::RGBA32.new 0xFF1F7FFF

path = Blend2D::Path.new
path.move_to 119, 49
path.cubic_to 259, 29, 99, 279, 275, 267
path.cubic_to 537, 245, 300, -170, 274, 430

ctx.composition_operator = Blend2D::CompositionOperator::SourceOver
ctx.stroke_style = linear
ctx.stroke_width = 15
ctx.start_cap = Blend2D::StrokeCap::Round
ctx.end_cap = Blend2D::StrokeCap::Butt
ctx.stroke_path path

ctx.end

codec = Blend2D::Codec.new "BMP"
img.write_to_file "bl-getting-started-6.bmp", codec
```

This should generate `bl-getting-started-6.bmp` in your working directory:

![bl-getting-started-6.bmp](https://blend2d.com/resources/images/getting-started-6.png)

# Text Rendering

Text rendering was added recently to Blend2D and it's one of the features that would need further improvements,
so the implementation in blend2d-cr is subject to change. blend2d-cr provides both low-level and high-level interfaces
to render text.

```cr
img = Blend2D::Image.new 480, 480
ctx = Blend2D::Context.new img

ctx.composition_operator = Blend2D::CompositionOperator::SourceCopy
ctx.fill_all

face = Blend2D::FontFace.new "NotoSans-Regular.ttf"
font = Blend2D::Font.new face, 50

ctx.fill_style = Blend2D::RGBA32::WHITE
ctx.fill_text Blend2D::Point.new(60, 80), font, "Hello Blend2D!"

ctx.rotate Math::PI / 4
ctx.fill_text Blend2D::Point.new(250, 80), font, "Rotated Text"

ctx.end

codec = Blend2D::Codec.new "BMP"
img.write_to_file "bl-getting-started-7.bmp", codec
```

This should generate `bl-getting-started-7.bmp` in your working directory:

![bl-getting-started-7.bmp](https://blend2d.com/resources/images/getting-started-7.png)

# Glyph Buffer

`GlyphBuffer` is a high-level blend2d-cr interface to a low-level Blend2D object that can be used to
convert text to glyphs and to retrieve useful information about them. If you need to position text
or calculate text metrics then the `GlyphBuffer` is the only way of obtaining such information.

```cr
img = Blend2D::Image.new 480, 480
ctx = Blend2D::Context.new img

ctx.composition_operator = Blend2D::CompositionOperator::SourceCopy
ctx.fill_all

ctx.fill_style = Blend2D::RGBA32::WHITE

face = Blend2D::FontFace.new "NotoSans-Regular.ttf"
font = Blend2D::Font.new face, 20

metrics = font.metrics
buffer = Blend2D::GlyphBuffer.new

text = "Hello blend2D-cr!\nI'm a simple multiline text example\nthat uses GlyphBuffer and fill_glyph_run!"

x = 20
y = 190 + metrics.ascent

text.split("\n").each do |line|
    buffer.set_text text
    font.shape buffer
    text_metrics = font.text_metrics(buffer)

    x = (480 - (text_metrics.bounding_box.b.x - text_metrics.bounding_box.a.x)) / 2
    ctx.fill_glyph_run Blend2D::Point.new(x, y), font, buffer.glyph_run
    y += metrics.ascent + metrics.descent + metrics.line_gap
end

ctx.end

codec = Blend2D::Codec.new "BMP"
img.write_to_file "bl-getting-started-8.bmp", codec
```

This should generate `bl-getting-started-8.bmp` in your working directory:

![bl-getting-started-8.bmp](https://blend2d.com/resources/images/getting-started-8.png)

# More...?

You can check out the `example` directory in this repository, or look at more examples at Blend2D's website linked
at the top of this page.