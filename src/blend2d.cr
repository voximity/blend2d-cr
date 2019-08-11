require "./c/*"

require "./abstract.cr"
require "./geometry/*"
require "./globals/*"
require "./imaging/*"
require "./rendering/*"
require "./styling/*"
require "./text/*"

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