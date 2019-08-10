include Blend2D::C

module Blend2D::Geometry
    class Path < BLStructure
        # Initializes a path.
        def initialize
            @core = uninitialized LibBlend2D::BLPathCore
            LibBlend2D.path_init(pointer)
        end

        protected def pointer
            pointerof(@core)
        end

        def finalize
            LibBlend2D.path_reset(pointer)
        end

        # get size?
        
        # get capacity?

        # get command data?

        # get vertex data?

        def clear
            LibBlend2D.path_clear(pointer)
        end

        def shrink
            LibBlend2D.path_shrink(pointer)
        end

        # reserve?

        # modify operation?

        # set vertex at?

        def move_to(x, y)
            LibBlend2D.path_move_to(pointer, x, y)
        end

        def line_to(x, y)
            LibBlend2D.path_line_to(pointer, x, y)
        end

        # poly to

        def quad_to(x1, y1, x2, y2)
            LibBlend2D.path_quad_to(pointer, x1, y1, x2, y2)
        end

        def cubic_to(x1, y1, x2, y2, x3, y3)
            LibBlend2D.path_cubic_to(pointer, x1, y1, x2, y2, x3, y3)
        end

        def smooth_quad_to(x2, y2)
            LibBlend2D.path_smooth_quad_to(pointer, x2, y2)
        end

        def smooth_cubic_to(x2, y2, x3, y3)
            LibBlend2D.path_smooth_cubic_to(pointer, x2, y2, x3, y3)
        end

        def arc_to(x, y, rx, ry, start, sweep, force_move_to)
            LibBlend2D.path_arc_to(pointer, x, y, rx, ry, start, sweep, force_move_to)
        end

        def arc_quadrant_to(x1, y1, x2, y2)
            LibBlend2D.path_arc_quadrant_to(pointer, x1, y1, x2, y2)
        end

        def elliptic_arc_to(rx, ry, x_rotation, large_arc, sweep, x1, y1)
            LibBlend2D.path_elliptic_arc_to(pointer, rx, ry, x_rotation, large_arc, sweep, x1, y1)
        end

        def close
            LibBlend2D.path_close(pointer)
        end

        # add geometry

        # add box i

        # add box d

        # add rect i

        # add rect d

        def add_path(other : Path, range : Range)
            LibBlend2D.path_add_path(pointer, other.pointer, LibBlend2D::BLRange.new start: range.begin, end: range.end)
        end

        # add translated path

        # add transformed path

        # add reversed path

        # add stroked path

        # translate

        # transform

        # fit to

        def ==(other : Path)
            LibBlend2D.path_equals(pointer, other.pointer)
        end

        # get info flags?

        # get control box?

        # get bounding box?

        # get figure range?

        def last_vertex
            LibBlend2D.path_get_last_vertex(pointer, out point)
            Point.new point.x, point.y
        end

        # get closest vertex
    end
end