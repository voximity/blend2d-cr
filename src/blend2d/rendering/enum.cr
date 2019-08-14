module Blend2D::Rendering
  enum CompositionOperator : UInt32
    SourceOver
    SourceCopy
    SourceIn
    SourceOut
    SourceAtop
    DestinationOver
    DestinationCopy
    DestinationIn
    DestinationOut
    DestinationAtop
    ExclusiveOr
    Clear
    Plus
    Minus
    Multiply
    Screen
    Overlay
    Darken
    Lighten
    ColorDodge
    ColorBurn
    LinearBurn
    LinearLight
    PinLight
    HardLight
    SoftLight
    Difference
    Exclusion
  end
end
