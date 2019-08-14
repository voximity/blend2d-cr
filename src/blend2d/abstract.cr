module Blend2D
  abstract class BLStructure
    abstract def pointer : Pointer

    # Called when Crystal's garbage collector collects this instance.
    abstract def finalize
  end
end

module Blend2D::Geometry
  abstract struct GeometryType
    abstract def type : LibBlend2D::BLGeometryType

    abstract def pointer : Pointer
  end
end
