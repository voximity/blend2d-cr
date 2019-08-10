module Blend2D
    abstract class BLStructure

        abstract def initialize

        abstract def pointer : Pointer

        # Called then Crystal's garbage collector collects this instance.
        abstract def finalize
        
    end
end