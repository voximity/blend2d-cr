module Blend2D::C
    @[Link("blend2d")]
    lib LibBlend2D
        fun font_init = blFontInit(BLFontCore*) : BLResult
        fun font_reset = blFontReset(BLFontCore*) : BLResult
        fun font_equals = blFontEquals(BLFontCore*, BLFontCore*) : Bool
        fun font_create_from_face = blFontCreateFromFace(BLFontCore*, BLFontFaceCore*, Float64) : BLResult
        fun font_shape = blFontShape(BLFontCore*, BLGlyphBufferCore*) : BLResult
        fun font_map_text_to_glyphs = blFontMapTextToGlyphs(BLFontCore*, BLGlyphBufferCore*, BLGlyphMappingState*) : BLResult
        fun font_position_glyphs = blFontPositionGlyphs(BLFontCore*, BLGlyphBufferCore*, UInt32) : BLResult
        fun font_apply_kerning = blFontApplyKerning(BLFontCore*, BLGlyphBufferCore*) : BLResult
        # fun font_apply_gsub = blFontApplyGSub(BLFontCore*, )
        # fun font_apply_gpos
        # fun font_get_matrix
        # fun font_get_metrics
        # fun font_get_design_metrics
        # fun font_get_text_metrics
        # fun font_get_glyph_bounds
        # fun font_get_glyph_advances
        # fun font_get_glyph_outlines
        # fun font_get_glyph_run_outlines

        fun font_face_init = blFontFaceInit(BLFontFaceCore*) : BLResult
        fun font_face_reset = blFontFaceReset(BLFontFaceCore*) : BLResult
        fun font_face_equals = blFontFaceEquals(BLFontFaceCore*, BLFontFaceCore*) : Bool
        fun font_face_create_from_file = blFontFaceCreateFromFile(BLFontFaceCore*, LibC::Char*, UInt32) : BLResult
        fun font_face_create_from_loader = blFontFaceCreateFromLoader(BLFontFaceCore*, BLFontLoaderCore*, UInt32) : BLResult
        # get face info
        # get design metrics
        # get unicode coverage

        struct BLFontLoaderCore
            impl : BLFontLoaderImpl*
        end

        struct BLFontLoaderImpl
            # virt
            data : Void*
            size : LibC::SizeT
            refCount : LibC::SizeT
            implType : UInt8
            implTraits : UInt8
            memPoolData : UInt16
            faceType : UInt8
            reserved : UInt8[3]
            faceCount : UInt32
            loaderFlags : UInt32
        end

        struct BLFontDataCore
            impl : BLFontDataImpl*
        end

        struct BLFontDataImpl
            # virt
            data : Void*
            size : LibC::SizeT
            refCount : LibC::SizeT
            implType : UInt8
            implTraits : UInt8
            memPoolData : UInt16
            flags : UInt32
            headerOffset : LibC::SizeT
        end

        struct BLFontFaceInfo
            faceType : UInt8
            outlineType : UInt8
            glyphCount : UInt16
            faceIndex : UInt32
            faceFlags : UInt32
            diagFlags : UInt32
        end

        struct BLFontFaceCore
            impl : BLFontFaceImpl*
        end

        struct BLFontFaceImpl
            # virt
            data : BLFontDataCore*
            loader : BLFontLoaderCore*
            refCount : LibC::SizeT
            implType : UInt8
            implTraits : UInt8
            memPoolData : UInt16
            weight : UInt16
            stretch : UInt8
            style : UInt8
            faceInfo : BLFontFaceInfo
            faceUniqueId : UInt64
            # fullName : BLString
            # familyName : BLString
            # subfamilyName : BLString
            # postScriptName : BLString
            # designMetrics : BLFontDesignMetrics
            # unicodeCoverage : BLUnicodeCoverage
            # panose : BLFontPanose
        end

        alias BLGlyphId = UInt16

        struct BLGlyphMappingState
            glyphCount : LibC::SizeT
            undefinedFirst : LibC::SizeT
            undefinedCount : LibC::SizeT
        end

        struct BLGlyphItem
            value : UInt32
            glyphId : BLGlyphId
            reserved : UInt16
        end

        struct BLGlyphPlacement
            placement : BLPointI
            advance : BLPointI
        end

        struct BLGlyphBufferCore
            impl : BLGlyphBufferImpl*
        end

        struct BLGlyphRun
            glyphIdData : Void*
            placementData : Void*
            size : LibC::SizeT
            glyphIdSize : UInt8
            placementType : UInt8
            glyphIdAdvance : Int8
            placementAdvance : Int8
            flags : UInt32
        end

        struct BLGlyphInfo
            cluster : UInt32
            reserved : UInt32[2]
        end

        struct BLGlyphBufferImpl
            glyphItemData : BLGlyphItem*
            placementData : BLGlyphPlacement*
            size : LibC::SizeT
            reserved : UInt32
            flags : UInt32
            glyphRun : BLGlyphRun
            glyphInfoData : BLGlyphInfo*
        end

        struct BLFontCore
            impl : BLFontImpl*
        end

        struct BLFontImpl
            # face : BLFontFace
            # features
            # variations
            refCount : LibC::SizeT
            implType : UInt8
            implTraits : UInt8
            memPoolData : UInt16
            weight : UInt16
            stretch : UInt8
            style : UInt8
            # metrics : BLFontMetrics
            # matrix : BLFontMatrix
        end
    end
end