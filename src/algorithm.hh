//---------------------------------*-C++-*-----------------------------------//
/*!
 * \file   algorithms/algorithm.hh
 * \author Seth R Johnson
 * \date   Tue Dec 06 11:21:58 2016
 * \brief  algorithm class declaration.
 * \note   Copyright (c) 2016 Oak Ridge National Laboratory, UT-Battelle, LLC.
 */
//---------------------------------------------------------------------------//

#ifndef algorithms_algorithm_hh
#define algorithms_algorithm_hh

#include <algorithm>
#include <utility>

//---------------------------------------------------------------------------//
// RANDOM INTERFACE
//---------------------------------------------------------------------------//

// Initialize the RNG
void init_rng(int seed);

// Shuffle elements in the array using the global rng
template<class T>
void shuffle(std::pair<T*, std::size_t> view);

//---------------------------------------------------------------------------//
// TEMPLATED ALGORITHMS
//---------------------------------------------------------------------------//
/*!
 * \brief Reverse the contents of an array in-place
 */
template<class T>
void reverse(std::pair<T*, std::size_t> view)
{
    std::reverse(view.first, view.first + view.second);
}

//---------------------------------------------------------------------------//
/*!
 * \brief Sort the contents of an array in-place
 */
template<class T>
void sort(std::pair<T*, std::size_t> view)
{
    std::sort(view.first, view.first + view.second);
}

//---------------------------------------------------------------------------//
/*!
 * \brief Do a binary search on a sorted array
 *
 * \return The fortran index (starts with 1) or zero if not found
 */
template<class T>
int find_sorted(std::pair<const T*, std::size_t> view, T val)
{
    const T* start = view.first;
    const T* stop  = view.first + view.second;
    const T* iter  = std::lower_bound(start, stop, val);
    if (iter == stop || *iter != val)
        return 0;

    // Add 1 to convert to Fortran index
    return (iter - start) + 1;
}

//---------------------------------------------------------------------------//
#endif // algorithms_algorithm_hh

//---------------------------------------------------------------------------//
// end of algorithms/algorithm.hh
//---------------------------------------------------------------------------//
