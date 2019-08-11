include Blend2D::C

module Blend2D::Text
    class GlyphBuffer < BLStructure
        @core = uninitialized LibBlend2D::BLGlyphBufferCore

        # Create a new `GlyphBuffer`.
        def initialize
            LibBlend2D.glyph_buffer_init(pointer)
        end

        protected def pointer
            pointerof(@core)
        end

        protected def core
            @core
        end

        def finalize
            LibBlend2D.glyph_buffer_reset(pointer)
        end

        # Set the `GlyphBuffer`'s text to the one specified.
        def set_text(text : String, encoding : TextEncoding = TextEncoding::UTF8)
            LibBlend2D.glyph_buffer_set_text(pointer, text, text.size, encoding)
        end

        def glyph_run
            GlyphRun.new self
        end

        # purpose of blGlyphBufferSetGlyphIds?
    end
end