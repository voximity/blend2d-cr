module Blend2D::C
    @[Link("blend2d")]
    lib LibBlend2D
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