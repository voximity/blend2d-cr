require "./blend2d/c/*"

require "./blend2d/abstract.cr"
require "./blend2d/geometry/*"
require "./blend2d/globals/*"
require "./blend2d/imaging/*"
require "./blend2d/rendering/*"
require "./blend2d/styling/*"
require "./blend2d/text/*"

module Blend2D
  include Blend2D::Globals
  include Blend2D::Geometry
  include Blend2D::Imaging
  include Blend2D::Styling
  include Blend2D::Text
  include Blend2D::Rendering

  private class CArray
    protected def self.get(pointer : Pointer(T), size : LibC::SizeT) forall T
      array = [] of T
      size.times do |n|
        array << Pointer(T).new(pointer.address + n * sizeof(T)).value
      end
      array
    end
  end
end

# :nodoc:
module Blend2D::C
end
