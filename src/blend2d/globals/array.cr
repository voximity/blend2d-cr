include Blend2D::C

module Blend2D::Globals
  class BLArray < BLStructure
    @core = uninitialized LibBlend2D::BLArrayCore

    def initialize(type : LibBlend2D::BLImplType)
      LibBlend2D.array_init(pointer, type)
    end

    def initialize(array : Array(BLStructure), type : LibBlend2D::BLImplType)
      initialize type
      array.each { |s| self << s }
    end

    protected def pointer : Pointer(LibBlend2D::BLArrayCore)
      pointerof(@core)
    end

    def finalize
      LibBlend2D.array_reset(pointer)
    end

    def <<(item : BLStructure)
      LibBlend2D.array_append_item(pointer, item.pointer)
    end
  end
end
