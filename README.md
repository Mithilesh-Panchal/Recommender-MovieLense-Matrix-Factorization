# Recommender-MovieLense-Matrix-Factorization

A Regularized Non Negative Matrix factorization technique used in Recommender System for MovieLense Dataset.

Algorithm Used:
-------------------------------------------------------------------------------------------------------------------------------
Input ← R, P, QT, I, K, α,β
Randomly generate an initial value from 0 to 1 for all values in P, QT
for step ← 1 to I 
  do for i ← 1 to len(R) 
    do for j ← 1 to len(R[i]) do
      First step is to compute the gradient eij between Rij and product of correlative column and row of the P and QT matrixes
        if R[i, j] > 0 
          then eij ← R[i, j]- Σ(k=1 to K) P[i,k] QT[k,j]
        After calculating the gradient, update the corresponding value of P,QT. 
        for k ← 1 to K do
          P[i,k]← P[i,k] + α*(eij*QT[k,j] - β*P[i,k]);
          QT[k,j]← QT[k,j] + α*(eij* P[i,k] - β*QT[k,j]);

Compute MAE, Precision and Recall         

Repeat the above algorithm for many different values of parameters such as K=10,15 and 20, α=0.0001,0.00001 and β=0.02 and also the number of steps I=100+ and find the optimal values of MAE.
----------------------------------------------------------------------------------------------------------------------------------
