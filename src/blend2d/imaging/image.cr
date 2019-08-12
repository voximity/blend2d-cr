include Blend2D::C

module Blend2D::Imaging
    # An Image is a structure provided by Blend2D that contains information about
    # a programmatic image that has data that is mutable.
    class Image < BLStructure
        @core = uninitialized LibBlend2D::BLImageCore

        # Initialize a blank image with the provided parameters.
        def initialize(w : Int32, h : Int32, format = LibBlend2D::BLFormat::BL_FORMAT_PRGB32)
            #@width = w
            #@height = h
            LibBlend2D.image_init_as(pointer, w, h, format)
        end

        # Initialize an image from the file.
        def initialize(file_name : String)
            LibBlend2D.image_init(pointer)
            LibBlend2D.image_read_from_file(pointer, file_name, nil)
        end

        # Initialize an image from the given file with a given codec.
        #def initialize(file_name : String, codec : Codec)
        #    initialize(file_name, [codec])
        #end

        protected def pointer
            pointerof(@core)
        end

        def finalize
            LibBlend2D.image_reset(pointer)
        end

        protected def image_data
            LibBlend2D.image_get_data(pointer, out data)
            data
        end

        def width
            image_data.size.w
        end

        def height
            image_data.size.h
        end

        def area
            RectI.new width, height
        end

        # TODO: finish these extra methods if they're high-level worthy

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