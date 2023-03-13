figure(1)
num=[1]
den=[0.3 1]
H1 = tf(num,den)
s = tf('s')
tr=0:0.01:20
subplot(131), step(H1)
subplot(132), impulse(H1)
subplot(133), step(H1/s,tr)     %ramp equation 1/s
title('Ramp Response')


figure(2)
H2 = 1 / ((0.3*s+1)^2)
subplot(131), step(H2)
subplot(132), impulse(H2)
subplot(133), step(H2/s,tr)
title('Ramp Response')


figure(3)
H31 = 1 / ((0.1*s+1)^2)
H32 = 1 / ((0.5*s+1)^2)
H33 = 1 / ((s+1)^2)
t32=0:0.1:6
t33=0:0.1:12
subplot(131), step(H31)
subplot(132), step(H32,t32)
subplot(133), step(H33,t33)


figure(4)
H41 = 1 / ((0.1*s+1)*(0.5*s+1))
H42 = 1 / ((0.4*s+1)*(2*s+1))
H43 = 1 / ((s+1)*(5*s+1))
t41=0:0.1:5
t42=0:0.1:18
t43=0:0.1:45
subplot(131), step(H41,t41)
subplot(132), step(H42,t42)
subplot(133), step(H43,t43)


figure(5)
H5 = 1 / ((0.1*s+1)*(10*s+1))
step(H5)


figure(6)
H61 = 1 / ((0.1*s+1)^4)
H62 = 1 / ((0.5*s+1)^4)
H63 = 1 / ((s+1)^4)
t63=0:0.1:18
subplot(131), step(H61)
subplot(132), step(H62)
subplot(133), step(H63,t63)

figure(7)
H711 = 1 / (0.5*s+1)
H712 = 1 / ((0.1*s+1)^3)
H71 = H711 * H712
H721 = 1 / (2.5*s+1)
H722 = 1 / ((0.5*s+1)^3)
H72 = H721 * H722
subplot(211), step(H71)
subplot(212), step(H72)


