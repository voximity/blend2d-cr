# blend2d-cr

blend2d-cr is a library that binds Blend2D to Crystal. It comes with a high-level interface (`Blend2D`) for making interacting
with Blend2D's C API much easier. However, you can still use the C API directly (`Blend2D::C`), if you wish.

[Blend2D](https://blend2d.com/) is a high performance 2D vector graphics engine.

## Usage

1. Obtain and build [Blend2D](https://github.com/blend2d/blend2d)
    * For Arch, you can use your favorite AUR helper: `yay -S blend2d-git`
    * Further instructions are available at [blend2d.com/download.html](https://blend2d.com/download.html).
2. Add to your `shard.yml`'s dependencies
    ```cr
    dependencies:
        blend2d:
            github: voximity/blend2d-cr.git
    ```
3. Add `require "blend2d"` to the top of your source file

### Getting Started

The Blend2D website has a Getting Started page of its own. See `GETTING_STARTED.md` for this library's
own equivalent using the same examples using blend2d-cr.

### Examples

#### Composition

This example is from Blend2D's [Getting Started](https://blend2d.com/doc/getting-started.html) page.

![example/composition.bmp](https://i.imgur.com/7bwLzdd.png)

```cr
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
codec = Blend2D::Codec.new "BMP"
image.write_to_file "example/composition.bmp", codec
```

#### Other examples

See the `example` directory.

### Garbage collection

Because Crystal is a garbage-collected language, there is no need to call any manual C methods
to clean up after a no-longer-in-use Blend2D object. This is done automatically through each
high-level class's `finalize` method.

### C API

You can use the direct C binding through the `Blend2D::C` namespace. The lib is called `LibBlend2D`.
A good amount of methods and types are implemented, but some that are considered unnecessary are not\*.
The source for the C bindings are in `/src/blend2d/c`.

The naming scheme for C structs are identical in this binding. However, the method naming
scheme is not. In the C API, methods of Blend2D are prefixed with `bl`, which is followed by
the topic that method represents, then some CamelCased text describing the purpose of the method.
In `Blend2D::C`, methods are renamed without `bl` and are snake_cased instead, to follow the basic
naming conventions of Crystal.

Here are some examples:
* `BLContextCore` is `LibBlend2D::BLContextCore`
* `blContextInit` is `LibBlend2D.context_init`
* `blFontGetGlyphRunOutlines` is `LibBlend2D.font_get_glyph_run_outlines`

\* The assumption that some methods and types are unnecessary is arbitrary. If you have a need for a certain
method or type, either create an issue or a PR and I will work on implementing it.

## Contributing & maintaining

I will maintain this library as Blend2D changes. Please keep in mind that not only is this binding in a very early state
(e.g. not all features will work), Blend2D is in also in a very early state, and everything is subject to change. There will
be breaking changes, and this library may not be up-to-date all of the time.

## Docs

Run `crystal docs`.