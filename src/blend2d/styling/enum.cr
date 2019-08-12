module Blend2D::Styling
    enum GradientType : UInt32
        Linear
        Radial
        Conical
    end

    enum ExtendMode : UInt32
        Pad
        Repeat
        Reflect
        PadXY
        RepeatXY
        ReflectXY
        PadXRepeatY
        PadXReflectY
        RepeatXPadY
        RepeatXReflectY
        ReflectXPadY
        ReflectXRepeatY
        SimpleCount
        ComplexCount
    end
end