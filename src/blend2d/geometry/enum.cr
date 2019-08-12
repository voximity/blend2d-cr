module Blend2D::Geometry
    enum ArcType
        Arc
        Chord
        Pie
    end

    enum MatrixOperation
        Reset
        Assign
        Translate
        Scale
        Skew
        Rotate
        RotatePoint
        Transform
        PostTranslate
        PostScale
        PostSkew
        PostRotate
        PostRotatePoint
        PostTransform
    end

    enum GeometryDirection
        None
        Clockwise
        CounterClockwise
    end

    enum StrokeJoin : UInt8
        MiterClip
        MiterBevel
        MiterRound
        Bevel
        Round
    end

    enum StrokeCapPosition : UInt8
        Start
        End
    end

    enum StrokeCap : UInt8
        Butt
        Square
        Round
        ReversedRound
        Triangle
        ReversedTriangle
    end
end