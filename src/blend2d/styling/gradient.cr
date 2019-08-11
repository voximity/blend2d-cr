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

    struct GradientStop
        getter offset : Float64
        getter rgba64 : RGBA64

        @core = uninitialized LibBlend2D::BLGradientStop

        def initialize(@offset, @rgba64)
            @core = LibBlend2D::BLGradientStop.new offset: @offset, rgba64: @rgba64.raw
        end

        def initialize(offset : Float64, rgba32 : RGBA32)
            initialize offset, rgba32.to_rgba64
        end

        protected def initialize(stop : BLGradientStop)
            @offset = stop.offset
            @rgba64 = RGBA64.new stop.rgba
        end

        protected def pointer
            pointerof(@core)
        end
    end

    class Gradient < BLStructure
        # Creates a new linear gradient with the specified coordinates.
        def Gradient.linear(x0, y0, x1, y1, extend_mode = ExtendMode::Pad)
            gradient = Gradient.allocate
            gradient.init GradientType::Linear, LibBlend2D::BLLinearGradientValues.new(x0: x0, y0: y0, x1: x1, y1: y1), extend_mode
            gradient
        end

        # Creates a new linear gradient with the specified parameters.
        def Gradient.linear(a : Point, b : Point, extend_mode = ExtendMode::Pad)
            Gradient.linear(a.x, a.y, b.x, b.y, extend_mode)
        end

        # Creates a new radial gradient with the specified parameters.
        def Gradient.radial(x0, y0, x1, y1, r0, extend_mode = ExtendMode::Pad)
            gradient = Gradient.allocate
            gradient.init GradientType::Radial, LibBlend2D::BLRadialGradientValues.new(x0: x0, y0: y0, x1: x1, y1: y1, r0: r0), extend_mode
            gradient
        end

        # Creates a new radial gradient with the specified parameters.
        def Gradient.radial(a : Point, b : Point, r0, extend_mode = ExtendMode::Pad)
            Gradient.radial(a.x, a.y, b.x, b.y, r0, extend_mode)
        end

        # Creates a new conical gradient with the specified parameters.
        def Gradient.conical(x0, y0, angle, extend_mode = ExtendMode::Pad)
            gradient = Gradient.allocate
            gradient.init GradientType::Conical, LibBlend2D::BLConicalGradientValues.new(x0: x0, y0: y0, angle: angle), extend_mode
            gradient
        end

        # Creates a new conical gradient with the specified parameters.
        def Gradient.conical(point : Point, angle, extend_mode = ExtendMode::Pad)
            Gradient.conical(point.x, point.y, angle, extend_mode)
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

        def stops
            ptr = LibBlend2D.gradient_get_stops(pointer)
            size = LibBlend2D.gradient_get_size(pointer)
            CArray.get(ptr, size).map { |s| GradientStop.new s }
        end

        def reset_stops
            LibBlend2D.gradient_reset_stops(pointer)
        end

        def set_stops(stops : Array(GradientStop))
            LibBlend2D.gradient_assign_stops(pointer, pointerof(stops), stops.size)
        end

        def add_stop(stop : GradientStop)
            LibBlend2D.gradient_add_stop_rgba64(pointer, stop.offset, stop.rgba64.raw)
        end

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

        def matrix_operation(operation : MatrixOperation, data : Array(Float64))
            LibBlend2D.gradient_apply_matrix_op(pointer, operation, data)
        end

        def ==(other : Gradient)
            LibBlend2D.gradient_equals(pointer, other.pointer)
        end
    end
end