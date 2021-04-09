module Blend2D::C
  @[Link("blend2d")]
  lib LibBlend2D
    fun image_decoder_init = blImageDecoderInit(BLImageDecoderCore*) : BLResult
    fun image_decoder_reset = blImageDecoderReset(BLImageDecoderCore*) : BLResult
    fun image_decoder_destroy = blImageDecoderDestroy(BLImageDecoderCore*) : BLResult
    fun image_decoder_read_info = blImageDecoderReadInfo(BLImageDecoderCore*, BLImageInfo*, UInt8*, LibC::SizeT) : BLResult
    fun image_decoder_read_frame = blImageDecoderReadFrame(BLImageDecoderCore*, BLImageCore*, UInt8*, LibC::SizeT) : BLResult

    struct BLImageDecoderCore
      impl : BLImageDecoderImpl*
    end

    struct BLImageDecoderImpl
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
