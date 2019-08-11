include Blend2D::C

module Blend2D::Text
    class FontMetrics
        @core = uninitialized LibBlend2D::BLFontMetrics

        # Initialized this `FontMetrics` object such that it pulls its data from a `Font`.
        def initialize(font : Font)
            LibBlend2D.font_get_metrics(font.pointer, out metrics)
            @core = metrics
        end

        protected def pointer
            pointerof(@core)
        end

        # The font size.
        def size
            @core.size
        end

        # The font ascent in a horizontal orientation.
        def ascent
            @core.ascent
        end

        # The font ascent in a vertical orientation.
        def vertical_ascent
            @core.vAscent
        end

        # The font descent in a horizontal orientation.
        def descent
            @core.descent
        end
        
        # The font descent in a vertical orientation.
        def vertical_descent
            @core.vDescent
        end

        # The line gap of the font.
        def line_gap
            @core.lineGap
        end

        # The distance between the baseline and the mean line of lower-case characters.
        def lower_height
            @core.xHeight
        end

        # The maximum height of a capital letter above the baseline.
        def capital_height
            @core.capHeight
        end

        # The underline position.
        def underline_position
            @core.underlinePosition
        end

        # The underline thickness.
        def underline_thickness
            @core.underlineThickness
        end

        # The strikethrough position.
        def strikethrough_position
            @core.strikethroughPosition
        end

        # The strikethrough thickness.
        def strikethrough_thickness
            @core.strikethroughThickness
        end
    end
end