function [X2dl,X3dl] = calibG(G,debugl,N)
if(debugl)
    X2dl=[708.667279411765 236.470588235294;...
        666.416053921569 251.166666666667;...
        614.979779411765 265.862745098040;...
        567.217524509804 282.395833333334;...
        982.381740196079 232.796568627451;...
        1035.65502450980 241.981617647059;...
        1094.43933823529 256.677696078432;...
        1156.89767156863 275.047794117647;...
        1177.10477941176 798.595588235294;...
        1147.71262254902 833.498774509804;...
        1116.48345588235 864.727941176471;...
        1079.74325980392 903.305147058824];
        
        X2dl=[X2dl ones(N,1)];
    
else
    figure;
    imshow(G);
    hold on;
    X2dl=ginput(N);
    X2dl=[X2dl ones(N,1)];
    
end

figure(3);
imshow(G);
hold on;
plot(X2dl(:,1),X2dl(:,2),'r*');

X3dl=[3 0 8;...
    4 0 8;...
    5 0 8;...
    6 0 8;...
    0 3 8;...
    0 4 8;...
    0 5 8;...
    0 6 8;...
    1 8 0;...
    2 8 0;...
    3 8 0;...
    4 8 0;];
X3dl=[X3dl ones(N,1)];

end

