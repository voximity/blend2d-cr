include Blend2D::C

module Blend2D::Rendering
    enum CompositionOperator : UInt32
        SourceOver
        SourceCopy
        SourceIn
        SourceOut
        SourceAtop
        DestinationOver
        DestinationCopy
        DestinationIn
        DestinationOut
        DestinationAtop
        ExclusiveOr
        Clear
        Plus
        Minus
        Multiply
        Screen
        Overlay
        Darken
        Lighten
        ColorDodge
        ColorBurn
        LinearBurn
        LinearLight
        PinLight
        HardLight
        SoftLight
        Difference
        Exclusion
        Count
    end
    
    enum StrokeJoin
        MiterClip
        MiterBevel
        MiterRound
        Bevel
        Round
    end

    enum StrokeCapPosition
        Start
        End
    end

    enum StrokeCap
        Butt
        Square
        Round
        ReversedRound
        Triangle
        ReversedTriangle
    end

    class Context < BLStructure
        # Initialize the context using the given Image.
        def initialize(image : Image)
            @image = image
            @core = uninitialized LibBlend2D::BLContextCore
            LibBlend2D.context_init_as(pointer, @image.pointer, nil)
        end

        protected def pointer
            pointerof(@core)
        end

        def finalize
            LibBlend2D.context_reset(pointer)
        end

        # Ends this context.
        def end
            LibBlend2D.context_end(pointer)
        end

        # Flush context

        # Save context

        # Restore context

        # Get meta matrix

        # Get user matrix

        # User to meta

        # Matrix operation

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

        def fill_style=(gradient : Gradient)
            LibBlend2D.context_set_fill_style(pointer, gradient.pointer)
        end

        # set fill rule

        def stroke_alpha=(alpha)
            LibBlend2D.context_set_stroke_alpha(pointer, alpha)
        end

        def stroke_style=(color : RGBA32)
            LibBlend2D.context_set_stroke_style_rgba32(pointer, color.raw)
        end

        def stroke_style=(color : RGBA64)
            LibBlend2D.context_set_stroke_style_rgba64(pointer, color.raw)
        end

        def stroke_width=(width)
            LibBlend2D.context_set_stroke_width(pointer, width)
        end

        def stroke_miter_limit=(miter_limit)
            LibBlend2D.context_set_stroke_miter_limit(pointer, miter_limit)
        end

        def set_stroke_cap(position : StrokeCapPosition, cap : StrokeCap)
            LibBlend2D.context_set_stroke_cap(pointer, position, cap)
        end

        def stroke_caps=(cap : StrokeCap)
            LibBlend2D.context_set_stroke_caps(pointer, cap)
        end

        def stroke_join=(join : StrokeJoin)
            LibBlend2D.context_set_stroke_join(pointer, join)
        end

        def stroke_dash_offset=(dash_offset)
            LibBlend2D.context_set_stroke_dash_offset(pointer, dash_offset)
        end

        # set stroke dash array

        # set stroke transform order

        # set stroke options

        def clip_to_rect(rect : RectI)
            LibBlend2D.context_clip_to_rect_i(pointer, rect.pointer)
        end

        def clip_to_rect(rect : Rect)
            LibBlend2D.context_clip_to_rect_d(pointer, rect.pointer)
        end

        def restore_clipping
            LibBlend2D.context_restore_clipping(pointer)
        end

        def clear_all
            LibBlend2D.context_clear_all(pointer)
        end

        def clear_rect(rect : RectI)
            LibBlend2D.context_clear_rect_i(pointer, rect.pointer)
        end

        def clear_rect(rect : Rect)
            LibBlend2D.context_clear_rect_d(pointer, rect.pointer)
        end

        def fill_all
            LibBlend2D.context_fill_all(pointer)
        end

        def fill_rect(rect : RectI)
            LibBlend2D.context_fill_rect_i(pointer, rect.pointer)
        end

        def fill_rect(rect : Rect)
            LibBlend2D.context_fill_rect_d(pointer, rect.pointer)
        end

        def fill_path(path : Path)
            LibBlend2D.context_fill_path_d(pointer, path.pointer)
        end

        def fill_geometry(geometry : GeometryType)
            LibBlend2D.context_fill_geometry(pointer, geometry.type, geometry.pointer)
        end

        # fill text I

        # fill text D

        # fill glyph run I

        # fill glyph run D

        def stroke_rect(rect : RectI)
            LibBlend2D.context_stroke_rect_i(pointer, rect.pointer)
        end

        def stroke_rect(rect : Rect)
            LibBlend2D.context_stroke_rect_d(pointer, rect.pointer)
        end

        def stroke_path(path : Path)
            LibBlend2D.context_stroke_path_d(pointer, path.pointer)
        end

        def stroke_geometry(geometry : GeometryType)
            LibBlend2D.context_stroke_geometry(pointer, geometry.type, geometry.pointer)
        end

        # stroke text I

        # stroke text D

        # stroke glyph run I

        # stroke glyph run D

        # blit image I

        # blit image D

        # blit scaled image I

        # blit scaled image D
    end
end