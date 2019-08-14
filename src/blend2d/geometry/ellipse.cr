include Blend2D::C

module Blend2D::Geometry
  struct Ellipse < GeometryType
    getter cx : Float64
    getter cy : Float64
    getter rx : Float64
    getter ry : Float64

    @core = uninitialized LibBlend2D::BLEllipse

    def initialize(@cx : Float64, @cy : Float64, @rx : Float64, @ry : Float64)
      @core = LibBlend2D::BLEllipse.new cx: @cx, cy: @cy, rx: @rx, ry: @ry
    end

    def initialize(point : Point, rx : Float64, ry : Float64)
      initialize(point.x, point.y, rx, ry)
    end

    def center
      Point.new x: cx, y: cy
    end

    protected def type
      LibBlend2D::BLGeometryType::BL_GEOMETRY_TYPE_ELLIPSE
    end

    protected def pointer
      pointerof(@core)
    end
  end
end
