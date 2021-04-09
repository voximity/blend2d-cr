include Blend2D::C

module Blend2D::Imaging
  class ImageEncoder < BLStructure
    @core = uninitialized LibBlend2D::BLImageEncoderCore

    def initialize(codec : Codec)
      LibBlend2D.image_codec_create_encoder(codec.pointer, pointer)
    end

    protected def pointer : Pointer(LibBlend2D::BLImageEncoderCore)
      pointerof(@core)
    end

    def finalize
      LibBlend2D.image_encoder_destroy(pointer)
    end

    # write frame
  end
end
