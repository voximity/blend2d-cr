module Blend2D::Imaging
  class Codec < BLStructure
    @core = uninitialized LibBlend2D::BLImageCodecCore

    # Initialize a blank image codec.
    def initialize
      LibBlend2D.image_codec_init(pointer)
    end

    # Initialize a blank codec and assign one of the built-in codecs to it.
    def initialize(name : String)
      initialize
      find_by_name name
    end

    protected def pointer : Pointer(LibBlend2D::BLImageCodecCore)
      pointerof(@core)
    end

    def finalize
      LibBlend2D.image_codec_destroy(pointer)
    end

    # Assign a built-in codec to this codec.
    def find_by_name(name)
      LibBlend2D.image_codec_find_by_name(pointer, name, LibC::SizeT::MAX, nil)
    end

    # are any of the methods below worth implementing high-level? or just keep for C namespace?

    # find by data

    # inspect data

    # create decoder

    # create encoder

    # array init built in codecs

    # array assign built in codecs

    # add to built in

    # remove from built in
  end
end
