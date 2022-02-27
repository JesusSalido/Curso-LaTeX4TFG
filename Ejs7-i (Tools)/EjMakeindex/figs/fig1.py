import numpy as np
import matplotlib.pyplot as plt
import os


plt.rc('text', usetex=True)
plt.rc('font', family='serif')
plt.figure(1, figsize=(6, 4))
ax = plt.axes([0.1, 0.1, 0.8, 0.7])
t = np.linspace(0.0, 1.0, 100)
s = np.cos(4 * np.pi * t) + 2
plt.plot(t, s)

plt.xlabel(r'\textbf{time (s)}', fontsize=11)
plt.ylabel(r'\textit{voltage (mV)}', fontsize=11)
plt.title(r"\TeX\ is Number $\displaystyle\sum_{n=1}^\infty"
          r"\frac{-e^{i\pi}}{2^n}$!", fontsize=11, color='r')
plt.grid(True)
file = 'fig1_py.pdf'  # Nombre del fichero
plt.savefig(file)  # Salva la imagen en PDF
os.system('pdfcrop ' + file + ' ' + file)  # Recorta el fichero PDF para ajustar el BB
plt.show()
