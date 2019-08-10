include Blend2D::C

module Blend2D::Geometry
    struct Line < GeometryType
        getter x0 : Float64
        getter y0 : Float64
        getter x1 : Float64
        getter y1 : Float64

        @core = uninitialized LibBlend2D::BLLine
        def initialize(@x0 : Float64, @y0 : Float64, @x1 : Float64, @y1 : Float64)
            @core = LibBlend2D::BLLine.new x0: @x0, y0: @y0, x1: @x1, y1: @y1
        end

        protected def type
            LibBlend2D::BLGeometryType::BL_GEOMETRY_TYPE_LINE
        end

        protected def pointer
            pointerof(@core)
        end
    end
end