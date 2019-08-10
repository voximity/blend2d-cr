module Blend2D
    @[Link("blend2d")]
    lib LibBlend2D
        struct BLArrayImpl
            data : Void*
            size : UInt32
            capacity : UInt32
            refCount : UInt32
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