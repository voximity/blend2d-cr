include Blend2D::C

module Blend2D::Text
  class Font < BLStructure
    @core = uninitialized LibBlend2D::BLFontCore

    def initialize(face : FontFace, size : Float32)
      LibBlend2D.font_init(pointer)
      LibBlend2D.font_create_from_face(pointer, face.pointer, size)
    end

    protected def pointer : Pointer(LibBlend2D::BLFontCore)
      pointerof(@core)
    end

    def finalize
      LibBlend2D.font_destroy(pointer)
    end

    def shape(buffer : GlyphBuffer)
      LibBlend2D.font_shape(pointer, buffer.pointer)
    end

    def metrics
      FontMetrics.new self
    end

    def text_metrics(buffer : GlyphBuffer)
      TextMetrics.new self, buffer
    end

    # there's so many crazy methods i don't even understand under BLFontCore... i'll add them
    # after the next big changes to the text API maybe? or maybe when i find a solid use for them
  end
end
