include Blend2D::C

module Blend2D::Geometry
    enum ArcType
        Arc
        Chord
        Pie
    end

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

        protected def pointer
            pointerof(@core)
        end

        protected def type
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