function [] = errDLT(Pl,X3dl,X2dl,N,G)

El=Pl*X3dl';

for i=1:N
   El(:,i)=El(:,i)./El(end,i); 
end

El=El';

%calcul erreur

for i=1:N
    moyl(i)=norm(El(i)-X2dl(i));
end

er=num2str(mean(moyl));
disp(['Erreur de calibrage : ' er]);

figure();
imshow(G);
hold on;
plot(El(:,1),El(:,2),'b*');


end

