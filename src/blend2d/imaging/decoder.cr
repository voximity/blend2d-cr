include Blend2D::C

module Blend2D::Imaging
  class ImageDecoder < BLStructure
    @core = uninitialized LibBlend2D::BLImageDecoderCore

    def initialize(codec : Codec)
      LibBlend2D.image_decoder_init(pointer)
      LibBlend2D.image_codec_create_decoder(codec.pointer, pointer)
    end

    protected def pointer : Pointer(LibBlend2D::BLImageDecoderCore)
      pointerof(@core)
    end

    def finalize
      LibBlend2D.image_decoder_destroy(pointer)
    end

    # read info

    # Read a frame from some image data.
    def read(data : Array(UInt8))
      LibBlend2D.image_decoder_read_frame(pointer, out image, pointerof(data), data.size)
    end
  end
end
