
import numpy as np
cimport numpy as np

DTYPE = np.int

ctypedef np.int_t DTYPE_t

def in2d_cython(np.ndarray[DTYPE_t, ndim=2] arr1, 
                np.ndarray[DTYPE_t, ndim=2] arr2, 
                int n, 
                int m):
    
    cdef int i, j, a11, a12, a21, a22, row_in, col_in, isin
   
    for i in range(n):
        a11 = arr1[i, 0]
        a12 = arr1[i, 1]
        for j in range(m):
            a21 = arr2[j, 0]
            a22 = arr2[j, 1]
            if a11==a21 and a12==a22:
                return True
            else:
                pass
    return False
            
