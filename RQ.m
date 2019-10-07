function [R,Q] = RQ(A)

[m,n]=size(A);

[Q,R]=qr(A(m:-1:1,n:-1:1)',0);
R=R(end:-1:1,end:-1:1)';
Q=Q(end:-1:1,end:-1:1)';

end

