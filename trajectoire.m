clear all 
close all

center=[0 0 0];
normal=[0 0 1];
radius =3;

theta=0:0.1:2*pi;
%v=null(normal);
v=[1 0;0 1;0 0];
points=repmat(center',1,size(theta,2))+radius*(v(:,1)*cos(theta)+v(:,2)*sin(theta));

xt=points(1,:);
yt=points(2,:);
zt=points(3,:);

T0=[10 0 0];

R0=[cos(-pi/2) 0 -sin(-pi/2);...
    0 1 0;...
    sin(-pi/2) 0 cos(-pi/2)];

T=[xt' yt' zt'];
Rx=zeros(3,3,length(xt));

for t=1:length(xt)
        
    R=[1 0 0;...
    0 cos(theta(t)) -sin(theta(t));...
    0 sin(theta(t)) cos(theta(t))];

    Rx(:,:,t)=R0'*R;
end

%afficher toutes les rotations
if(aff)
    for t=1:5:length(xt)
        n=Rx(:,:,t)*[0;0;1];
        plot3(points(1,:),points(2,:),points(3,:),'r-');
        hold on;
        plot3([T(t,1) T(t,1)+n(1)],...
            [T(t,2) T(t,2)+n(2)],...
            [T(t,3) T(t,3)+n(3)],'g')

    end

    axis equal
    
end