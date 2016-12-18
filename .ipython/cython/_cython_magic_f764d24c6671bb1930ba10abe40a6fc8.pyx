
import numpy as np
cimport numpy as np
from scipy.special import factorial

def sum_bayes_terms(double[::1] time, double[::1] cumcounts):
    cdef double  b = 0.0
    cdef double bi
    cdef long N = len(time)
    cdef long i
    cdef double prefactor
    cdef double C = cumcounts[-1]
    cdef double c1, c2, n1, n2, t1, t2
    
    prefactor = 2/np.pi * N**C / factorial(C-1) * 1 / (N - 1)
    for i in range(1, N):
        c1 = cumcounts[i-1]
        c2 = C - c1
        n1 = i
        n2 = N - i
        t1 = factorial(c1)*factorial(c2) / (n1**(c1+1) * n2**(c2+1))
        t2 = (c1/n1)**2 + (c2/n2)**2
        bi =  t1/t2
        b += bi
    
    return b*prefactor
