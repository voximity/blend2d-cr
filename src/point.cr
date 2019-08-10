include Blend2D::C

module Blend2D
    struct PointI
        getter x : Int32
        getter y : Int32

        def initialize(x, y)
            @x = x
            @y = y
        end

        protected def pointer
            pointerof(LibBlend2D::BLPointI.new x: @x, y: @y)
        end
    end

    struct Point
        getter x : Float64
        getter y : Float64

        def initialize(x, y)
            @x = x
            @y = y
        end

        protected def pointer
            pointerof(LibBlend2D::BLPoint.new x: @x, y: @y)
        end
    end
end