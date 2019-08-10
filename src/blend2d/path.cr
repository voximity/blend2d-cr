module Blend2D
    class Path
        protected def ptr
            pointerof(@core)
        end

        def initialize
            @core = uninitialized LibBlend2D::BLPathCore
            LibBlend2D.path_init(ptr)
        end

        def clear
            LibBlend2D.path_clear(ptr)
        end

        def shrink
            LibBlend2D.path_shrink(ptr)
        end

        def move_to(x, y)
            LibBlend2D.path_move_to(ptr, x, y)
        end

        def cubic_to(x1, y1, x2, y2, x3, y3)
            LibBlend2D.path_cubic_to(ptr, x1, y1, x2, y2, x3, y3)
        end
    end
end