module Blend2D::C
  @[Link("blend2d")]
  lib LibBlend2D
    fun gradient_init = blGradientInit(BLGradientCore*) : BLResult
    fun gradient_init_as = blGradientInitAs(BLGradientCore*, UInt32, Void*, UInt32, BLGradientStop*, LibC::SizeT, BLMatrix2D*) : BLResult
    fun gradient_create = blGradientCreate(BLGradientCore*, UInt32, Void*, UInt32, BLGradientStop*, LibC::SizeT, BLMatrix2D*) : BLResult
    fun gradient_destroy = blGradientDestroy(BLGradientCore*) : BLResult
    fun gradient_reset = blGradientReset(BLGradientCore*) : BLResult
    fun gradient_assign_move = blGradientAssignMove(BLGradientCore*, BLGradientCore*) : BLResult
    fun gradient_assign_weak = blGradientAssignWeak(BLGradientCore*, BLGradientCore*) : BLResult
    fun gradient_shrink = blGradientShrink(BLGradientCore*) : BLResult
    fun gradient_reserve = blGradientReserve(BLGradientCore*, LibC::SizeT) : BLResult
    fun gradient_get_type = blGradientGetType(BLGradientCore*) : UInt32
    fun gradient_set_type = blGradientSetType(BLGradientCore*, UInt32) : BLResult
    fun gradient_get_value = blGradientGetValue(BLGradientCore*, LibC::SizeT) : Float64
    fun gradient_set_value = blGradientSetValue(BLGradientCore*, LibC::SizeT, Float64) : BLResult
    fun gradient_set_values = blGradientSetValues(BLGradientCore*, LibC::SizeT, Float64*, LibC::SizeT) : BLResult
    fun gradient_get_extend_mode = blGradientGetExtendMode(BLGradientCore*) : UInt32
    fun gradient_set_extend_mode = blGradientSetExtendMode(BLGradientCore*, UInt32) : BLResult
    fun gradient_get_stops = blGradientGetStops(BLGradientCore*) : BLGradientStop*
    fun gradient_get_size = blGradientGetSize(BLGradientCore*) : LibC::SizeT
    fun gradient_get_capacity = blGradientGetCapacity(BLGradientCore*) : LibC::SizeT
    fun gradient_reset_stops = blGradientResetStops(BLGradientCore*) : BLResult
    fun gradient_assign_stops = blGradientAssignStops(BLGradientCore*, BLGradientStop*, LibC::SizeT) : BLResult
    fun gradient_add_stop_rgba32 = blGradientAddStopRgba32(BLGradientCore*, Float64, UInt32) : BLResult
    fun gradient_add_stop_rgba64 = blGradientAddStopRgba64(BLGradientCore*, Float64, UInt64) : BLResult
    fun gradient_remove_stop = blGradientRemoveStop(BLGradientCore*, LibC::SizeT) : BLResult
    fun gradient_remove_stop_by_offset = blGradientRemoveStopByOffset(BLGradientCore*, Float64, UInt32) : BLResult
    fun gradient_remove_stops = blGradientRemoveStops(BLGradientCore*, LibC::SizeT, LibC::SizeT) : BLResult
    fun gradient_remove_stops_from_to = blGradientRemoveStopsFromTo(BLGradientCore*, Float64, Float64) : BLResult
    fun gradient_replace_stop_rgba32 = blGradientRemoveStopRgba32(BLGradientCore*, LibC::SizeT, Float64, UInt32) : BLResult
    fun gradient_replace_stop_rgba64 = blGradientRemoveStopRgba64(BLGradientCore*, LibC::SizeT, Float64, UInt64) : BLResult
    fun gradient_index_of_stop = blGradientIndexOfStop(BLGradientCore*, Float64) : LibC::SizeT
    fun gradient_apply_matrix_op = blGradientApplyMatrixOp(BLGradientCore*, UInt32, Void*) : BLResult
    fun gradient_equals = blGradientEquals(BLGradientCore*, BLGradientCore*) : BLResult

    struct BLGradientStop
      offset : Float64
      # rgba : BLRgba64
    end

    struct BLGradientCore
      impl : BLGradientImpl*
    end

    struct BLLinearGradientValues
      x0 : Float64
      y0 : Float64
      x1 : Float64
      y1 : Float64
    end

    struct BLRadialGradientValues
      x0 : Float64
      y0 : Float64
      x1 : Float64
      y1 : Float64
      r0 : Float64
    end

    struct BLConicalGradientValues
      x0 : Float64
      y0 : Float64
      angle : Float64
    end

    struct BLGradientImpl
      capacity : LibC::SizeT
      refCount : LibC::SizeT
      implType : UInt8
      implTraits : UInt8
      memPoolData : UInt16
      gradientType : UInt8
      extendMode : UInt8
      matrixType : UInt8
      reserved : UInt8[1]
      stops : BLGradientStop*
      size : LibC::SizeT
      matrix : BLMatrix2D
      values : Float64[6]
      linear : BLLinearGradientValues
      radial : BLRadialGradientValues
      conical : BLConicalGradientValues
    end
  end
end
