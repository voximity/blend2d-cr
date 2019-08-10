module Blend2D::C
    @[Link("blend2d")]
    lib LibBlend2D
        struct BLMatrix2D
            m : Float64[6]
            m00 : Float64
            m01 : Float64
            m10 : Float64
            m11 : Float64
            m20 : Float64
            m21 : Float64
        end
    end
end