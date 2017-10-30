%module formatrix

%{
#include "matrix.hh"
%}

%include <typemaps.i>

%fortran_view(int)
%fortran_view(double)

%include "matrix.hh"
