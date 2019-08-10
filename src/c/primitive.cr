module Blend2D::C
    @[Link("blend2d")]
    lib LibBlend2D
        enum BLGeometryType : UInt32
            BL_GEOMETRY_TYPE_NONE
            BL_GEOMETRY_TYPE_BOXI
            BL_GEOMETRY_TYPE_BOXD
            BL_GEOMETRY_TYPE_RECTI
            BL_GEOMETRY_TYPE_RECTD
            BL_GEOMETRY_TYPE_CIRCLE
            BL_GEOMETRY_TYPE_ELLIPSE
            BL_GEOMETRY_TYPE_ROUND_RECT
            BL_GEOMETRY_TYPE_ARC
            BL_GEOMETRY_TYPE_CHORD
            BL_GEOMETRY_TYPE_PIE
            BL_GEOMETRY_TYPE_TRIANGLE
            BL_GEOMETRY_TYPE_POLYLINEI
            BL_GEOMETRY_TYPE_POLYLINED
            BL_GEOMETRY_TYPE_POLYGONI
            BL_GEOMETRY_TYPE_POLYGOND
            BL_GEOMETRY_TYPE_ARRAY_VIEW_BOXI
            BL_GEOMETRY_TYPE_ARRAY_VIEW_BOXD
            BL_GEOMETRY_TYPE_ARRAY_VIEW_RECTI
            BL_GEOMETRY_TYPE_ARRAY_VIEW_RECTD
            BL_GEOMETRY_TYPE_PATH
            BL_GEOMETRY_TYPE_REGION
            BL_GEOMETRY_TYPE_COUNT
        end

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

        struct BLLine
            x0 : Float64
            y0 : Float64
            x1 : Float64
            y1 : Float64
        end

        struct BLTriangle
            x0 : Float64
            y0 : Float64
            x1 : Float64
            y1 : Float64
            x2 : Float64
            y2 : Float64
        end

        struct BLRoundRect
            x : Float64
            y : Float64
            w : Float64
            h : Float64
            rx : Float64
            ry : Float64
        end

        struct BLCircle
            cx : Float64
            cy : Float64
            r : Float64
        end

        struct BLEllipse
            cx : Float64
            cy : Float64
            rx : Float64
            ry : Float64
        end

        struct BLArc
            cx : Float64
            cy : Float64
            rx : Float64
            ry : Float64
            start : Float64
            sweep : Float64
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