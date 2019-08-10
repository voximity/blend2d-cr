include Blend2D::C

module Blend2D
    enum CompositionOperator : UInt32
        SOURCE_OVER,
        SOURCE_COPY,
        SOURCE_IN,
        SOURCE_OUT,
        SOURCE_ATOP,
        DESTINATION_OVER,
        DESTINATION_COPY,
        DESTINATION_IN,
        DESTINATION_OUT,
        DESTINATION_ATOP,
        EXCLUSIVE_OR,
        CLEAR,
        PLUS,
        MINUS,
        MULTIPLY,
        SCREEN,
        OVERLAY,
        DARKEN,
        LIGHTEN,
        COLOR_DODGE,
        COLOR_BURN,
        LINEAR_BURN,
        LINEAR_LIGHT,
        PIN_LIGHT,
        HARD_LIGHT,
        SOFT_LIGHT,
        DIFFERENCE,
        EXCLUSION,
        COUNT
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
        def set_composition_operator(operator : CompositionOperator)
            LibBlend2D.context_set_comp_op(pointer, operator)
        end

        # Set the global alpha of this context.
        def set_global_alpha(alpha)
            LibBlend2D.context_set_global_alpha(pointer, alpha)
        end

        # Set the fill alpha of this context.
        def set_fill_alpha(alpha)
            LibBlend2D.context_set_fill_alpha(pointer, alpha)
        end

        # Set the fill color of this context using a color of `RGBA32`.
        def set_fill_style(color : RGBA32)
            LibBlend2D.context_set_fill_style_rgba32(pointer, color.raw)
        end

        # Set the fill color of this context using a color of `RGBA64`.
        def set_fill_style(color : RGBA64)
            LibBlend2D.context_set_fill_style_rgba64(pointer, color.raw)
        end

        # set fill rule

        def set_stroke_alpha(alpha)
            LibBlend2D.context_set_stroke_alpha(pointer, alpha)
        end

        def set_stroke_style(color : RGBA32)
            LibBlend2D.context_set_stroke_style_rgba32(pointer, color.raw)
        end

        def set_stroke_style(color : RGBA64)
            LibBlend2D.context_set_stroke_style_rgba64(pointer, color.raw)
        end

        def set_stroke_width(width)
            LibBlend2D.context_set_stroke_width(pointer, width)
        end

        def set_stroke_miter_limit(miter_limit)
            LibBlend2D.context_set_stroke_miter_limit(pointer, miter_limit)
        end

        # set stroke cap

        # set stroke caps

        # set stroke join

        def set_stroke_dash_offset(dash_offset)
            LibBlend2D.context_set_stroke_dash_offset(pointer, dash_offset)
        end

        # set stroke dash array

        # set stroke transform order

        # set stroke options

        # clip to rect I

        # clip to rect D

        def restore_clipping
            LibBlend2D.context_restore_clipping(pointer)
        end

        def clear_all
            LibBlend2D.context_clear_all(pointer)
        end

        # clear rect I

        # clear rect D

        def fill_all
            LibBlend2D.context_fill_all(pointer)
        end

        # fill rect I

        # fill rect D

        def fill_path(path : Path)
            LibBlend2D.context_fill_path_d(pointer, path.pointer)
        end

        # fill geometry

        # fill text I

        # fill text D

        # fill glyph run I

        # fill glyph run D

        # stroke rect I

        # stroke rect D

        def stroke_path(path : Path)
            LibBlend2D.context_stroke_path_d(pointer, path.pointer)
        end

        # stroke geometry

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