include Blend2D::C

module Blend2D::Text
  class GlyphRun
    @core = uninitialized LibBlend2D::BLGlyphRun

    def initialize(buffer : GlyphBuffer)
      run_pointer = LibBlend2D.glyph_buffer_get_glyph_run(buffer.pointer)
      @core = run_pointer.value
    end

    protected def pointer
      pointerof(@core)
    end

    # is there a need for high-level property interfacing as of right now?
  end
end
