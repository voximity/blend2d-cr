module Blend2D::C
  @[Link("blend2d")]
  lib LibBlend2D
    enum BLImplType : UInt32
      BL_IMPL_TYPE_NULL
      BL_IMPL_TYPE_ARRAY_VAR
      BL_IMPL_TYPE_ARRAY_I8
      BL_IMPL_TYPE_ARRAY_U8
      BL_IMPL_TYPE_ARRAY_I16
      BL_IMPL_TYPE_ARRAY_U16
      BL_IMPL_TYPE_ARRAY_I32
      BL_IMPL_TYPE_ARRAY_U32
      BL_IMPL_TYPE_ARRAY_I64
      BL_IMPL_TYPE_ARRAY_U64
      BL_IMPL_TYPE_ARRAY_F32
      BL_IMPL_TYPE_ARRAY_F64
      BL_IMPL_TYPE_ARRAY_STRUCT_1
      BL_IMPL_TYPE_ARRAY_STRUCT_2
      BL_IMPL_TYPE_ARRAY_STRUCT_3
      BL_IMPL_TYPE_ARRAY_STRUCT_4
      BL_IMPL_TYPE_ARRAY_STRUCT_6
      BL_IMPL_TYPE_ARRAY_STRUCT_8
      BL_IMPL_TYPE_ARRAY_STRUCT_10
      BL_IMPL_TYPE_ARRAY_STRUCT_12
      BL_IMPL_TYPE_ARRAY_STRUCT_16
      BL_IMPL_TYPE_ARRAY_STRUCT_20
      BL_IMPL_TYPE_ARRAY_STRUCT_24
      BL_IMPL_TYPE_ARRAY_STRUCT_32
      BL_IMPL_TYPE_BIT_ARRAY
      BL_IMPL_TYPE_BIT_SET
      BL_IMPL_TYPE_STRING
      BL_IMPL_TYPE_PATH
      BL_IMPL_TYPE_REGION
      BL_IMPL_TYPE_IMAGE
      BL_IMPL_TYPE_IMAGE_CODEC
      BL_IMPL_TYPE_IMAGE_DECODER
      BL_IMPL_TYPE_IMAGE_ENCODER
      BL_IMPL_TYPE_GRADIENT
      BL_IMPL_TYPE_PATTERN
      BL_IMPL_TYPE_CONTEXT
      BL_IMPL_TYPE_FONT
      BL_IMPL_TYPE_FONT_FACE
      BL_IMPL_TYPE_FONT_DATA
      BL_IMPL_TYPE_FONT_MANAGER
      BL_IPML_TYPE_FONT_FEATURE_OPTIONS
      BL_IMPL_TYPE_FONT_VARIATION_OPTIONS
    end

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
      BL_GEOMETRY_TYPE_LINE
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
