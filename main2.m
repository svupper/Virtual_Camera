clear all 
close all

radius=100;
aff=1;
debugg=1;

%Image virtuelle
Cath_3D=load('Cath_3D.mat');
Cath_3D=Cath_3D.Cath_3D_Pt_cloud;
Cath_3D=[Cath_3D, ones(length(Cath_3D),1)];
[nb_points,~]=size(Cath_3D);

if(aff)
    figure;
    plot3(Cath_3D(:,1),Cath_3D(:,2),Cath_3D(:,3),'bd');
    hold on;
end

%Construction de la trajectoire
    [Rx,T,n] = traj3D(radius,aff);
    
%Construction de K
I=imread('Camera_a.png');

[L,C]=size(I);


C=C/3;

C=720;
L=480;
F=13;

theta=deg2rad(45);
theta2=deg2rad(30);


c=2*(F*tan(theta/2));
l=2*(F*tan(theta2/2));

dy=c/C;
dx=l/L;

alpha_u=-dx/(10^-5);
alpha_v=dy/(10^-5);

u0=L/2;
v0=C/2;

K=[alpha_u 0 u0;...
    0 alpha_v v0;...
    0 0 1];

P=[];
for t=1:size(T,1)

    A=K*[inv(Rx(:,:,t)) -inv(Rx(:,:,t))*T(t,:)'];
    P(:,:,t)= A;

end


vid=VideoWriter('newfile.avi');
open(vid);

if(debugg)
    disp(size(I));
end

k=1;

for t=1:n
    Im=zeros(size(I));
    %Im=zeros(L,C);
    A=P(:,:,t)*Cath_3D';
    
    if(debugg)
        if(t==round(n/100*k))
            disp([num2str(k),'%']);
            k=k+1;
        end
        
    end
    
    for i=1:nb_points 
        A(:,i)=round(A(:,i)/A(3,i));
        if((A(1,i)>0) && (A(2,i)>0))
            Im(A(1,i),A(2,i))=1;
        end
    end
    
     Im=Im(1:L,1:C);
     writeVideo(vid,Im);

end

close(vid);
disp('terminé');