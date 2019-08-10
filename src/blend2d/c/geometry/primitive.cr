module Blend2D::C
    @[Link("blend2d")]
    lib LibBlend2D
        struct BLSizeI
            w : Int32
            h : Int32
        end

        struct BLSize
            w : Float64
            h : Float64
        end

        struct BLBoxI
            x0 : Int32
            y0 : Int32
            x1 : Int32
            y1 : Int32
        end
        
        struct BLBox
            x0 : Float64
            y0 : Float64
            x1 : Float64
            y1 : Float64
        end

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

        struct BLApproximationOptions
            flattenMode : UInt8
            offsetMode : UInt8
            reservedFlags : UInt8[6]
            flattenTolerance : Float64
            simplifyTolerance : Float64
            offsetParameter : Float64
        end
    end
end