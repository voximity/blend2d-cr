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

        # Initialize the color with four 8-bit unsigned integers representing red, green, blue, and alpha.
        def initialize(r : UInt8, g : UInt8, b : UInt8, a : UInt8)
            @r = r
            @g = g
            @b = b
            @a = a
        end

        # Initialize the color with a 32-bit unsigned integer representing red, green, blue, and alpha.
        def initialize(packed : UInt32)
            @b = packed & 0xFF
            @g = packed & 0xFF00 >> 8
            @r = packed & 0xFF0000 >> 16
            @a = packed & 0xFF000000 >> 24
        end

        # Initialize the color with the same red, green, and blue values, but with the specified alpha value.
        def with_alpha(alpha : UInt8)
            RGBA32.new @r, @g, @b, alpha
        end

        # Initialize the color with full alpha.
        def opaque
            with_alpha 255
        end

        # Initialize the color with zero alpha.
        def transparent
            with_alpha 0
        end

        # Convert the `RGBA32` to an `RGBA64` by upscaling each integer to 16 bits.
        def to_rgba64 : RGBA64
            RGBA64.new r*256, g*256, b*256, a*256
        end

        # Pack the integers into a 32-bit unsigned integer.
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

        # Initialize the color with four 16-bit unsigned integers representing red, green, blue, and alpha.
        def initialize(r : UInt16, g : UInt16, b : UInt16, a : UInt16)
            @r = r
            @g = g
            @b = b
            @a = a
        end

        # Initialize the color with a 64-bit unsigned integer representing red, green, blue, and alpha.
        def initialize(packed : UInt64)
            @b = packed & 0xFFFF
            @g = packed & 0xFFFF0000 >> 16
            @r = packed & 0xFFFF00000000 >> 32
            @a = packed & 0xFFFF000000000000 >> 48
        end

        # Initialize the color with the same red, green, and blue values, but with the specified alpha value.
        def with_alpha(alpha : UInt16)
            RGBA64.new @r, @g, @b, alpha
        end

        # Initialize the color with full alpha.
        def opaque
            with_alpha 65536
        end

        # Initialize the color with zero alpha.
        def transparent
            with_alpha 0
        end

        # Convert the `RGBA64` to an `RGBA32` by downscaling each integer to 8 bits.
        def to_rgba32
            RGBA32.new @r/255, @g/255, @b/255, @a/255
        end

        # Pack the integers into a 64-bit unsigned integer.
        def raw : UInt64
            (@b.to_u64 | (@g.to_u64 << 16) | (@r.to_u64 << 32) | (@a.to_u64 << 48))
        end
    end
end