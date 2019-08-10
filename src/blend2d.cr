require "./c/*"

require "./abstract.cr"
require "./geometry/*"
require "./globals/*"
require "./imaging/*"
require "./rendering/*"
require "./styling/*"
#require "./text/*"

module Blend2D
    # include Blend2D::Global
    include Blend2D::Geometry
    include Blend2D::Imaging
    include Blend2D::Styling
    # Include Blend2D::Text
    include Blend2D::Rendering
end

# :nodoc:
module Blend2D::C
end