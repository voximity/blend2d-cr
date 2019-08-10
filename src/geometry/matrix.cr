include Blend2D::C

module Blend2D::Geometry
    enum MatrixOperation
        Reset
        Assign
        Translate
        Scale
        Skew
        Rotate
        RotatePoint
        Transform
        PostTranslate
        PostScale
        PostSkew
        PostRotate
        PostRotatePoint
        PostTransform
    end

    class Matrix
        @core = uninitialized LibBlend2D::BLMatrix2D

        def initialize
            @core = LibBlend2D::BLMatrix2D.new
        end

        protected def init_with_core(@core : LibBlend2D::BLMatrix2D)
        end

        protected def pointer
            pointerof(@core)
        end

        def finalize
        end

        def set_identity
            LibBlend2D.matrix_set_identity(pointer)
        end

        def set_translation(x : Float64, y : Float64)
            LibBlend2D.matrix_set_translation(pointer, x, y)
        end

        def set_scaling(x : Float64, y : Float64)
            LibBlend2D.matrix_set_scaling(pointer, x, y)
        end

        def set_skewing(x : Float64, y : Float64)
            LibBlend2D.matrix_set_skewing(pointer, x, y)
        end

        #def apply_operation(operation : MatrixOperation, **params)
        #    LibBlend2D.matrix_apply_op(pointer, operation, )
        #end

        def inversion : Matrix
            m = Matrix.allocate
            LibBlend2D.matrix_invert(out new_matrix, pointer)
            m.init_with_core new_matrix
            m
        end

        # get type

        # map point to array or w/e
    end
end