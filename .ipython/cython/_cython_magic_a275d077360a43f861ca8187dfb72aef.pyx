
import numpy as np
cimport numpy as np

DTYPE = np.int

ctypedef np.int_t DTYPE_t

def in2d_cython(np.ndarray[DTYPE_t, ndim=2] arr1, 
                np.ndarray[DTYPE_t, ndim=2] arr2):
    
    cdef int n = arr1.shape[0]
    cdef int m = arr2.shape[0]
    cdef int i, j, t, r1, r2
   
    t = 0
    for i in range(n):
        a11 = arr1[i, 0]
        a12 = arr1[i, 1]
        for j in range(m):
            a21 = arr2[j, 0]
            a22 = arr2[j, 1]
            if a11==a21 and a12==a22:
                t = t + 1
                break
            else:
                pass
    return t == n
