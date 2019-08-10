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

    class Context
        getter image : Image

        protected def core
            @core
        end

        def initialize(image : Image)
            @image = image
            @core = uninitialized LibBlend2D::BLContextCore
            LibBlend2D.context_init_as(pointerof(@core), @image.ptr, nil)
        end

        def set_composition_operator(operator : CompositionOperator)
            LibBlend2D.context_set_comp_op(pointerof(@core), operator)
        end

        def set_fill_style(rgba32 : RGBA32)
            LibBlend2D.context_set_fill_style_rgba32(pointerof(@core), rgba32.raw)
        end

        def fill_all
            LibBlend2D.context_fill_all(pointerof(@core))
        end

        def fill_path(path : Path)
            LibBlend2D.context_fill_path_d(pointerof(@core), path.ptr)
        end

        def end
            LibBlend2D.context_end(pointerof(@core)) 
        end
    end
end