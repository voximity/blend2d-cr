include Blend2D::C

module Blend2D::Geometry
  class Path < BLStructure
    # Initializes a path.
    def initialize
      @core = uninitialized LibBlend2D::BLPathCore
      LibBlend2D.path_init(pointer)
    end

    protected def pointer : Pointer(LibBlend2D::BLPathCore)
      pointerof(@core)
    end

    def finalize
      LibBlend2D.path_destroy(pointer)
    end

    def vertices
      CArray.get(LibBlend2D.path_get_vertex_data(pointer), LibBlend2D.path_get_size(pointer)).map { |p| Point.new p.x, p.y }
    end

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

    def add_geometry(geometry : GeometryType, direction : GeometryDirection, matrix : Matrix = nil)
      LibBlend2D.path_add_geometry(pointer, geometry.type, geometry.pointer, matrix, direction)
    end

    def add_box(box : BoxI, direction : GeometryDirection)
      LibBlend2D.path_add_box_i(pointer, box.pointer, direction)
    end

    def add_box(box : BoxD, direction : GeometryDirection)
      LibBlend2D.path_add_box_d(pointer, box.pointer, direction)
    end

    def add_rect(rect : RectI, direction : GeometryDirection)
      LibBlend2D.path_add_rect_i(pointer, rect.pointer, direction)
    end

    def add_rect(rect : Rect, direction : GeometryDirection)
      LibBlend2D.path_add_rect_d(pointer, rect.pointer, direction)
    end

    def add_path(other : Path, range : Blend2D::Globals::Range)
      LibBlend2D.path_add_path(pointer, other.pointer, range.pointer)
    end

    def add_translated_path(other : Path, range : Blend2D::Globals::Range, point : Point)
      LibBlend2D.path_add_translated_path(pointer, other.pointer, range.pointer, point.pointer)
    end

    def add_transformed_path(other : Path, range : Blend2D::Globals::Range, matrix : Matrix)
      LibBlend2D.path_add_transformed_path(pointer, other.pointer, range.pointer, matrix.pointer)
    end

    # add reversed path (need enum)

    # add stroked path (need enum)

    def translate(range : Blend2D::Globals::Range, point : Point)
      LibBlend2D.path_translate(pointer, range.pointer, point.pointer)
    end

    def transform(range : Blend2D::Globals::Range, matrix : Matrix)
      LibBlend2D.path_transform(pointer, range.pointer, matrix.pointer)
    end

    # fit to (need enum)

    def ==(other : Path)
      LibBlend2D.path_equals(pointer, other.pointer)
    end

    # get info flags (is this necessary?)

    def control_box
      LibBlend2D.path_get_control_box(pointer, out box)
      Box.new box.x0, box.y0, box.x1, box.y1
    end

    def bounding_box
      LibBlend2D.path_get_bounding_box(pointer, out box)
      Box.new box.x0, box.y0, box.x1, box.y1
    end

    # get figure range (is this necessary?)

    def last_vertex
      LibBlend2D.path_get_last_vertex(pointer, out point)
      Point.new point.x, point.y
    end

    # get closest vertex (need to implement a way to list vertices)
  end
end
