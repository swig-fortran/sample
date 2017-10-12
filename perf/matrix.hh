#ifndef MATRIX_H
#define MATRIX_H

#include <vector>

class Matrix {
public:
    Matrix(int nx, int ny);

    // Tester functions
    int num_rows() const {
        return row_ptrs.size()-1;
    }
    int num_nnz() const {
        return row_ptrs.back();
    }

    //! Get number of nonzeros in a row
    int row_nnz(int row) const {
        return row_ptrs[row+1] - row_ptrs[row];
    }

    // =============================================
    // Individual entry access
    // =============================================
    //! Get row column index (by offset)
    int get_column(int row, int col_offset) const {
        return col_inds[row_ptrs[row] + col_offset];
    }
    //! Get row value (by offset)
    double get_value(int row, int col_offset) const {
        return values[row_ptrs[row] + col_offset];
    }

    // =============================================
    // Full row access
    // =============================================
    //! Get row columns
    const int* get_columns(int row) const {
        return &col_inds[row_ptrs[row]];
    }
    //! Get row values
    const double* get_values(int row) const {
        return &values[row_ptrs[row]];
    }

    // =============================================
    // Full matrix access
    // =============================================
    // Get row pointers (array 1 of CRS)
    const int* get_row_ptrs() const {
        return row_ptrs.data();
    }
    // Get column indices (array 2 of CRS)
    const int* get_col_inds() const {
        return col_inds.data();
    }
    // Get values (array 3 of CRS)
    const double* get_values() const {
        return values.data();
    }

private:
    std::vector<int>    row_ptrs;
    std::vector<int>    col_inds;
    std::vector<double> values;
};

#endif // #define MATRIX_H
