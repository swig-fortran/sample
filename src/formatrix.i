%module formatrix

%{
#include "matrix.hh"
%}

%include <typemaps.i>

%fortran_view(int)
%fortran_view(double)

// As an alternative to adding a 'view' to the C++ class using std::pair, the
// following construction allows the output pointer
%typemap("ftype") int const *get_columns_ptr
%{integer(C_INT), dimension(:), pointer%}
%typemap("fout") int const *get_columns_ptr
  "call c_f_pointer($1, $result, [self%row_nnz(row)])"

// Overwrite typemap generation to bypass nonnull(self) class pointer check
// that is quite expensive
%typemap(in, noblock=1) SWIGTYPE *self, const SWIGTYPE *self {
  $1 = %static_cast($input->cptr, $1_ltype);
}


%include "matrix.hh"
