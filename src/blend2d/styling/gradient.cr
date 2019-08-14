include Blend2D::C

module Blend2D::Styling
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
    def Gradient.radial(x0, y0, x1, y1, r, extend_mode = ExtendMode::Pad)
      gradient = Gradient.allocate
      gradient.init GradientType::Radial, LibBlend2D::BLRadialGradientValues.new(x0: x0, y0: y0, x1: x1, y1: y1, r0: r), extend_mode
      gradient
    end

    # Creates a new radial gradient with the specified parameters.
    def Gradient.radial(a : Point, b : Point, r, extend_mode = ExtendMode::Pad)
      Gradient.radial(a.x, a.y, b.x, b.y, r, extend_mode)
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

    # Fetch this gradient's extend mode.
    def extend_mode
      LibBlend2D.gradient_get_extend_mode(pointer).as ExtendMode
    end

    # Set this gradient's extend mode.
    def extend_mode=(extend_mode : ExtendMode)
      LibBlend2D.gradient_set_extend_mode(pointer, extend_mode)
    end

    # Returns an `Array(GradientStop)` representing the stops of this gradient.
    def stops
      ptr = LibBlend2D.gradient_get_stops(pointer)
      size = LibBlend2D.gradient_get_size(pointer)
      CArray.get(ptr, size).map { |s| GradientStop.new s }
    end

    # Resets the stops of this gradient.
    def reset_stops
      LibBlend2D.gradient_reset_stops(pointer)
    end

    # Sets the stops of this gradient from an `Array(GradientStop)`.
    def set_stops(stops : Array(GradientStop))
      LibBlend2D.gradient_assign_stops(pointer, pointerof(stops), stops.size)
    end

    # Adds a stop to the gradient given a `GradientStop`.
    def add_stop(stop : GradientStop)
      LibBlend2D.gradient_add_stop_rgba64(pointer, stop.offset, stop.rgba64.raw)
    end

    # Adds a stop to the gradient given a `GradientStop`.
    def <<(stop : GradientStop)
      add_stop stop
    end

    # Adds a stop to the gradient.
    def add_stop(offset : Float64, color : RGBA32)
      LibBlend2D.gradient_add_stop_rgba32(pointer, offset, color.raw)
    end

    # Adds a stop to the gradient.
    def add_stop(offset : Float64, color : RGBA64)
      LibBlend2D.gradient_add_stop_rgba64(pointer, offset, color.raw)
    end

    # Removes a stop from the gradient based on its index.
    def remove_stop(index : Int32)
      LibBlend2D.gradient_remove_stop(pointer, index)
    end

    # remove stop by offset (what's the enum?)

    # Remove a range of stops.
    def remove_stops(start_index : Int32, end_index : Int32)
      LibBlend2D.gradient_remove_stops(pointer, start, end_index)
    end

    # Remove a range of stops.
    def remove_stops_between(min : Float64, max : Float64)
      LibBlend2D.gradient_remove_stops_from_to(pointer, min, max)
    end

    # Replace a stop with another.
    def replace_stop(index : Int32, stop : GradientStop)
      LibBlend2D.gradient_replace_stop_rgba64(pointer, stop.offset, stop.rgba64.raw)
    end

    # Replace a stop with another.
    def replace_stop(index : Int32, offset : Float64, color : RGBA32)
      LibBlend2D.gradient_replace_stop_rgba32(pointer, index, offset, color.raw)
    end

    # Replace a stop with another.
    def replace_stop(index : Int32, offset : Float64, color : RGBA64)
      LibBlend2D.gradient_replace_stop_rgba64(pointer, index, offset, color.raw)
    end

    # Get the index of a stop by its offset.
    def index_of(offset : Float64) : Int32
      LibBlend2D.gradient_index_of_stop(pointer, offset)
    end

    # Apply a matrix operation to the gradient. See `Context#matrix_operation` for more information.
    def matrix_operation(operation : MatrixOperation, data : Array(Float64))
      LibBlend2D.gradient_apply_matrix_op(pointer, operation, data)
    end

    # Checks whether or not this gradient is equal to another based on its low-level C counterpart.
    def ==(other : Gradient)
      LibBlend2D.gradient_equals(pointer, other.pointer)
    end
  end
end
