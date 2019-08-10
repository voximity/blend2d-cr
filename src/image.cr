include Blend2D::C

module Blend2D
    # An Image is a structure provided by Blend2D that contains information about
    # a programmatic image that has data that is mutable.
    class Image < BLStructure
        # Initialize the image with the provided parameters.
        def initialize(w : Int32, h : Int32, format = LibBlend2D::BLFormat::BL_FORMAT_PRGB32)
            @width = w
            @height = h
            @core = uninitialized LibBlend2D::BLImageCore
            LibBlend2D.image_init_as(pointer, @width, @height, format)
        end

        protected def pointer
            pointerof(@core)
        end

        def finalize
            LibBlend2D.image_reset(pointer)
        end

        # init as from data

        # get data
         
        # make mutable

        def ==(other : Image)
            return LibBlend2D.image_equals(pointer, other.pointer)
        end

        # scale

        # read from file

        # read from data

        def write_to_file(file_name : String, codec : Codec)
            LibBlend2D.image_write_to_file(pointer, file_name, codec.pointer)
        end

        # write to data
    end
end