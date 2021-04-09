module Blend2D::C
  @[Link("blend2d")]
  lib LibBlend2D
    fun image_encoder_init = blImageEncoderInit(BLImageEncoderCore*) : BLResult
    fun image_encoder_reset = blImageEncoderReset(BLImageEncoderCore*) : BLResult
    fun image_encoder_destroy = blImageEncoderDestroy(BLImageEncoderCore*) : BLResult
    fun image_encoder_write_frame = blImageEncoderWriteFrame(BLImageEncoderCore*, BLArrayCore*, BLImageCore*) : BLResult

    struct BLImageEncoderCore
      impl : BLImageEncoderImpl*
    end

    struct BLImageEncoderImpl
      # virt
      refCount : LibC::SizeT
      implType : UInt8
      implTraits : UInt8
      memPoolData : UInt16
      lastResult : BLResult
      codec : BLImageCodecCore
      handle : Void*
      frameIndex : UInt64
      bufferIndex : LibC::SizeT
    end
  end
end
