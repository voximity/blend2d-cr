include Blend2D::C

module Blend2D::Geometry
    struct RoundRect < GeometryType
        getter x : Float64
        getter y : Float64
        getter w : Float64
        getter h : Float64
        getter rx : Float64
        getter ry : Float64

        @core = uninitialized LibBlend2D::BLRoundRect
        def initialize(@x : Float64, @y : Float64, @w : Float64, @h : Float64, @rx : Float64, @ry : Float64)
            @core = LibBlend2D::BLRoundRect.new x: @x, y: @y, w: @w, h: @h, rx: @rx, ry: @ry
        end

        def initialize(x : Float64, y : Float64, w : Float64, h : Float64, r : Float64)
            initialize(x, y, w, h, r, r)
        end

        protected def type
            LibBlend2D::BLGeometryType::BL_GEOMETRY_TYPE_ROUND_RECT
        end

        protected def pointer
            pointerof(@core)
        end
    end
end