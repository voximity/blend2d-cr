include Blend2D::C

module Blend2D::Globals
    class Array < BLStructure
        @core = uninitialized LibBlend2D::BLArrayCore
        def initialize
            @core = LibBlend2D.array_init(pointer)
        end

        protected def pointer
            pointerof(@core)
        end

        def finalize
            LibBlend2D.array_reset(pointer)
        end
    end
end