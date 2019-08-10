module Blend2D
    class Image
        getter width : Int32
        getter height : Int32

        protected def ptr
            pointerof(@core)
        end
    
        def initialize(w, h, format = BLFormat::BL_FORMAT_PRGB32)
            @width = w
            @height = h

            @core = uninitialized LibBlend2D::BLImageCore
            LibBlend2D.image_init_as(ptr, @width, @height, format)
        end

        def reset
            LibBlend2D.image_reset(ptr)
        end

        def write_to_file(name : String, codec : Codec)
            LibBlend2D.image_write_to_file(ptr, name, codec.ptr)
        end
    end
end