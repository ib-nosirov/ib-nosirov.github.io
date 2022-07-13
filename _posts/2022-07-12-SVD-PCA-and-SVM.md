---
title: "SVD, PCA, and SVM"
mathjax: true
layout: post
---
These are some rough notes I am writing for personal use/later revision ONLY.
None of this information is in any way verified, or correct... probably.

## Singular Value Decomposition
This is a good way of representing a matrix that gives us insight into the
range, null space, rank, and 2-norm condition number. Geometrically, the SVD
posits that any matrix can be broken down into a rotation, a stretch, and a
rotation, in that order. Furthermore, for any matrix $$A$$, writing out
$$A^\top A$$ and $$AA^\top$$ in terms of the SVD of $$A$$ yields the
eigendecomposition of $$A^\top A$$ and $$AA^\top$$, respectively. Hence, the
eigenvectors of $$A^\top A$$ and $$AA^\top$$ make up the $$U$$ and $$V$$
vectors, respectively. 

Also, taking the first column of $$U$$, the first eigenvalue in $$\Sigma$$, and
the first row of $$V^\top$$ gives us a rank 1 matrix (column rank and row rank
are both 1, since they must be equal) with the greatest variance.

## Principal Components Analysis
Supposing we have a set of vectors, the PCA algorithm follows:
1. Find mean vector.
2. Create a mean-adjusted (subtract mean vector from every data vector) matrix,
$$S_{mean}$$.
3. Compute a covariance matrix, $$Cov_{i,j} = (S_i-\bar{S})(S_j-\bar{S})$$
where $$\bar{S}$$ is the mean vector and $$S$$ is some vector in the set.
4. Compute the SVD of the covariance matrix. The rows of $$V^\top$$ are the
principal axes and the columns of $$U\Sigma$$ contain the principal scores.

## Support Vector Machine (Linear)
Support vectors are points in the data that, if removed, would change the
hyperplane. We use these support vectors in a constrained optimization problem
to define a separating hyperplane. In fact, we first define to two hyperplanes
(aka. the margins) such that:

$$wx_i+b \geqslant 1$$ when $$y_i = 1,$$

$$wx_i+b \geqslant -1$$ when $$y_i = -1.$$

A key feature of these margins, which we incorporate more explicitly below, is
that no points can exist within the the boundaries of the margins. It follows
that the median of these hyperplanes is the separating hyperplane with the
maximum distance between any two members of different groups.

This is done using a constrained optimization problem. It is defined as
follows:

$$\min f: \frac{1}{2} \|w\|^2$$ s.t. $$g: y_i(wx_i)-b=1.$$

We solve this using the Lagrangian Dual Problem.

## Support Vector Machine (Non-Linear)
Realize that the dual problem involves computing inner products and that
kernels are, by definition, inner products in a reproducing kernel Hilbert
space. Hence, we just compute the feature map of each vector and compute inner
products just as in the linear case.

