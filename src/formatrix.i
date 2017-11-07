%module formatrix

%{
#include "matrix.hh"
%}

%include <typemaps.i>

%fortran_view(int)
%fortran_view(double)

// As an alternative to adding a 'view' to the C++ class using std::pair, the
// following construction allows the output pointer
%feature("ftype") Matrix::get_columns_ptr %{
integer(C_INT), dimension(:), pointer
%}
%feature("fout") Matrix::get_columns_ptr %{
call c_f_pointer($1, $result, [self%row_nnz(row)])
%}


%include "matrix.hh"
