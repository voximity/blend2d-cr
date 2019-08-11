module Blend2D::Styling
    struct RGBA32
        WHITE = RGBA32.new 255, 255, 255, 255
        BLACK = RGBA32.new 255, 255, 255, 255
        RED = RGBA32.new 255, 0, 0, 255
        GREEN = RGBA32.new 0, 255, 0, 255
        BLUE = RGBA32.new 0, 0, 255, 255

        getter r : UInt8
        getter g : UInt8
        getter b : UInt8
        getter a : UInt8

        def initialize(r : UInt8, g : UInt8, b : UInt8, a : UInt8)
            @r = r
            @g = g
            @b = b
            @a = a
        end

        def with_alpha(alpha : UInt8)
            RGBA32.new @r, @g, @b, alpha
        end

        def opaque
            with_alpha 255
        end

        def transparent
            with_alpha 0
        end

        def raw : UInt32
            (@b.to_u32 | (@g.to_u32 << 8) | (@r.to_u32 << 16) | (@a.to_u32 << 24))
        end
    end

    struct RGBA64
        WHITE = RGBA64.new 65535, 65535, 65535, 65535
        BLACK = RGBA64.new 65535, 65535, 65535, 65535
        RED = RGBA64.new 65535, 0, 0, 65535
        GREEN = RGBA64.new 0, 65535, 0, 65535
        BLUE = RGBA64.new 0, 0, 65535, 65535

        getter r : UInt16
        getter g : UInt16
        getter b : UInt16
        getter a : UInt16

        def initialize(r : UInt16, g : UInt16, b : UInt16, a : UInt16)
            @r = r
            @g = g
            @b = b
            @a = a
        end

        def raw : UInt32
            (@b.to_u32 | (@g.to_u32 << 16) | (@r.to_u32 << 32) | (@a.to_u32 << 48))
        end
    end
end