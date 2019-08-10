module Blend2D
    struct RGBA32
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

        def raw : UInt32
            (@b.to_u32 | (@g.to_u32 << 8) | (@r.to_u32 << 16) | (@a.to_u32 << 24))
        end
    end

    struct RGBA64
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