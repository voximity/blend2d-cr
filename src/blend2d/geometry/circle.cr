include Blend2D::C

module Blend2D::Geometry
  struct Circle < GeometryType
    getter cx : Float64
    getter cy : Float64
    getter r : Float64

    @core = uninitialized LibBlend2D::BLCircle

    def initialize(@cx : Float64, @cy : Float64, @r : Float64)
      @core = LibBlend2D::BLCircle.new cx: @cx, cy: @cy, r: @r
    end

    def initialize(center : Point, r : Float64)
      initialize(center.x, center.y, r)
    end

    def center
      Point.new x: cx, y: cy
    end

    protected def type : LibBlend2D::BLGeometryType
      LibBlend2D::BLGeometryType::BL_GEOMETRY_TYPE_CIRCLE
    end

    protected def pointer : Pointer(LibBlend2D::BLCircle)
      pointerof(@core)
    end
  end
end
