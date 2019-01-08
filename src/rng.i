%module rng

%include <typemaps.i>

%apply (SWIGTYPE *DATA, size_t SIZE) { (int    *DATA, size_t SIZE) };
%apply (SWIGTYPE *DATA, size_t SIZE) { (double *DATA, size_t SIZE) };

%{
#include <random>
#include <algorithm>
std::mt19937* g_generator = nullptr;
%}

%inline %{
void init_rng(int seed) {
    delete g_generator;
    g_generator = new std::mt19937(seed);
}

template<class T>
void shuffle(T *DATA, size_t SIZE) {
    std::shuffle(DATA, DATA + SIZE, *g_generator);
}

%}

%template(shuffle) shuffle<int>;
%template(shuffle) shuffle<double>;
