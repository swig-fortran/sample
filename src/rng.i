%module rng

%include <typemaps.i>
%apply (SWIGTYPE *DATA, size_t SIZE) { (int *DATA, int SIZE) };

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
void shuffle(T *DATA, int SIZE) {
    std::shuffle(DATA, DATA + SIZE, *g_generator);
}

%}

%template(shuffle) shuffle<int>;
