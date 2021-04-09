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

    def write(image : Image)
      LibBlend2D.image_encoder_write_frame(pointer, out array_core, image.pointer)
      array = [] of UInt8
      BLArray.new(array_core).fill_array(array)
      array
    end

    def write_slice(image : Image)
      LibBlend2D.image_encoder_write_frame(pointer, out array_core, image.pointer)
      arr = BLArray.new(array_core)
      arr.to_slice(UInt8)
    end

    def write_io(image : Image)
      IO::Memory.new(write_slice(image))
    end
  end
end
