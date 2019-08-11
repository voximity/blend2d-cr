include Blend2D::C

module Blend2D::Geometry
    # A box struct, restricted to integers.
    struct BoxI < GeometryType
        getter x0 : Int32
        getter y0 : Int32
        getter x1 : Int32
        getter y1 : Int32

        @core = uninitialized LibBlend2D::BLBoxI

        # Initialize a new `BoxI` given two integer pairs representing points.
        def initialize(@x0 : Int32, @y0 : Int32, @x1 : Int32, @y1 : Int32)
            @core = LibBlend2D::BLBoxI.new x0: @x0, y0: @y0, x1: @x1, y1: @y1
        end

        # Initialize a new `BoxI` from two `PointI`s.
        def initialize(a : PointI, b : PointI)
            initialize(a.x, a.y, b.x, b.y)
        end

        # The first point representing the box's position.
        def a
            PointI.new x0, y0
        end

        # The second point representing the box's position/size.
        def b
            PointI.new x1, y1
        end

        protected def type
            LibBlend2D::BLGeometryType::BL_GEOMETRY_TYPE_BOXI
        end

        protected def pointer
            pointerof(@core)
        end
    end

    # A box struct.
    struct Box < GeometryType
        getter x0 : Float64
        getter y0 : Float64
        getter x1 : Float64
        getter y1 : Float64

        @core = uninitialized LibBlend2D::BLBox

        # Initialize a new `Box` given two double floating point pairs, representing points.
        def initialize(@x0 : Float64, @y0 : Float64, @x1 : Float64, @y1 : Float64)
            @core = LibBlend2D::BLBox.new x0: @x0, y0: @y0, x1: @x1, y1: @y1
        end

        # Initialize a new `Box` given two `Point`s.
        def initialize(a : Point, b : Point)
            initialize(a.x, a.y, b.x, b.y)
        end

        # The first point representing the box's position.
        def a
            Point.new x0, y0
        end

        # The second point representing the box's position/size.
        def b
            Point.new x1, y1
        end

        protected def type
            LibBlend2D::BLGeometryType::BL_GEOMETRY_TYPE_BOXD
        end

        protected def pointer
            pointerof(@core)
        end
    end

    struct RectI < GeometryType
        getter x : Int32
        getter y : Int32
        getter w : Int32
        getter h : Int32

        @core = uninitialized LibBlend2D::BLRectI

        # Initialize a new `RectI` given the position, width, and height.
        def initialize(@x : Int32, @y : Int32, @w : Int32, @h : Int32)
            @core = LibBlend2D::BLRectI.new x: @x, y: @y, w: @w, h: @h
        end

        # Initialize a new `Rect` given the position as a point, width, and height.
        def initialize(point : PointI, w : Int32, h : Int32)
            initialize(point.x, point.y, w, h)
        end

        # The `Point` representing this `RectI`'s position.
        def position
            Point.new x, y
        end

        protected def type
            LibBlend2D::BLGeometryType::BL_GEOMETRY_TYPE_RECTI
        end

        protected def pointer
            pointerof(@core)
        end
    end

    struct Rect < GeometryType
        getter x : Float64
        getter y : Float64
        getter w : Float64
        getter h : Float64

        @core = uninitialized LibBlend2D::BLRect

        # Initialize a new `Rect` given the position, width, and height.
        def initialize(@x : Float64, @y : Float64, @w : Float64, @h : Float64)
            @core = LibBlend2D::BLRect.new x: @x, y: @y, w: @w, h: @h
        end

        # Initialize a new `Rect` given the position as a point, width, and height.
        def initialize(point : Point, w : Float64, h : Float64)
            initialize(point.x, point.y, w, h)
        end

        # The `Point` representing this `Rect`'s position.
        def position
            Point.new x, y
        end

        protected def type
            LibBlend2D::BLGeometryType::BL_GEOMETRY_TYPE_RECTD
        end

        protected def pointer
            pointerof(@core)
        end
    end
end