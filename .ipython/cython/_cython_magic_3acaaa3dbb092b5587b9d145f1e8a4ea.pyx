import pandas as pd
import numpy as np
import scipy.sparse
import skimage.morphology

def footprint_cython(int[:,::1] image, int threshold):
    b = image > threshold
    d = skimage.morphology.disk(4)
    r = skimage.morphology.erosion(b, d)
    r = scipy.sparse.coo_matrix(r)
    return r
