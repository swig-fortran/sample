//---------------------------------*-C++-*-----------------------------------//
/*!
 * \file   src/algorithm.cc
 * \author Seth R Johnson
 * \date   Tue Oct 10 12:19:21 2017
 * \brief  shuffle class definitions.
 * \note   Copyright (c) 2017 Oak Ridge National Laboratory, UT-Battelle, LLC.
 */
//---------------------------------------------------------------------------//

#include "shuffle.hh"

#include <cassert>
#include <random>
#include <algorithm>

namespace
{
//---------------------------------------------------------------------------//
// Global RNG
std::mt19937* g_generator = nullptr;
}

//---------------------------------------------------------------------------//
/*!
 * \brief Initialize the RNG
 */
void init_rng(int seed)
{
    delete g_generator;
    g_generator = new std::mt19937(seed);
}

//---------------------------------------------------------------------------//
/*!
 * \brief Shuffle elements in the array using the global rng
 */
template<class T>
void shuffle(T* arr, int count)
{
    assert(g_generator);
    std::shuffle(arr, arr + count, *g_generator);
}

//---------------------------------------------------------------------------//
// EXPLICIT INSTANTIATIONS
//---------------------------------------------------------------------------//
template void shuffle<float>(float*, int);
template void shuffle<double>(double*, int);
template void shuffle<int>(int*, int);

//---------------------------------------------------------------------------//
// end of src/algorithm.cc
//---------------------------------------------------------------------------//
