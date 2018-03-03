//---------------------------------*-SWIG-*----------------------------------//
/*!
 * \file   silo.i
 * \author Seth R Johnson
 * \date   Sun Nov 05 13:10:35 2017
 * \note   Copyright (c) 2017 Oak Ridge National Laboratory, UT-Battelle, LLC.
 */
//---------------------------------------------------------------------------//
%module silo

%{
#include <silo.h>
#include <stdlib.h>
%}

// Underscore prefixes are not allowed in Fortran (and technically are bad
// practice to use in C/C++ since they're reserved by the compiler); so replace
// with trailing underscores
%rename("%(regex:/^_(.*)/\\1_/)s") "";

// Declare all the things as structs
%fortran_bindc_struct(SWIGTYPE);
// Bind everything as C functions
%bindc %{%};

// Treat private structs as opaque pointers
%define %fortran_opaque_pointer(TYPE)
    %ignore #TYPE;
    %apply void* { TYPE* };
    %apply const void* { const TYPE* };
%enddef

%fortran_opaque_pointer(struct DBfile_pub);
%fortran_opaque_pointer(DBmrgtnode);
%fortran_opaque_pointer(DBmrgtree);
%fortran_opaque_pointer(DBmrgvar);
%fortran_opaque_pointer(DBgroupelmap);
%fortran_opaque_pointer(DBnamescheme);

// Hack to allow DBfile to be passed around as a pointer but ignore its
// contents
typedef void* DBfile_pub;

// Ignore weird callbacks
%rename("$ignore", regextarget=1) "^DB.*CB$";
// Ignore function that requires file
%ignore DBFilters;
// Ignore function that requires varargs
%ignore DBMakeNamescheme;
// Ignore unused constants
%ignore DB_F77NULL;
%ignore DB_F77NULLSTRING;
%ignore SILO_VSTRING_NAME;

// Generate inline functions that wrap the Silo macros DBOpen etc.
%ignore DBOpenReal;
%rename(DBOpen) DBOpen_;
%ignore DBCreateReal;
%rename(DBCreate) DBCreate_;
%ignore DBInqFileReal;
%rename(DBInqFile) DBInqFile_;
%inline %{
DBfile* DBOpen_(char const *name, int dbtype, int mode) {
    return DBOpen(name, dbtype, mode);
}
DBfile* DBCreate_(char const *name, int mode, int targ, char const *info, int dbtype) {
    return DBCreate(name, mode, targ, info, dbtype);
}
int DBInqFile_(char const *name) {
    return DBInqFile(name);
}
%}

// Clever workaround for necessary embedded 'sizeof'
%define sizeof(TYPE) sizeof_ ## TYPE %enddef
%define sizeof_double 8 %enddef

%include <stdint.i>
%include <silo_exports.h>
%include <silo.h>

//---------------------------------------------------------------------------//
// end of silo.i
//---------------------------------------------------------------------------//
