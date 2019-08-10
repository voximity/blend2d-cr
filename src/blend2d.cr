require "./c/lib-blend2d.cr"
require "./*"
require "./geometry/*"

module Blend2D
    include Blend2D::Geometry
end

# :nodoc:
module Blend2D::C
end