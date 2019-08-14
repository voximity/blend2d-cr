module Blend2D::C
  @[Link("blend2d")]
  lib LibBlend2D
    enum BLMatrix2DOp
      BL_MATRIX2D_OP_RESET
      BL_MATRIX2D_OP_ASSIGN
      BL_MATRIX2D_OP_TRANSLATE
      BL_MATRIX2D_OP_SCALE
      BL_MATRIX2D_OP_SKEW
      BL_MATRIX2D_OP_ROTATE
      BL_MATRIX2D_OP_ROTATE_PT
      BL_MATRIX2D_OP_TRANSFORM
      BL_MATRIX2D_OP_POST_TRANSLATE
      BL_MATRIX2D_OP_POST_SCALE
      BL_MATRIX2D_OP_POST_SKEW
      BL_MATRIX2D_OP_POST_ROTATE
      BL_MATRIX2D_OP_POST_ROTATE_PT
      BL_MATRIX2D_OP_POST_TRANSFORM
    end

    fun matrix_set_identity = blMatrix2DSetIdentity(BLMatrix2D*) : BLResult
    fun matrix_set_translation = blMatrix2DSetTranslation(BLMatrix2D*, Float64, Float64) : BLResult
    fun matrix_set_scaling = blMatrix2DSetScaling(BLMatrix2D*, Float64, Float64) : BLResult
    fun matrix_set_skewing = blMatrix2DSetSkewing(BLMatrix2D*, Float64, Float64) : BLResult
    fun matrix_set_rotation = blMatrix2DSetRotation(BLMatrix2D*, Float64, Float64, Float64) : BLResult
    fun matrix_apply_op = blMatrix2DApplyOp(BLMatrix2D*, UInt32, Void*) : BLResult
    fun matrix_invert = blMatrix2DInvert(BLMatrix2D*, BLMatrix2D*) : BLResult
    fun matrix_get_type = blMatrix2DGetType(BLMatrix2D*) : UInt32
    fun matrix_map_point_d_array = blMatrix2DMapPointDArray(BLMatrix2D*, BLPoint*, BLPoint*, LibC::SizeT) : BLResult

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
