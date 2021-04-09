include Blend2D::C

module Blend2D::Styling
  class Pattern < BLStructure
    @core = uninitialized LibBlend2D::BLPatternCore

    def initialize
      LibBlend2D.pattern_init(pointer)
    end

    def initialize(image : Image, *, area : RectI? = nil, matrix : Matrix? = nil, extend_mode : ExtendMode = ExtendMode::Pad)
      area ||= RectI.new 0, 0, image.width, image.height

      LibBlend2D.pattern_init_as(pointer, image.pointer, area.pointer, extend_mode, matrix.nil? ? Pointer(LibBlend2D::BLMatrix2D).null : matrix.pointer)
    end

    # Create a pattern, mapping a source rectangle from the base image to a destination rectangle. Helper method wrapping some Matrix logic.
    def initialize(image : Image, source_rect : RectI? = nil, dest_rect : RectI? = nil, extend_mode : ExtendMode = ExtendMode::Pad)
      source_rect ||= RectI.new 0, 0, image.width, image.height
      dest_rect ||= source_rect
      matrix = Matrix.new
      matrix.set_translation(dest_rect.x, dest_rect.y)
      matrix.set_scaling(dest_rect.w / source_rect.w, dest_rect.h / source_rect.h)

      LibBlend2D.pattern_init_as(pointer, image.pointer, source_rect.pointer, extend_mode, matrix.pointer)
    end

    protected def pointer : Pointer(LibBlend2D::BLPatternCore)
      pointerof(@core)
    end

    def finalize
      LibBlend2D.pattern_destroy(pointer)
    end
  end
end
