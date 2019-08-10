module Blend2D::C
    @[Link("blend2d")]
    lib LibBlend2D
        struct BLPathImpl

        end

        struct BLPathCore
            impl : BLPathImpl*
        end
    end
end