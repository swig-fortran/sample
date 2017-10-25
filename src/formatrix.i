%module formatrix

%{
#include "matrix.hh"
%}

%include <typemaps.i>

%fort_view_typemap(int)
%fort_view_typemap(double)

%include "matrix.hh"
