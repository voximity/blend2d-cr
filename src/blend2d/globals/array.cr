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

    def initialize(array_core : LibBlend2D::BLArrayCore)
      @core = array_core
    end

    protected def pointer : Pointer(LibBlend2D::BLArrayCore)
      pointerof(@core)
    end

    def finalize
      LibBlend2D.array_destroy(pointer)
    end

    def <<(item : BLStructure)
      LibBlend2D.array_append_item(pointer, item.pointer)
    end

    def fill_array(array : Array(T)) forall T
      data_pointer = LibBlend2D.array_get_data(pointer)
      size = LibBlend2D.array_get_size(pointer)

      size.times do |i|
        array << Pointer.new(data_pointer + i * sizeof(T)).value
      end
    end

    def to_slice(x : T.class) forall T
      data_pointer = LibBlend2D.array_get_data(pointer)
      size = LibBlend2D.array_get_size(pointer)
      Slice.new(Pointer(T).new(data_pointer.address), size)
    end
  end
end
