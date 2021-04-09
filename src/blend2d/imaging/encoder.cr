include Blend2D::C

module Blend2D::Imaging
  class ImageEncoder < BLStructure
    @core = uninitialized LibBlend2D::BLImageEncoderCore

    def initialize(codec : Codec)
      LibBlend2D.image_encoder_init(pointer)
      LibBlend2D.image_codec_create_encoder(codec.pointer, pointer)
    end

    protected def pointer : Pointer(LibBlend2D::BLImageEncoderCore)
      pointerof(@core)
    end

    def finalize
      LibBlend2D.image_encoder_destroy(pointer)
    end

    def write_slice(image : Image)
      LibBlend2D.array_init(out array_core, LibBlend2D::BLImplType::BL_IMPL_TYPE_ARRAY_U8)
      LibBlend2D.image_encoder_write_frame(pointer, pointerof(array_core), image.pointer)
      puts LibBlend2D.array_get_capacity(pointerof(array_core))
      puts LibBlend2D.array_get_size(pointerof(array_core))
      Slice.new(Pointer(UInt8).new(LibBlend2D.array_get_data(pointerof(array_core)).address), LibBlend2D.array_get_size(pointerof(array_core)))
    end

    def write_io(image : Image)
      io = IO::Memory.new(write_slice(image))
      io.seek(0)
      io
    end
  end
end
