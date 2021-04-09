include Blend2D::C

module Blend2D::Rendering
  class ContextCookie
    @core = uninitialized LibBlend2D::BLContextCookie

    protected def initialize(@core : LibBlend2D::BLContextCookie)
    end

    protected def pointer
      pointerof(@core)
    end
  end

  class Context < BLStructure
    # Initialize the context using the given Image.
    def initialize(image : Image)
      @image = image
      @core = uninitialized LibBlend2D::BLContextCore
      LibBlend2D.context_init_as(pointer, @image.pointer, nil)
    end

    protected def pointer : Pointer(LibBlend2D::BLContextCore)
      pointerof(@core)
    end

    def finalize
      LibBlend2D.context_destroy(pointer)
    end

    # Ends this context.
    def end
      LibBlend2D.context_end(pointer)
    end

    # Flush context (what does this do?)

    # Save this context into a `ContextCookie`.
    def save : ContextCookie
      LibBlend2D.context_save(pointer, out cookie)
      ContextCookie.new cookie
    end

    # Restore this context from a `ContextCookie`.
    def restore(cookie : ContextCookie)
      LibBlend2D.context_restore(pointer, cookie.pointer)
    end

    # Get meta matrix

    # Get user matrix

    # User to meta

    # Reset the context's matrix.
    def reset_matrix
      LibBlend2D.context_matrix_op(pointer, MatrixOperation::Reset, nil)
    end

    # Apply a matrix operation (one of `MatrixOperation`), and pass an array of `Float64`s to specify parameters.
    def matrix_operation(operation : MatrixOperation, data : Array(Float64))
      LibBlend2D.context_matrix_op(pointer, operation, data)
    end

    # Translate the context's matrix by (x, y).
    def translate(x : Float64, y : Float64)
      matrix_operation(MatrixOperation::Translate, [x, y])
    end

    # Translate the context's matrix by the point's coordinates.
    def translate(point : PointI)
      translate(point.x, point.y)
    end

    # Translate the context's matrix by the point's coordinates.
    def translate(point : Point)
      translate(point.x, point.y)
    end

    # Scale the context's matrix by (x, y).
    def scale(x : Float64, y : Float64)
      matrix_operation(MatrixOperation::Scale, [x, y])
    end

    # Scale the context's matrix by a factor equivalent for both x and y.
    def scale(factor : Float64)
      scale(factor, factor)
    end

    # Skew the context's matrix by (x, y).
    def skew(x : Float64, y : Float64)
      matrix_operation(MatrixOperation::Skew, [x, y])
    end

    # Rotate the context.
    def rotate(angle : Float64)
      matrix_operation(MatrixOperation::Rotate, [angle])
    end

    # Rotate the context about a point defined by two doubles.
    def rotate(angle : Float64, cx : Float64, cy : Float64)
      matrix_operation(MatrixOperation::RotatePoint, [angle, cx, cy])
    end

    # Rotate the context about a point.
    def rotate(angle : Float64, point : PointI)
      rotate(angle, point.x, point.y)
    end

    # Rotate the context about a point.
    def rotate(angle : Float64, point : Point)
      rotate(angle, point.x, point.y)
    end

    # Transform the context using another matrix.
    def transform(matrix : Matrix)
      matrix_operation(MatrixOperation::Transform, [matrix.pointer])
    end

    # Set hint

    # Set hints

    # Set flatten mode

    # Set flatten tolerance

    # Set the composition operator of this context using `CompositionOperator`.
    def composition_operator=(operator : CompositionOperator)
      LibBlend2D.context_set_comp_op(pointer, operator)
    end

    # Set the global alpha of this context.
    def global_alpha=(alpha)
      LibBlend2D.context_set_global_alpha(pointer, alpha)
    end

    # Set the fill alpha of this context.
    def fill_alpha=(alpha)
      LibBlend2D.context_set_fill_alpha(pointer, alpha)
    end

    # Set the fill color of this context using a color of `RGBA32`.
    def fill_style=(color : RGBA32)
      LibBlend2D.context_set_fill_style_rgba32(pointer, color.raw)
    end

    # Set the fill color of this context using a color of `RGBA64`.
    def fill_style=(color : RGBA64)
      LibBlend2D.context_set_fill_style_rgba64(pointer, color.raw)
    end

    # Set the fill style of this context to a `Gradient`.
    def fill_style=(gradient : Gradient)
      LibBlend2D.context_set_fill_style_object(pointer, gradient.pointer)
    end

    # Set the fill style of this context to a `Pattern`.
    def fill_style=(pattern : Pattern)
      LibBlend2D.context_set_fill_style_object(pointer, pattern.pointer)
    end

    # set fill rule

    # Set the stroke alpha of this context.
    def stroke_alpha=(alpha)
      LibBlend2D.context_set_stroke_alpha(pointer, alpha)
    end

    # Set the stroke color of this context.
    def stroke_style=(color : RGBA32)
      LibBlend2D.context_set_stroke_style_rgba32(pointer, color.raw)
    end

    # Set the stroke color of this context.
    def stroke_style=(color : RGBA64)
      LibBlend2D.context_set_stroke_style_rgba64(pointer, color.raw)
    end

    # Set the stroke style of this context to a `Gradient`.
    def stroke_style=(gradient : Gradient)
      LibBlend2D.context_set_stroke_style_object(pointer, gradient.pointer)
    end

    # Set the stroke style of this context to a `Pattern`.
    def stroke_style=(pattern : Pattern)
      LibBlend2D.context_set_stroke_style_object(pointer, pattern.pointer)
    end

    # Set this context's stroke width.
    def stroke_width=(width)
      LibBlend2D.context_set_stroke_width(pointer, width)
    end

    # Set this context's miter limit.
    def stroke_miter_limit=(miter_limit)
      LibBlend2D.context_set_stroke_miter_limit(pointer, miter_limit)
    end

    # Set one of the context's stroke caps, given a `StrokeCapPosition` and a `StrokeCap`.
    def set_stroke_cap(position : StrokeCapPosition, cap : StrokeCap)
      LibBlend2D.context_set_stroke_cap(pointer, position, cap)
    end

    # Set both of the context's stroke caps given a `StrokeCap`.
    def stroke_caps=(cap : StrokeCap)
      LibBlend2D.context_set_stroke_caps(pointer, cap)
    end

    # Equivalent to `#set_stroke_cap`, passing `StrokeCapPosition::Start` as the first argument.
    def stroke_start_cap=(cap : StrokeCap)
      set_stroke_cap(StrokeCapPosition::Start, cap)
    end

    # Equivalent to `#set_stroke_cap`, passing `StrokeCapPosition::End` as the first argument.
    def stroke_end_cap=(cap : StrokeCap)
      set_stroke_cap(StrokeCapPosition::End, cap)
    end

    # Set the stroke join method.
    def stroke_join=(join : StrokeJoin)
      LibBlend2D.context_set_stroke_join(pointer, join)
    end

    # Set the stroke dash offset.
    def stroke_dash_offset=(dash_offset)
      LibBlend2D.context_set_stroke_dash_offset(pointer, dash_offset)
    end

    # set stroke dash array

    # set stroke transform order

    # Fetch the context's stroke options.
    def stroke_options
      LibBlend2D.context_get_stroke_options(options.pointer, out options)
      StrokeOptions.new options
    end

    # Set the context's stroke options. It must first be fetched using `#stroke_options`.
    def stroke_options=(options : StrokeOptions)
      LibBlend2D.context_set_stroke_options(options.pointer)
    end

    # Clip the context to a `RectI`.
    def clip_to_rect(rect : RectI)
      LibBlend2D.context_clip_to_rect_i(pointer, rect.pointer)
    end

    # Clip the context to a `Rect`.
    def clip_to_rect(rect : Rect)
      LibBlend2D.context_clip_to_rect_d(pointer, rect.pointer)
    end

    # Restore the clipping on the context.
    def restore_clipping
      LibBlend2D.context_restore_clipping(pointer)
    end

    # Clear the context.
    def clear_all
      LibBlend2D.context_clear_all(pointer)
    end

    # Clear an area of the context defined by a `RectI`.
    def clear_rect(rect : RectI)
      LibBlend2D.context_clear_rect_i(pointer, rect.pointer)
    end

    # Clear an area of the context defined by a `Rect`.
    def clear_rect(rect : Rect)
      LibBlend2D.context_clear_rect_d(pointer, rect.pointer)
    end

    # Fill the entire context.
    def fill_all
      LibBlend2D.context_fill_all(pointer)
    end

    # Fill a `RectI`.
    def fill_rect(rect : RectI)
      LibBlend2D.context_fill_rect_i(pointer, rect.pointer)
    end

    # Fill a `Rect`.
    def fill_rect(rect : Rect)
      LibBlend2D.context_fill_rect_d(pointer, rect.pointer)
    end

    # Fill a `Path`.
    def fill_path(path : Path)
      LibBlend2D.context_fill_path_d(pointer, path.pointer)
    end

    # Fill some geometry given a `GeometryType`, an abstract class that can not be initialized. Instead,
    # pass a deriving class, like `RoundRect` or `Ellipse`.
    def fill_geometry(geometry : GeometryType)
      LibBlend2D.context_fill_geometry(pointer, geometry.type, geometry.pointer)
    end

    # There is intentionally a lack of methods like fill_round_rect, fill_ellipse, fill_triangle

    # Fill some text given a `PointI`, `Font`, and `String`.
    def fill_text(point : PointI, font : Font, text : String, encoding : TextEncoding = TextEncoding::UTF8)
      LibBlend2D.context_fill_text_i(pointer, point.pointer, font.pointer, text, text.size, encoding)
    end

    # Fill some text given a `Point`, `Font`, and `String`.
    def fill_text(point : Point, font : Font, text : String, encoding : TextEncoding = TextEncoding::UTF8)
      LibBlend2D.context_fill_text_d(pointer, point.pointer, font.pointer, text, text.size, encoding)
    end

    # Fill some text given a `PointI`, `Font`, and `GlyphRun`.
    def fill_glyph_run(point : PointI, font : Font, run : GlyphRun)
      LibBlend2D.context_fill_glyph_run_i(pointer, point.pointer, font.pointer, run.pointer)
    end

    # Fill some text given a `Point`, `Font`, and `GlyphRun`.
    def fill_glyph_run(point : Point, font : Font, run : GlyphRun)
      LibBlend2D.context_fill_glyph_run_d(pointer, point.pointer, font.pointer, run.pointer)
    end

    # Stroke a `RectI`.
    def stroke_rect(rect : RectI)
      LibBlend2D.context_stroke_rect_i(pointer, rect.pointer)
    end

    # Stroke a `Rect`.
    def stroke_rect(rect : Rect)
      LibBlend2D.context_stroke_rect_d(pointer, rect.pointer)
    end

    # Stroke a `Path`.
    def stroke_path(path : Path)
      LibBlend2D.context_stroke_path_d(pointer, path.pointer)
    end

    # Stroke some geometry given a `GeometryType`, an abstract class that can not be initialized. Instead,
    # pass a deriving class, like `RoundRect` or `Ellipse`.
    def stroke_geometry(geometry : GeometryType)
      LibBlend2D.context_stroke_geometry(pointer, geometry.type, geometry.pointer)
    end

    # Stroke some text given a `PointI`, `Font`, and `String`.
    def stroke_text(point : PointI, font : Font, text : String, encoding : TextEncoding = TextEncoding::UTF8)
      LibBlend2D.context_stroke_text_i(pointer, point.pointer, font.pointer, text, text.size, encoding)
    end

    # Stroke some text given a `Point`, `Font`, and `String`.
    def stroke_text(point : Point, font : Font, text : String, encoding : TextEncoding = TextEncoding::UTF8)
      LibBlend2D.context_stroke_text_d(pointer, point.pointer, font.pointer, text, text.size, encoding)
    end

    # Stroke some text given a `PointI`, `Font`, and `GlyphRun`.
    def stroke_glyph_run(point : PointI, font : Font, run : GlyphRun)
      LibBlend2D.context_stroke_glyph_run_i(pointer, point.pointer, font.pointer, run.pointer)
    end

    # Stroke some text given a `Point`, `Font`, and `GlyphRun`.
    def stroke_glyph_run(point : Point, font : Font, run : GlyphRun)
      LibBlend2D.context_stroke_glyph_run_d(pointer, point.pointer, font.pointer, run.pointer)
    end

    # Blit an image onto the canvas.
    def blit(image : Image, point : PointI, area : RectI? = nil)
      area ||= image.area
      LibBlend2D.context_blit_image_i(pointer, point.pointer, image.pointer, area.pointer)
    end

    # Blit an image onto the canvas.
    def blit(image : Image, point : Point, area : RectI? = nil)
      area ||= image.area
      LibBlend2D.context_blit_image_d(pointer, point.pointer, image.pointer, area.pointer)
    end

    # Blit an image onto the canvas.
    def blit(image : Image, rect : RectI, area : RectI? = nil)
      area ||= image.area
      LibBlend2D.context_blit_scaled_image_i(pointer, rect.pointer, image.pointer, area.pointer)
    end

    # Blit an image onto the canvas.
    def blit(image : Image, rect : Rect, area : RectI? = nil)
      area ||= image.area
      LibBlend2D.context_blit_scaled_image_d(pointer, rect.pointer, image.pointer, area.pointer)
    end
  end
end
