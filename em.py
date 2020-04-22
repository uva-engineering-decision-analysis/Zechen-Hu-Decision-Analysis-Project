import itertools
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.patches import Ellipse
from sklearn import mixture
from scipy import linalg
import matplotlib as mpl
import pandas as pd

color_iter = itertools.cycle(5*['navy', 'c', 'cornflowerblue', 'gold', 'darkorange'])

def plot_results(X, Y_, means, covariances, index, title):
    splot = plt.subplot()
    for i, (mean, covar, color) in enumerate(zip(
            means, covariances, color_iter)):
        v, w = linalg.eigh(covar)
        v = 2. * np.sqrt(2.) * np.sqrt(v)
        u = w[0] / linalg.norm(w[0])
        if not np.any(Y_ == i):
            continue
        plt.scatter(X[Y_ == i, 0], X[Y_ == i, 1], .8, color=color)

        # Plot an ellipse to show the Gaussian component
        angle = np.arctan(u[1] / u[0])
        angle = 180. * angle / np.pi  # convert to degrees
        ell = mpl.patches.Ellipse(mean, v[0], v[1], 180. + angle, color=color)
        ell.set_clip_box(splot.bbox)
        ell.set_alpha(0.5)
        splot.add_artist(ell)

    plt.title(title)

'''
# Samples Number
N = 300

# Generate random sample, five components
K = 25

true_Mu = np.array([[-2.5,2.5], [-4.0,-2.0], [2.0,-1.0], [0.1,0.2], [3.0,3.0]])
true_Cov = np.array([[[0.5,0.081],[0.081,0.7]], [[0.4,0.02],[0.002,0.3]], [[0.6,0.531],[0.531,0.9]], [[0.5,0.22],[0.22,0.8]], [[0.88,0.2],[0.2,0.22]]])

X1 = np.random.multivariate_normal(true_Mu[0], true_Cov[0], size = 60)
X2 = np.random.multivariate_normal(true_Mu[1], true_Cov[1], size = 60)
X3 = np.random.multivariate_normal(true_Mu[2], true_Cov[2], size = 60)
X4 = np.random.multivariate_normal(true_Mu[3], true_Cov[3], size = 60)
X5 = np.random.multivariate_normal(true_Mu[4], true_Cov[4], size = 60)

# data matrix
X = np.vstack((X1, X2, X3, X4, X5))
'''

df = pd.read_csv('Ttime.csv', 'w')
X = df[:, 1]

'''
#Initial Plot
plt.figure()
plt.scatter(X[:, 0], X[:, 1], .8)
plt.title("Initial scatter plot")
plt.show()
'''

# Fit a Gaussian mixture with EM.
#plt.figure()
gmm = mixture.GaussianMixture(n_components=2, covariance_type='full').fit(X)
#plot_results(X, gmm.predict(X), gmm.means_, gmm.covariances_, 0, 'Gaussian Mixture')
#plt.show()

