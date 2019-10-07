function [M] = DLT(X,Xp)
%DLT Summary of this function goes here
%   Detailed explanation goes here

[m,n]=size(X);
A=[];    


for i=1:m

    x=Xp(i,1);
    y=Xp(i,2);
    z=Xp(i,3);

    Ai=[zeros(1,n), -z*X(i,:), y*X(i,:);...
        z*X(i,:), zeros(1,n), -x*X(i,:)];
    
    A=[A;Ai];
end
    
[~,~,V]=svd(A);

M=[V(1:n,end)';V(n+1:2*n,end)';V(2*n+1:3*n,end)'];







end
