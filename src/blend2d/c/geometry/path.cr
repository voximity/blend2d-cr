module Blend2D::C
    @[Link("blend2d")]
    lib LibBlend2D
        fun path_init = blPathInit(self : BLPathCore*) : BLResult
        fun path_reset = blPathReset(self : BLPathCore*) : BLResult
        fun path_get_size = blPathGetSize(self : BLPathCore*) : UInt32
        fun path_get_capacity = blPathGetCapacity(self : BLPathCore*) : UInt32
        fun path_get_command_data = blPathGetCommandData(self : BLPathCore*) : UInt8*
        fun path_get_vertex_data = blPathGetVertexData(self : BLPathCore*) : BLPoint*
        fun path_clear = blPathClear(self : BLPathCore*) : BLResult
        fun path_shrink = blPathShrink(self : BLPathCore*) : BLResult
        fun path_reserve = blPathReserve(self : BLPathCore*, n : UInt32) : BLResult
        fun path_modify_op = blPathModifyOp(self : BLPathCore*, op : UInt32, n : UInt32, cmdDataOut : UInt8**, vtxDataOut : BLPoint**) : BLResult
        fun path_assign_move = blPathAssignMove(self : BLPathCore*, other : BLPathCore*)
        fun path_assign_weak = blPathAssignWeak(self : BLPathCore*, other : BLPathCore*)
        fun path_assign_deep = blPathAssignDeep(self : BLPathCore*, other : BLPathCore*)
        fun path_set_vertex_at = blPathSetVertexAt(self : BLPathCore*, index : UInt32, cmd : UInt32, x : Float64, y : Float64) : BLResult
        fun path_move_to = blPathMoveTo(self : BLPathCore*, x0 : Float64, y0 : Float64) : BLResult
        fun path_line_to = blPathLineTo(self : BLPathCore*, x1 : Float64, y1 : Float64) : BLResult
        fun path_poly_to = blPathPolyTo(self : BLPathCore*, poly : BLPoint*, count : UInt32) : BLResult
        fun path_quad_to = blPathQuadTo(self : BLPathCore*, x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64) : BLResult
        fun path_cubic_to = blPathCubicTo(self : BLPathCore*, x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64, x3 : Float64, y3 : Float64) : BLResult
        fun path_smooth_quad_to = blPathSmoothQuadTo(self : BLPathCore*, x2 : Float64, y2 : Float64) : BLResult
        fun path_smooth_cubic_to = blPathSmoothCubicTo(self : BLPathCore*, x2 : Float64, y2 : Float64, x3 : Float64, y3 : Float64) : BLResult
        fun path_arc_to = blPathArcTo(self : BLPathCore*, x : Float64, y : Float64, rx : Float64, ry : Float64, start : Float64, sweep : Float64, forceMoveTo : Bool) : BLResult
        fun path_arc_quadrant_to = blPathArcQuadrantTo(self : BLPathCore*, x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64) : BLResult
        fun path_elliptic_arc_to = blPathEllipticArcTo(self : BLPathCore*, rx : Float64, ry : Float64, xAxisRotation : Float64, largeArcFlag : Bool, sweepFlag : Bool, x1 : Float64, y1 : Float64) : BLResult
        fun path_close = blPathClose(self : BLPathCore*) : BLResult
        # fun path_add_geometry = blAddGeometry(self : BLPathCore*, geometryType : UInt32, geometryData : Void*, m : BLMatrix2D*, dir : UInt32) : BLResult
        fun path_add_box_i = blPathAddBoxI(self : BLPathCore*, box : BLBoxI*, dir : UInt32) : BLResult
        fun path_add_box_d = blPathAddBoxD(self : BLPathCore*, box : BLBox*, dir : UInt32) : BLResult
        fun path_add_rect_i = blPathAddRectI(self : BLPathCore*, rect : BLRectI*, dir : UInt32) : BLResult
        fun path_add_rect_d = blPathAddRectD(self : BLPathCore*, rect : BLRect*, dir : UInt32) : BLResult
        fun path_add_path = blPathAddPath(self : BLPathCore*, other : BLPathCore*, range : BLRange*) : BLResult
        fun path_add_translated_path = blPathAddTranslatedPath(self : BLPathCore*, other : BLPathCore*, range : BLRange*, p : BLPoint*) : BLResult
        # fun path_add_transformed_path = blPathAddTransformedPath(self : BLPathCore*, other : BLPathCore*, range : BLRange*, m : BLMatrix2D*) : BLResult
        fun path_add_reversed_path = blPathAddReversedPath(self : BLPathCore*, other : BLPathCore*, range : BLRange*, reverseMode : UInt32) : BLResult
        # fun path_add_stroked_path = blPathAddStrokedPath(self : BLPathCore*, other : BLPathCore*, range : BLRange*, options : BLStrokeOptionsCore*, approx : BLApproximationOptions*) : BLResult
        fun path_translate = blPathTranslate(self : BLPathCore*, range : BLRange*, p : BLPoint*) : BLResult
        # fun path_transform = blPathTransform(self : BLPathCore*, range : BLRange*, m : BLMatrix2D) : BLResult
        fun path_fit_to = blPathFitTo(self : BLPathCore*, range : BLRange*, rect : BLRect*, fitFlags : UInt32) : BLResult
        fun path_equals = blPathEquals(a : BLPathCore*, b : BLPathCore*) : Bool
        fun path_get_info_flags = blPathGetInfoFlags(self : BLPathCore*, flagsOut : UInt32*) : BLResult
        fun path_get_control_box = blPathGetControlBox(self : BLPathCore*, boxOut : BLBox*) : BLResult
        fun path_get_bounding_box = blPathGetBoundingBox(self : BLPathCore*, boxOut : BLBox*) : BLResult
        fun path_get_figure_range = blPathGetFigureRange(self : BLPathCore*, index : UInt32, rangeOut : BLRange*) : BLResult
        fun path_get_last_vertex = blPathGetLastVertex(self : BLPathCore*, vtxOut : BLPoint*) : BLResult
        fun path_get_closest_vertex = blPathGetClosestVertex(self : BLPathCore*, p : BLPoint*, maxDistance : Float64, indexOut : UInt32*, distanceOut : Float64*) : BLResult
        fun path_hit_test = blPathHitTest(self : BLPathCore*, p : BLPoint*, fillRule : UInt32) : UInt32

        struct BLPathView
            commandData : UInt8*
            vertexData : BLPoint*
            size : UInt32
        end

        struct BLPathImpl
            commandData : UInt8*
            vertexData : BLPoint*
            size : UInt32
            view : BLPathView
            refCount : UInt32
            implType : UInt8
            implTraits : UInt8
            memPoolData : UInt16
            flags : UInt32
            capacity : UInt32
        end

        struct BLPathCore
            impl : BLPathImpl*
        end
    end
end