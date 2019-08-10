module Blend2D::C
    @[Link("blend2d")]
    lib LibBlend2D
        fun array_init = blArrayInit(BLArrayCore*, UInt32) : BLResult
        fun array_reset = blArrayReset(BLArrayCore*) : BLResult
        # fun array_init_from_data
        fun array_get_size = blArrayGetSize(BLArrayCore*) : LibC::SizeT
        fun array_get_capacity = blArrayGetCapacity(BLArrayCore*) : LibC::SizeT
        fun array_get_data = blArrayGetData(BLArrayCore*) : Void*
        fun array_clear = blArrayClear(BLArrayCore*) : BLResult
        fun array_shrink = blArrayShrink(BLArrayCore*) : BLResult
        fun array_reserve = blArrayReserve(BLArrayCore*, LibC::SizeT) : BLResult
        fun array_resize = blArrayResize(BLArrayCore*, LibC::SizeT, Void*) : BLResult
        fun array_make_mutable = blArrayMakeMutable(BLArrayCore*, Void**) : BLResult
        fun array_modify_op = blArrayModifyOp(BLArrayCore*, UInt32, LibC::SizeT, Void**) : BLResult
        fun array_insert_op = blArrayInsertOp(BLArrayCore*, LibC::SizeT, LibC::SizeT, Void**) : BLResult
        # fun array_assign_move
        # fun array_assign_weak
        # fun array_assign_deep
        # fun array_assign_view
        fun array_append_u8 = blArrayAppendU8(BLArrayCore*, UInt8) : BLResult
        fun array_append_u16 = blArrayAppendU16(BLArrayCore*, UInt16) : BLResult
        fun array_append_u32 = blArrayAppendU32(BLArrayCore*, UInt32) : BLResult
        fun array_append_u64 = blArrayAppendU64(BLArrayCore*, UInt64) : BLResult
        fun array_append_f32 = blArrayAppendF32(BLArrayCore*, Float32) : BLResult
        fun array_append_f64 = blArrayAppendF64(BLArrayCore*, Float64) : BLResult
        fun array_append_item = blArrayAppendItem(BLArrayCore*, Void*) : BLResult
        fun array_append_view = blArrayAppendView(BLArrayCore*, Void*, LibC::SizeT) : BLResult
        # I'll do the inserts later....... UGH
        # Also I'll do the replacements later I guess
        # Who needs removes...... later

        struct BLArrayImpl
            data : Void*
            size : LibC::SizeT
            capacity : LibC::SizeT
            refCount : LibC::SizeT
            implType : UInt8
            implTraits : UInt8
            memPoolData : UInt16
            itemSize : UInt8
            dispatchType : UInt8
            reserved : UInt8[2]
        end

        struct BLArrayCore
            impl : BLArrayImpl*
        end
    end
end