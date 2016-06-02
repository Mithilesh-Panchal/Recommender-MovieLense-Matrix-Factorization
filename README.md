# Recommender-MovieLense-Matrix-Factorization

A Regularized Non Negative Matrix factorization technique used in Recommender System for MovieLense Dataset.

Algorithm Used:
-------------------------------------------------------------------------------------------------------------------------------
1. Input ← R, P, QT, I, K, α,β
2. Randomly generate an initial value from 0 to 1 for all values in P, QT
3. for step ← 1 to I 
4.  do for i ← 1 to len(R)
5.    do for j ← 1 to len(R[i]) 
6.      do First step is to compute the gradient eij between Rij and product of correlative column and row of the P and QT matrices
7.        if R[i, j] > 0
8.          then eij ← R[i, j]- Σ(k=1 to K) P[i,k] QT[k,j]
9.        After calculating the gradient, update the corresponding value of P,QT.
10.         for k ← 1 to K do
11.           P[i,k]← P[i,k] + α*(eij*QT[k,j] - β*P[i,k]);
12.           QT[k,j]← QT[k,j] + α*(eij* P[i,k] - β*QT[k,j]);

Compute MAE, Precision and Recall         

Repeat the above algorithm for many different values of parameters such as K=10,15 and 20, α=0.0001,0.00001 and β=0.02 and also the number of steps I=100+ and find the optimal values of MAE.
---------------------------------------------------------------------------------------------------------------------------

ML100 , ML200, ML300 indicates first 100, 200 and 300 users respectively in the MovieLens dataset.
