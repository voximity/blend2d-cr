module Blend2D
    class Codec
        protected def ptr
            pointerof(@core)
        end

        def initialize
            @core = uninitialized LibBlend2D::BLImageCodecCore
            LibBlend2D.image_codec_init(ptr)
        end

        def find_by_name(name : String)
            LibBlend2D.image_codec_find_by_name(ptr, name, LibC::SizeT::MAX, nil)
        end
    end
end