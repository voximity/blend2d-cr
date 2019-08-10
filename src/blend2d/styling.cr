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

        def raw
            0xFFFFFFFF#@b + @g << 8 + @r << 16 + @a << 24
        end
    end
end