import numpy as np
import matplotlib.pyplot as plt
import os, sys

dir = os.path.dirname(os.path.abspath(__file__))
arr = np.genfromtxt(dir + "/../logs/demo.log", delimiter=",", dtype=int)

y = arr[:,1:2]

plt.plot(y)
plt.savefig(sys.stdout.buffer, format='pdf')
