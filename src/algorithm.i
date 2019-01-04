%module algorithm

%{
#include <algorithm>
#include <numeric>
%}

%include <typemaps.i>

%apply (const SWIGTYPE *DATA, size_t SIZE) { (int *DATA, size_t SIZE) };
%apply (const SWIGTYPE *DATA, size_t SIZE) { (const double *DATA, size_t SIZE) };

%inline %{
template<class T>
void sort(T *DATA, size_t SIZE) {
  std::sort(DATA, DATA + SIZE);
}

template<class T>
T cpp_sum(const T *DATA, size_t SIZE) {
  return std::accumulate(DATA, DATA + SIZE, T(0));
}


template<class T>
int find_sorted(const T *DATA, size_t SIZE, T value) {
  int result = std::lower_bound(DATA, DATA + SIZE, value) - DATA;
  if (result == SIZE || DATA[result] != value) return 0;
  return result + 1;
}
%}

%template(sort)        sort<int>;
%template(cpp_sum)        cpp_sum<double>;
%template(find_sorted) find_sorted<int>;
