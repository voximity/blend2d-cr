module Blend2D::C
    @[Link("blend2d")]
    lib LibBlend2D
        enum BLCompOp : UInt32
            BL_COMP_OP_SRC_OVER,
            BL_COMP_OP_SRC_COPY,
            BL_COMP_OP_SRC_IN,
            BL_COMP_OP_SRC_OUT,
            BL_COMP_OP_SRC_ATOP,
            BL_COMP_OP_DST_OVER,
            BL_COMP_OP_DST_COPY,
            BL_COMP_OP_DST_IN,
            BL_COMP_OP_DST_OUT,
            BL_COMP_OP_DST_ATOP,
            BL_COMP_OP_XOR,
            BL_COMP_OP_CLEAR,
            BL_COMP_OP_PLUS,
            BL_COMP_OP_MINUS,
            BL_COMP_OP_MULTIPLY,
            BL_COMP_OP_SCREEN,
            BL_COMP_OP_OVERLAY,
            BL_COMP_OP_DARKEN,
            BL_COMP_OP_LIGHTEN,
            BL_COMP_OP_COLOR_DODGE,
            BL_COMP_OP_COLOR_BURN,
            BL_COMP_OP_LINEAR_BURN,
            BL_COMP_OP_LINEAR_LIGHT
            BL_COMP_OP_PIN_LIGHT,
            BL_COMP_OP_HARD_LIGHT,
            BL_COMP_OP_SOFT_LIGHT,
            BL_COMP_OP_DIFFERENCE,
            BL_COMP_OP_EXCLUSION,
            BL_COMP_OP_COUNT
        end

        fun context_init = blContextInit(self : BLContextCore*) : BLResult
        fun context_init_as = blContextInitAs(self : BLContextCore*, image : BLImageCore*, options : BLContextCreateInfo*) : BLResult
        fun context_reset = blContextReset(self : BLContextCore*) : BLResult
        fun context_assign_move = blContextAssignMove(self : BLContextCore*, other : BLContextCore*) : BLResult
        fun context_assign_weak = blContextAssignMove(self : BLContextCore*, other : BLContextCore*) : BLResult
        fun context_get_type = blContextGetType(self : BLContextCore*) : BLResult
        fun context_begin = blContextBegin(self : BLContextCore*, image : BLImageCore*, options : BLContextCreateInfo*) : BLResult
        fun context_end = blContextEnd(self : BLContextCore*) : BLResult
        fun context_flush = blContextFlush(self : BLContextCore*, flags : UInt32) : BLResult
        fun context_save = blContextSave(self : BLContextCore*, cookie : BLContextCookie*) : BLResult
        fun context_restore = blContextRestore(self : BLContextCore*, cookie : BLContextCookie*) : BLResult
        # fun context_get_meta_matrix = blContextGetMetaMatrix(self : BLContextCore*, m : BLMatrix2D*) : BLResult
        # fun context_get_user_matrix = blContextGetUserMatrix(self : BLContextCore*, m : BLMatrix2D*) : BLResult
        fun context_user_to_meta = blContextUserToMeta(self : BLContextCore*) : BLResult
        fun context_matrix_op = blContextMatrixOp(self : BLContextCore*, opType : UInt32, opData : Void*) : BLResult
        fun context_set_hint = blContextSetHint(self : BLContextCore*, hintType : UInt32, value : UInt32) : BLResult
        # fun context_set_hints = blContextSetHints(self : BLContextCore*, hints : BLContextHints*)
        fun context_set_flatten_mode = blContextSetFlattenMode(self : BLContextCore*, mode : UInt32) : BLResult
        fun context_set_flatten_tolerance = blContextSetFlattenTolerance(self : BLContextCore*, tolerance : Float64) : BLResult
        fun context_set_approximation_options = blContextSetApproximationOptions(self : BLContextCore*, options : BLApproximationOptions*) : BLResult
        fun context_set_comp_op = blContextSetCompOp(self : BLContextCore*, compOp : UInt32) : BLResult
        fun context_set_global_alpha = blContextSetGlobalAlpha(self : BLContextCore*, alpha : Float64) : BLResult
        fun context_set_fill_alpha = blContextSetFillAlpha(self : BLContextCore*, alpha : Float64) : BLResult
        fun context_get_fill_style = blContextGetFillStyle(self : BLContextCore*, object : Void*) : BLResult
        fun context_get_fill_style_rgba32 = blContextGetFillStyleRgba32(self : BLContextCore*, rgba32 : UInt32*) : BLResult
        fun context_get_fill_style_rgba64 = blContextGetFillStyleRgba64(self : BLContextCore*, rgba64 : UInt64*) : BLResult
        fun context_set_fill_style = blContextSetFillStyle(self : BLContextCore*, object : Void*) : BLResult
        fun context_set_fill_style_rgba32 = blContextSetFillStyleRgba32(self : BLContextCore*, rgba32 : UInt32) : BLResult
        fun context_set_fill_style_rgba64 = blContextSetFillStyleRgba64(self : BLContextCore*, rgba64 : UInt64) : BLResult
        fun context_set_fill_rule = blContextSetFillRule(self : BLContextCore*, fillRule : UInt32) : BLResult
        fun context_set_stroke_alpha = blContextSetStrokeAlpha(self : BLContextCore*, alpha : Float64) : BLResult
        fun context_get_stroke_style_rgba32 = blContextGetStrokeStyleRgba32(self : BLContextCore*, rgba32 : UInt32*) : BLResult
        fun context_get_stroke_style_rgba64 = blContextGetStrokeStyleRgba64(self : BLContextCore*, rgba64 : UInt64*) : BLResult
        fun context_set_stroke_style = blContextSetStrokeStyle(self : BLContextCore*, object : Void*) : BLResult
        fun context_set_stroke_style_rgba32 = blContextSetStrokeStyleRgba32(self : BLContextCore*, rgba32 : UInt32) : BLResult
        fun context_set_stroke_style_rgba64 = blContextSetStrokeStyleRgba64(self : BLContextCore*, rgba64 : UInt64) : BLResult
        fun context_set_stroke_width = blContextSetStrokeWidth(self : BLContextCore*, width : Float64) : BLResult
        fun context_set_stroke_miter_limit = blContextSetStrokeMiterLimit(self : BLContextCore*, miterLimit : Float64) : BLResult
        fun context_set_stroke_cap = blContextSetStrokeCap(self : BLContextCore*, position : UInt32, strokeCap : UInt32) : BLResult
        fun context_set_stroke_caps = blContextSetStrokeCaps(self : BLContextCore*, strokeCap : UInt32) : BLResult
        fun context_set_stroke_join = blContextSetStrokeJoin(self : BLContextCore*, strokeJoin : UInt32) : BLResult
        fun context_set_stroke_dash_offset = blContextSetStrokeDashOffset(self : BLContextCore*, dashOffset : Float64) : BLResult
        # fun context_set_stroke_dash_array = blContextSetStrokeDashArray(self : BLContextCore*, dashArray : BLArrayCore*) : BLResult
        fun context_set_stroke_transform_order = blContextSetStrokeTransformOrder(self : BLContextCore*, transformOrder : UInt32) : BLResult
        fun context_get_stroke_options = blContextGetStrokeOptions(self : BLContextCore*, options : BLStrokeOptionsCore*) : BLResult
        fun context_set_stroke_options = blContestSetStrokeOptions(self : BLContextCore*, options : BLStrokeOptionsCore*) : BLResult
        fun context_clip_to_rect_i = blContextClipToRectI(self : BLContextCore*, rect : BLRectI*) : BLResult
        fun context_clip_to_rect_d = blContextClipToRectD(self : BLContextCore*, rect : BLRect*) : BLResult
        fun context_restore_clipping = blContextRestoreClipping(self : BLContextCore*) : BLResult
        fun context_clear_all = blContextClearAll(self : BLContextCore*) : BLResult
        fun context_clear_rect_i = blContextClearRectI(self : BLContextCore*, rect : BLRectI*) : BLResult
        fun context_clear_rect_d = blContextClearRectD(self : BLContextCore*, rect : BLRect*) : BLResult
        fun context_fill_all = blContextFillAll(self : BLContextCore*) : BLResult
        fun context_fill_rect_i = blContextFillRectI(self : BLContextCore*, rect : BLRectI*) : BLResult
        fun context_fill_rect_d = blContextFillRectD(self : BLContextCore*, rect : BLRect*) : BLResult
        fun context_fill_path_d = blContextFillPathD(self : BLContextCore*, path : BLPathCore*) : BLResult
        fun context_fill_geometry = blContextFillGeometry(self : BLContextCore*, geometryType : UInt32, geometryData : Void*) : BLResult
        fun context_fill_text_i = blContextFillTextI(self : BLContextCore*, pt : BLPointI*, font : BLFontCore*, text : Void*, size : LibC::SizeT, encoding : UInt32) : BLResult
        fun context_fill_text_d = blContextFillTextD(self : BLContextCore*, pt : BLPoint*, font : BLFontCore*, text : Void*, size : LibC::SizeT, encoding : UInt32) : BLResult
        fun context_fill_glyph_run_i = blContextFillGlyphRunI(self : BLContextCore*, pt : BLPointI*, font : BLFontCore*, glyphRun : BLGlyphRun*) : BLResult
        fun context_fill_glyph_run_d = blContextFillGlyphRunD(self : BLContextCore*, pt : BLPoint*, font : BLFontCore*, glyphRun : BLGlyphRun*) : BLResult
        fun context_stroke_rect_i = blContextStrokeRectI(self : BLContextCore*, rect : BLRectI*) : BLResult
        fun context_stroke_rect_d = blContextStrokeRectD(self : BLContextCore*, rect : BLRect*) : BLResult
        fun context_stroke_path_d = blContextStrokePathD(self : BLContextCore*, path : BLPathCore*) : BLResult
        fun context_stroke_geometry = blContextStrokeGeometry(self : BLContextCore*, geometryType : UInt32, geometryData : Void*) : BLResult
        fun context_stroke_text_i = blContextStrokeTextI(self : BLContextCore*, pt : BLPointI*, font : BLFontCore*, text : Void*, size : LibC::SizeT, encoding : UInt32) : BLResult
        fun context_stroke_text_d = blContextStrokeTextD(self : BLContextCore*, pt : BLPoint*, font : BLFontCore*, text : Void*, size : LibC::SizeT, encoding : UInt32) : BLResult
        fun context_stroke_glyph_run_i = blContextStrokeGlyphRunI(self : BLContextCore*, pt : BLPointI*, font : BLFontCore*, glyphRun : BLGlyphRun*) : BLResult
        fun context_stroke_glyph_run_d = blContextStrokeGlyphRunD(self : BLContextCore*, pt : BLPoint*, font : BLFontCore*, glyphRun : BLGlyphRun*) : BLResult
        fun context_blit_image_i = blContextBlitImageI(self : BLContextCore*, rect : BLRectI*, img : BLImageCore*, imgArea : BLRectI*) : BLResult
        fun context_blit_image_d = blContextBlitImageD(self : BLContextCore*, rect : BLRect*, img : BLImageCore*, imgArea : BLRectI*) : BLResult
        fun context_blit_scaled_image_i = blContextBlitScaledImageI(self : BLContextCore*, rect : BLRectI*, img : BLImageCore*, imgArea : BLRectI*) : BLResult
        fun context_blit_scaled_image_d = blContextBlitScaledImageD(self : BLContextCore*, rect : BLRect*, img : BLImageCore*, imgArea : BLRectI*) : BLResult

        struct BLStrokeOptionsCore
            startCap : UInt8
            endCap : UInt8
            join : UInt8
            transformOrder : UInt8
            reserved : UInt8[4]
            caps : UInt8[2]
            hints : UInt64
            width : Float64
            miterLimit : Float64
            dashOffset : Float64
            dashArray : BLArray
        end

        struct BLContextCookie
            data : UInt64[2]
        end

        struct BLContextCreateInfo
            flags : UInt32
            threadCount : UInt32
            cpuFeatures : UInt32
            reserved : UInt32[5]
        end

        struct BLContextImpl
            # virt : BLContextVirt*
            # state : BLContextState*
            reservedHeader : Void*
            refCount : LibC::SizeT
            implType : UInt8
            implTraits : UInt8
            memPoolData : UInt16
            contextType : UInt32
            targetSize : BLSize
        end

        struct BLContextCore
            impl : BLContextImpl*
        end
    end
end