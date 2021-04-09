include Blend2D::C

module Blend2D::Geometry
  struct Arc < GeometryType
    getter cx : Float64
    getter cy : Float64
    getter rx : Float64
    getter ry : Float64
    getter start : Float64
    getter sweep : Float64
    getter arc_type : ArcType

    @core = uninitialized LibBlend2D::BLArc

    def initialize(@cx : Float64, @cy : Float64, @rx : Float64, @ry : Float64, @start : Float64, @sweep : Float64, @arc_type : ArcType)
      @core = LibBlend2D::BLArc.new cx: @cx, cy: @cy, rx: @rx, ry: @ry, start: @start, sweep: @sweep
    end

    def initialize(center : Point, rx : Float64, ry : Float64, start : Float64, sweep : Float64, arc_type : ArcType)
      initialize(center.x, center.y, rx, ry, start, sweep, arc_type)
    end

    def center
      Point.new x: cx, y: cy
    end

    protected def pointer : Pointer(LibBlend2D::BLArc)
      pointerof(@core)
    end

    protected def type : LibBlend2D::BLGeometryType
      case arc_type
      when ArcType::Chord
        LibBlend2D::BLGeometryType::BL_GEOMETRY_TYPE_CHORD
      when ArcType::Pie
        LibBlend2D::BLGeometryType::BL_GEOMETRY_TYPE_PIE
      else
        LibBlend2D::BLGeometryType::BL_GEOMETRY_TYPE_ARC
      end
    end
  end
end
