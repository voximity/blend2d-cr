include Blend2D::C

module Blend2D::Globals
  class BLString < BLStructure
    @core = uninitialized LibBlend2D::BLStringCore

    def initialize(string : String)
      LibBlend2D.string_init(pointer)
      LibBlend2D.string_apply_op_data(pointer, LibBlend2D::BLModifyOp::BL_MODIFY_OP_ASSIGN_FIT, string, string.size)
    end

    protected def pointer
      pointerof(@core)
    end

    protected def core_size
      instance_sizeof(BLString)
    end

    def finalize
      LibBlend2D.string_reset(pointer)
    end

    def content
      ptr = LibBlend2D.string_get_data(pointer)
      size = LibBlend2D.string_get_size(pointer)
      String.build do |s|
        CArray.get(ptr, size).each do |c|
          s << c.unsafe_chr
        end
      end
    end
  end
end
