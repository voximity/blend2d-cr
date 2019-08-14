module Blend2D::C
  @[Link("blend2d")]
  lib LibBlend2D
    enum BLModifyOp
      BL_MODIFY_OP_ASSIGN_FIT
      BL_MODIFY_OP_ASSIGN_GROW
      BL_MODIFY_OP_APPEND_FIT
      BL_MODIFY_OP_APPEND_GROW
    end

    fun string_init = blStringInit(BLStringCore*) : BLResult
    fun string_reset = blStringReset(BLStringCore*) : BLResult
    fun string_get_size = blStringGetSize(BLStringCore*) : LibC::SizeT
    fun string_get_data = blStringGetData(BLStringCore*) : LibC::Char*
    fun string_clear = blStringClear(BLStringCore*) : BLResult
    # some methods i don't want to implement now
    fun string_apply_op_data = blStringApplyOpData(BLStringCore*, BLModifyOp, LibC::Char*, LibC::SizeT)

    struct BLStringCore
      impl : BLStringImpl*
    end

    struct BLStringImpl
      data : Char*
      size : LibC::SizeT
      capacity : LibC::SizeT
      refCount : LibC::SizeT
      implType : UInt8
      implTraits : UInt8
      memPoolData : UInt16
      reserved : UInt8[4]
    end
  end
end
