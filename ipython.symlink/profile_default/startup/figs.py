import matplotlib.pyplot as plt

def move_figure():
    '''
    Move and resize a window to a set of standard positions on the screen.
    Possible positions are:
    top, bottom, left, right, top-left, top-right, bottom-left, bottom-right
    '''
    mgr = plt.get_current_fig_manager()
    x, y, w, h = mgr.window.geometry().getRect()
    d = 10  # width of the window border in pixels
    mgr.window.setGeometry(d, d, w+d, h+d)

