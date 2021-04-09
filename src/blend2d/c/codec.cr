module Blend2D::C
  @[Link("blend2d")]
  lib LibBlend2D
    fun image_codec_init = blImageCodecInit(self : BLImageCodecCore*) : BLResult
    fun image_codec_reset = blImageCodecReset(self : BLImageCodecCore*) : BLResult
    fun image_codec_destroy = blImageCodecDestroy(BLImageCodecCore*) : BLResult
    fun image_codec_assign_weak = blImageCodecAssignWeak(self : BLImageCodecCore*, other : BLImageCodecCore*) : BLResult
    fun image_codec_find_by_name = blImageCodecFindByName(self : BLImageCodecCore*, name : LibC::Char*, size : LibC::SizeT, codecs : BLArrayCore*) : BLResult
    fun image_codec_find_by_data = blImageCodecFindByData(self : BLImageCodecCore*, data : Void*, size : LibC::SizeT, codecs : BLArrayCore*) : BLResult
    fun image_codec_inspect_data = blImageCodecInspectData(self : BLImageCodecCore*, data : Void*, size : LibC::SizeT) : UInt32
    # fun image_codec_create_decoder = blImageCodecCreateDecoder(self : BLImageCodecCore*, dst : BLImageDecoderCore*) : BLResult
    # fun image_codec_create_encoder = blImageCodecCreateEncoder(self : BLImageCodecCore*, dst : BLImageEncoderCore*) : BLResult
    fun image_codec_array_init_built_in_codecs = blImageCodecArrayInitBuiltInCodecs(self : BLArrayCore*) : BLResult
    fun image_codec_array_assign_built_in_codecs = blImageCodecArrayAssignBuiltInCodecs(self : BLArrayCore*) : BLResult
    fun image_codec_add_to_built_in = blImageCodecAddToBuiltIn(codec : BLImageCodecCore*) : BLResult
    fun image_codec_remove_from_built_in = blImageCodecRemoveFromBuiltIn(codec : BLImageCodecCore*) : BLResult

    struct BLImageCodecCore
      impl : BLImageCodecImpl*
    end

    struct BLImageCodecImpl
      name : LibC::Char*
      vendor : LibC::Char*
      refCount : LibC::SizeT
      implType : UInt8
      implTraits : UInt8
      memPoolData : UInt16
      features : UInt32
      mimeType : LibC::Char*
      extensions : LibC::Char*
    end
  end
end
