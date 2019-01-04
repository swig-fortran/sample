//---------------------------------*-SWIG-*----------------------------------//
/*!
 * \file   utils.i
 * \author Seth R Johnson
 * \date   Fri Mar 02 09:36:01 2018
 * \note   Copyright (c) 2018 Oak Ridge National Laboratory, UT-Battelle, LLC.
 */
//---------------------------------------------------------------------------//

%module utils

%{
#include <chrono>
#include <thread>
#include <stdexcept>
%}

%inline %{
void msleep(int ms) {
    if (ms < 0)
        throw std::domain_error("Invalid sleep time");
    std::this_thread::sleep_for(std::chrono::milliseconds(ms));
}
%}

//---------------------------------------------------------------------------//
// end of utils.i
//---------------------------------------------------------------------------//
