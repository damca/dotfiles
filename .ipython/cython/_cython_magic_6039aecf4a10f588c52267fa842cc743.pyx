import pandas as pd
import numpy as np

def footprint_cython(int image[:,::1], int threshold):
    b = image > threshold
    d = skimage.morphology.disk(4)
    r = skimage.morphology.erosion(b, d)
    r = scipy.sparse.coo_matrix(r)
    return r
