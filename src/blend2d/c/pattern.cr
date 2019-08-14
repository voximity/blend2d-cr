module Blend2D::C
  @[Link("blend2d")]
  lib LibBlend2D
    fun pattern_init = blPatternInit(BLPatternCore*) : BLResult
    fun pattern_init_as = blPatternInitAs(BLPatternCore*, BLImageCore*, BLRectI*, UInt32, BLMatrix2D*) : BLResult
    fun pattern_reset = blPatternReset(BLPatternCore*) : BLResult
    fun pattern_create = blPatternCreate(BLPatternCore*, BLImageCore*, BLRectI*, UInt32, BLMatrix2D*) : BLResult
    fun pattern_set_image = blPatternSetImage(BLPatternCore*, BLImageCore*, BLRectI*) : BLResult
    fun pattern_set_area = blPatternSetArea(BLPatternCore*, BLRectI*) : BLResult
    fun pattern_set_extend_mode = blPatternSetExtendMode(BLPatternCore*, UInt32) : BLResult
    fun pattern_apply_matrix_op = blPatternApplyMatrixOp(BLPatternCore*, UInt32, Void*) : BLResult
    fun pattern_equals = blPatternEquals(BLPatternCore*, BLPatternCore*) : Bool

    struct BLPatternCore
      impl : BLPatternImpl*
    end

    struct BLPatternImpl
      image : BLImageCore
      reservedHeader : Void*[2]
      refCount : LibC::SizeT
      implType : UInt8
      implTraits : UInt8
      memPoolData : UInt16
      patternType : UInt8
      extendMode : UInt8
      matrixType : UInt8
      reserved : UInt8[1]
      matrix : BLMatrix2D
      area : BLRectI
    end
  end
end
