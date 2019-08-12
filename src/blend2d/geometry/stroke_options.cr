include Blend2D::C

module Blend2D::Geometry
    class StrokeOptions
        @core = uninitialized LibBlend2D::BLStrokeOptionsCore

        protected def initialize(@core : LibBlend2D::BLStrokeOptionsCore)
        end

        protected def pointer
            pointerof(@core)
        end

        def start_cap : StrokeCap
            @core.startCap
        end

        def start_cap=(cap : StrokeCap)
            @core.startCap = cap
        end

        def end_cap : StrokeCap
            @core.endCap
        end

        def end_cap=(cap : StrokeCap)
            @core.endCap = cap
        end

        def join : StrokeJoin
            @core.join
        end

        def join=(stroke_join : StrokeJoin)
            @core.join = stroke_join
        end

        # transform order is necessary?

        def width : Float64
            @core.width
        end

        def width=(double : Float64)
            @core.width = double
        end

        def miter_limit : Float64
            @core.miterLimit
        end

        def miter_limit=(double : Float64)
            @core.miterLimit = double
        end

        # dash array later... BLArrays are wack
    end
end