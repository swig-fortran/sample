#include "matrix.hh"

//    -1
// -1  4 -1
//    -1
void get_2d_neighbors(int index, int nx, int ny, int& left, int& right, int& lower, int& upper);

Matrix::Matrix(int nx, int ny) {
    int num_rows = nx*ny;
    int nnz_est  = 5*num_rows;

    row_ptrs.resize(num_rows+1);
    col_inds.resize(nnz_est);
    values  .resize(nnz_est);

    int center, left, right, lower, upper, ind = 0;

    row_ptrs[0] = 0;
    for (int i = 0; i < num_rows; i++) {
        center = i;

        get_2d_neighbors(center, nx, ny, left, right, lower, upper);

        if (lower != -1) { col_inds[ind] = lower; values[ind++] = -1; }
        if (left  != -1) { col_inds[ind] = left;  values[ind++] = -1; }

        col_inds[ind] = center; values[ind++] = 4;

        if (right != -1) { col_inds[ind] = right; values[ind++] = -1; }
        if (upper != -1) { col_inds[ind] = upper; values[ind++] = -1; }

        row_ptrs[i+1] = ind;
    }
    col_inds.resize(ind);
    values  .resize(ind);
}

void get_2d_neighbors(int i, int nx, int ny, int& left, int& right, int& lower, int& upper) {
    int ix, iy;
    ix = i % nx;
    iy = (i - ix) / nx;

    if (ix == 0)      left  = -1;
    else              left  = i - 1;
    if (ix == nx - 1) right = -1;
    else              right = i + 1;
    if (iy == 0)      lower = -1;
    else              lower = i - nx;
    if (iy == ny - 1) upper = -1;
    else              upper = i + nx;
}
