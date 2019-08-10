require "./geometry.cr"
require "./blresult.cr"
require "./blimage.cr"
require "./blpath.cr"
require "./blcontext.cr"

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