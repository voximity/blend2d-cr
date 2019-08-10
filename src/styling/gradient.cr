include Blend2D::C

module Blend2D::Styling
    enum GradientType : UInt32
        Linear
        Radial
        Conical
    end

    enum ExtendMode : UInt32
        Pad
        Repeat
        Reflect
        PadXY
        RepeatXY
        ReflectXY
        PadXRepeatY
        PadXReflectY
        RepeatXPadY
        RepeatXReflectY
        ReflectXPadY
        ReflectXRepeatY
        SimpleCount
        ComplexCount
    end

    class Gradient < BLStructure
        # Creates a new linear gradient with the specified coordinates.
        def Gradient.linear(x0, y0, x1, y1, extend_mode = ExtendMode::Pad)
            gradient = Gradient.allocate
            gradient.init GradientType::Linear, LibBlend2D::BLLinearGradientValues.new(x0: x0, y0: y0, x1: x1, y1: y1), extend_mode
            gradient
        end

        # Creates a new radial gradient with the specified parameters.
        def Gradient.radial(x0, y0, x1, y1, r0, extend_mode = ExtendMode::Pad)
            gradient = Gradient.allocate
            gradient.init GradientType::Radial, LibBlend2D::BLRadialGradientValues.new(x0: x0, y0: y0, x1: x1, y1: y1, r0: r0), extend_mode
            gradient
        end

        # Creates a new conical gradient with the specified parameters.
        def Gradient.conical(x0, y0, angle, extend_mode = ExtendMode::Pad)
            gradient = Gradient.allocate
            gradient.init GradientType::Conical, LibBlend2D::BLConicalGradientValues.new(x0: x0, y0: y0, angle: angle), extend_mode
            gradient
        end
        
        @core = uninitialized LibBlend2D::BLGradientCore

        protected def init(gradient_type : GradientType, value, extend_mode : ExtendMode)
            LibBlend2D.gradient_init_as(pointer, gradient_type, pointerof(value), extend_mode, nil, 0, nil)
        end

        protected def pointer
            pointerof(@core)
        end

        def finalize
            LibBlend2D.gradient_reset(pointer)
        end

        def shrink
            LibBlend2D.gradient_shrink(pointer)
        end

        # reserve ?

        # get type
        
        # set type

        # get value

        # set value

        # set values

        def extend_mode
            LibBlend2D.gradient_get_extend_mode(pointer).as ExtendMode
        end

        def extend_mode=(extend_mode : ExtendMode)
            LibBlend2D.gradient_set_extend_mode(pointer, extend_mode)
        end

        # get stops

        # get size

        # get capacity

        def reset_stops
            LibBlend2D.gradient_reset_stops(pointer)
        end

        # assign stops

        def add_stop(offset : Float64, color : RGBA32)
            LibBlend2D.gradient_add_stop_rgba32(pointer, offset, color.raw)
        end

        def add_stop(offset : Float64, color : RGBA64)
            LibBlend2D.gradient_add_stop_rgba64(pointer, offset, color.raw)
        end

        def remove_stop(index : Int32)
            LibBlend2D.gradient_remove_stop(pointer, index)
        end

        # remove stop by offset (what's the enum?)

        def remove_stops(start_index : Int32, end_index : Int32)
            LibBlend2D.gradient_remove_stops(pointer, start, end_index)
        end

        def remove_stops_between(min : Float64, max : Float64)
            LibBlend2D.gradient_remove_stops_from_to(pointer, min, max)
        end

        def replace_stop(index : Int32, offset : Float64, color : RGBA32)
            LibBlend2D.gradient_replace_stop_rgba32(pointer, index, offset, color.raw)
        end

        def replace_stop(index : Int32, offset : Float64, color : RGBA64)
            LibBlend2D.gradient_replace_stop_rgba64(pointer, index, offset, color.raw)
        end

        def index_of(offset : Float64) : Int32
            LibBlend2D.gradient_index_of_stop(pointer, offset)
        end

        # apply matrix operation

        def ==(other : Gradient)
            LibBlend2D.gradient_equals(pointer, other.pointer)
        end
    end
end