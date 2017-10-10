//---------------------------------*-C++-*-----------------------------------//
/*!
 * \file   common/shuffle.hh
 * \author Seth R Johnson
 * \date   Tue Oct 10 12:19:21 2017
 * \brief  shuffle class declaration.
 * \note   Copyright (c) 2017 Oak Ridge National Laboratory, UT-Battelle, LLC.
 */
//---------------------------------------------------------------------------//

#ifndef common_shuffle_hh
#define common_shuffle_hh

// Initialize the RNG
void init_rng(int seed);

// Shuffle elements in the array using the global rng
template<class T>
void shuffle(T* arr, int count);

#endif // common_shuffle_hh

//---------------------------------------------------------------------------//
// end of common/shuffle.hh
//---------------------------------------------------------------------------//
