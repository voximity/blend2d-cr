include Blend2D::C

module Blend2D::Globals
    class Range
        getter start_index : Int32
        getter end_index : Int32

        @core = uninitialized LibBlend2D::BLRange

        def initialize(@start_index, @end_index)
            core = LibBlend2D::BLRange.new @start_index, @end_index
        end

        def initialize(range : ::Range)
            initialize(range.begin, range.end)
        end

        protected def pointer
            pointerof(core)
        end
    end
end