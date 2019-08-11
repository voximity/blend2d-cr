include Blend2D::C

module Blend2D::Text
    class FontFace < BLStructure
        @core = uninitialized LibBlend2D::BLFontFaceCore

        def initialize(file_name : String)
            LibBlend2D.font_face_init(pointer)
            LibBlend2D.font_face_create_from_file(pointer, file_name, 0)
        end

        protected def pointer
            pointerof(@core)
        end

        def finalize
            LibBlend2D.font_face_reset(pointer)
        end

        # i also don't understand the purpose of most of these methods. see `font.cr` for more info
        # on the absence of high-level implementation of these
    end
end