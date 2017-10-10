//---------------------------------*-C++-*-----------------------------------//
/*!
 * \file   _build_timer/timer.hh
 * \author Seth R Johnson
 * \date   Tue Oct 10 11:19:45 2017
 * \brief  timer class declaration.
 * \note   Copyright (c) 2017 Oak Ridge National Laboratory, UT-Battelle, LLC.
 *
 * This is just used to generate a working Fortran module because it's easier
 * to write a C++ header than an .f90 module.
 */
//---------------------------------------------------------------------------//

#ifndef _build_timer_timer_hh
#define _build_timer_timer_hh

class timer
{
  public:

    // Constructor should init system parameters
    timer();

    // Start timer
    void start();

    // Stop timer
    void stop();

    // Reset timer
    void reset();

    // Get wall time in seconds after stopping
    double walltime() const;

    // Get CPU time in seconds after stopping
    double cputime() const;
};

//---------------------------------------------------------------------------//
#endif // _build_timer_timer_hh

//---------------------------------------------------------------------------//
// end of _build_timer/timer.hh
//---------------------------------------------------------------------------//
