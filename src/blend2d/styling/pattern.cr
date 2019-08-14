include Blend2D::C

module Blend2D::Styling
  class Pattern < BLStructure
    @core = uninitialized LibBlend2D::BLPatternCore

    def initialize
      LibBlend2D.pattern_init(pointer)
    end

    def initialize(image : Image, area : RectI? = nil, matrix : Matrix? = nil, extend_mode : ExtendMode = ExtendMode::Pad)
      area ||= RectI.new 0, 0, image.width, image.height

      LibBlend2D.pattern_init_as(pointer, image.pointer, area.pointer, extend_mode, matrix ? matrix.pointer : nil)
    end

    protected def pointer
      pointerof(@core)
    end

    def finalize
      LibBlend2D.pattern_reset(pointer)
    end
  end
end
