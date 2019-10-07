function [M] = triangulat(Pr,Pl,Mr,Ml)


xr=Mr(1);
yr=Mr(2);

xl=Ml(1);
yl=Ml(2);

E=[(Pr(2,:)-yr*Pr(3,:));...
    (xr*Pr(3,:)-Pr(1,:));...
    (Pl(2,:)-yl*Pl(3,:));...
    (xl*Pl(3,:)-Pl(1,:))];

[~,~,H] = svd(E);

M=H(:,end);
end

