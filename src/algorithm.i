//---------------------------------*-SWIG-*----------------------------------//
/*!
 * \file   algorithms/algorithm.i
 * \author Seth R Johnson
 * \date   Tue Dec 06 11:21:44 2016
 * \note   Copyright (c) 2016 Oak Ridge National Laboratory, UT-Battelle, LLC.
 */
//---------------------------------------------------------------------------//

%module algorithm

%{
#include "algorithm.hh"
%}

%include <std_except.i>

%exception {
    // Make sure no unhandled exceptions exist before performing a new action
    swig::fortran_check_unhandled_exception();
    try
    {
        // Attempt the wrapped function call
        $action
    }
    catch (const std::exception& e)
    {
        // Store a C++ exception
        SWIG_exception(SWIG_RuntimeError, e.what());
    }
    catch (...)
    {
        SWIG_exception(SWIG_UnknownError, "An unknown exception occurred");
    }
}

%include <typemaps.i>

%define TEMPLATE_ALGORITHMS(TYPE)
    %apply (SWIGTYPE* ARRAY, int SIZE) { (      TYPE* arr, int count),
                                         (const TYPE* arr, int count) }

    %template(shuffle)     shuffle< TYPE >;
    %template(sort)        sort< TYPE >;
    %template(reverse)     reverse< TYPE >;
    %template(find_sorted) find_sorted< TYPE >;
%enddef

%include "algorithm.hh"

TEMPLATE_ALGORITHMS(int)
TEMPLATE_ALGORITHMS(float)
TEMPLATE_ALGORITHMS(double)

//---------------------------------------------------------------------------//
// end of algorithms/algorithm.i
//---------------------------------------------------------------------------//
