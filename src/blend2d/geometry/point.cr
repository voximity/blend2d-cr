include Blend2D::C

module Blend2D::Geometry
  struct PointI
    getter x : Int32
    getter y : Int32

    @core = uninitialized LibBlend2D::BLPointI

    def initialize(@x : Int32, @y : Int32)
      @core = LibBlend2D::BLPointI.new x: @x, y: @y
    end

    protected def pointer
      pointerof(@core)
    end
  end

  struct Point
    getter x : Float64
    getter y : Float64

    @core = uninitialized LibBlend2D::BLPoint

    def initialize(@x : Float64, @y : Float64)
      @core = LibBlend2D::BLPoint.new x: @x, y: @y
    end

    protected def pointer
      pointerof(@core)
    end
  end
end
