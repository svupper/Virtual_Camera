clear all 
close all

debugr=1;
debugl=1;
D=imread('droitef.png');
G=imread('gauchef.png');

N=12;%nombre de point de calibration


%Image Droite
    [X2dr,X3dr] = calibD(D,debugr,N);

    Pr=DLT(X3dr,X2dr);

%test DLT

    errDLT(Pr,X3dr,X2dr,N,D);

%Image Gauche

    [X2dl,X3dl] = calibG(G,debugl,N);

    Pl=DLT(X3dl,X2dl);

%test DLT

    errDLT(Pl,X3dl,X2dl,N,G);

%triangulation

    Mr=X2dr(1,:);
    Ml=X2dl(1,:);

    Mr=Mr';
    Ml=Ml';

    M = triangulat(Pr,Pl,Mr,Ml);
    M = round(M/M(end));

%Decomposition RQ

    [K,Rt]=RQ(Pr(:,1:3));
    K=K./K(3,3);
    K(1,2)=0;                   %scew negligeable
    
    
