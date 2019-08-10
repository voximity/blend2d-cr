module Blend2D::C
    @[Link("blend2d")]
    lib LibBlend2D
        struct BLRectI
            x : Int32
            y : Int32
            w : Int32
            h : Int32
        end

        struct BLRect
            x : Float64
            y : Float64
            w : Float64
            h : Float64
        end

        struct BLPointI
            x : Int32
            y : Int32
        end

        struct BLPoint
            x : Float64
            y : Float64
        end
    end
end