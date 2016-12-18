
import numpy as np
cimport numpy as np


def sum(unsigned long[::1] a):
    cdef double s = 0.0
    cdef int i, n = a.shape[0]
    for i in range(n):
        s += a[i]
    return s
