def set_trace():
    from IPython.core.debugger import Pdb
    import sys
    Pdb().set_trace(sys._getframe().f_back)

def fdebug(f, *args, **kwargs):
    from IPython.core.debugger import Pdb
    pdb = Pdb()
    return pdb.runcall(f, *args, **kwargs)
