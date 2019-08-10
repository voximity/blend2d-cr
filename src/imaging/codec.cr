module Blend2D::Imaging
    class Codec < BLStructure
        def initialize
            @core = uninitialized LibBlend2D::BLImageCodecCore
            LibBlend2D.image_codec_init(pointer)
        end

        protected def pointer
            pointerof(@core)
        end

        def finalize
            LibBlend2D.image_codec_reset(pointer)
        end

        def find_by_name(name)
            LibBlend2D.image_codec_find_by_name(pointer, name, LibC::SizeT::MAX, nil)
        end

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