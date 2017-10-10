//---------------------------------*-SWIG-*----------------------------------//
/*!
 * \file   common/commonlib.i
 * \author Seth R Johnson
 * \date   Tue Oct 10 12:12:58 2017
 * \note   Copyright (c) 2017 Oak Ridge National Laboratory, UT-Battelle, LLC.
 */
//---------------------------------------------------------------------------//

%module commonlib

%include <typemaps.i>

//---------------------------------------------------------------------------//
// SHUFFLE
//---------------------------------------------------------------------------//
%{
#include "shuffle.hh"
%}

%define TEMPLATE_SHUFFLE(TYPE)
    %apply (SWIGTYPE* ARRAY, int SIZE) { (      TYPE* arr, int count),
                                         (const TYPE* arr, int count) }
    %template(shuffle)  shuffle< TYPE >;
%enddef

%include "shuffle.hh"

TEMPLATE_SHUFFLE(int)
TEMPLATE_SHUFFLE(float)
TEMPLATE_SHUFFLE(double)

//---------------------------------------------------------------------------//
// end of common/shuffle.i
//---------------------------------------------------------------------------//
