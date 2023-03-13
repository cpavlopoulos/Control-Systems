s = tf('s')
G1 = 1 / ((2*s + 1)^3)
figure(1)
%step response tou anoixtou systhmatos
step (G1)      

%step response me monadiaia anadrash
figure(2)
G2 = G1 / (1+G1)
step (G2)







