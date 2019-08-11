include Blend2D::C

module Blend2D::Text
    class TextMetrics
        @core = uninitialized LibBlend2D::BLTextMetrics

        # Initialized this `TextMetrics` object such that it pulls its data from a `Font` and a `GlyphBuffer`.
        def initialize(font : Font, buffer : GlyphBuffer)
            LibBlend2D.font_get_text_metrics(font.pointer, buffer.pointer, out metrics)
            @core = metrics
        end

        protected def pointer
            pointerof(@core)
        end

        # The advance point of this metric.
        def advance
            point = @core.advance
            Point.new point.x, point.y
        end

        # The bounding box of this metric.
        def bounding_box
            box = @core.boundingBox
            Box.new box.x0, box.y0, box.x1, box.y1
        end
    end
end