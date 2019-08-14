module Blend2D::C
  @[Link("blend2d")]
  lib LibBlend2D
    enum BLFormat : UInt32
      BL_FORMAT_NONE
      BL_FORMAT_PRGB32
      BL_FORMAT_XRGB32
      BL_FORMAT_A8
      BL_FORMAT_COUNT
      BL_FORMAT_RESERVED_COUNT
    end

    fun image_init = blImageInit(self : BLImageCore*) : BLResult
    fun image_init_as = blImageInitAs(self : BLImageCore*, w : Int32, h : Int32, format : BLFormat) : BLResult
    # fun image_init_as_from_data = blImageInitAsFromData(self : BLImageCore*, w : Int, h : Int, format : UInt32, pixelData : Void*, stride : Void*, destroyFunc : BLDestroyImplFunc, destroyData : Void*) : BLResult
    fun image_reset = blImageReset(self : BLImageCore*) : BLResult
    fun image_assign_move = blImageAssignMove(self : BLImageCore*, other : BLImageCore*) : BLResult
    fun image_assign_weak = blImageAssignWeak(self : BLImageCore*, other : BLImageCore*) : BLResult
    fun image_assign_deep = blImageAssignDeep(self : BLImageCore*, other : BLImageCore*) : BLResult
    fun image_create = blImageCreate(self : BLImageCore*, w : Int32, h : Int32, format : UInt32) : BLResult
    # fun image_create_from_data = blImageCreateFromData(self : BLImageCore*, w : Int, h : Int, format : UInt32, pixelData : Void*, stride : Void*, destroyFunc : BLDestroyImplFunc, destroyData : Void*) : BLResult
    fun image_get_data = blImageGetData(self : BLImageCore*, dataOut : BLImageData*) : BLResult
    fun image_make_mutable = blImageMakeMutable(self : BLImageCore*, dataOut : BLImageData*) : BLResult
    fun image_equals = blImageEquals(a : BLImageCore*, b : BLImageCore*) : Bool
    # fun image_scale = blImageScale(dst : BLImageCore*, src : BLImageCore*, size : BLSizeI*, filter : UInt32, options : BLImageScaleOptions*) : BLResult
    fun image_read_from_file = blImageReadFromFile(self : BLImageCore*, fileName : LibC::Char*, codecs : BLArrayCore*) : BLResult
    # fun image_read_from_data = blImageReadFromData(self : BLImageCore*, data, size, codecs)
    fun image_write_to_file = blImageWriteToFile(self : BLImageCore*, fileName : LibC::Char*, codec : BLImageCodecCore*) : BLResult

    # fun image_write_to_data = blImageWriteToData

    struct BLImageData
      pixelData : Void*
      stride : Int32*
      size : BLSizeI
      format : UInt32
      flags : UInt32
    end

    struct BLImageImpl
      pixelData : Void*
      stride : Int32*
      writer : Void*
      refCount : LibC::SizeT
      implType : UInt8
      implTraits : UInt8
      memPoolData : UInt16
      format : UInt8
      flags : UInt8
      depth : UInt16
      size : BLSizeI
    end

    struct BLImageCore
      impl : BLImageImpl*
    end
  end
end
