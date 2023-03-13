%1o erwthma
t=0:0.1:160;
s=tf('s');
Gs=0.75/(308*s^2+35.15*s+1); %synarthsh metaforas gia T1=18.5,T2=16.65
u = ones(length(t),1);
u(t>0 & t<=160)=3;
figure(1)
lsim(Gs,u,t);
axis([0 200 -10 10])
title('Vim apokr anoixtou systhmatos me Ks=0.75,T1=18.5,T2=16.65')

Gs2=0.75/(400*s^2+50*s+1);      %synarthsh metaforas gia T1=10,T2=40
figure(2)
lsim(Gs2,u,t);
axis([0 200 -10 10])
title('Vim apokr anoixtou systhmatos me Ks=0.75,T1=10,T2=40')


%2o erwthma
%P/CHR/20%overshoot/ref
Ks = 0.75; Tu = 5; Tg = 50;
Gs=0.75/(308*s^2+35.15*s+1)     %synarthsh metaforas
KP = (0.7/Ks).*(Tg/Tu) ;
P=pidstd(KP);
t = linspace(0,300,10000);
u0 = square(0.02*t+157);
u=0.5*u0+5.5;
skleistoubroxou=feedback(P*Gs,1);
figure(3)
lsim(skleistoubroxou,u,t);
axis([0 900 0 10])
title('Vim apokr P/CHR/20% overshoot/ref');


%PI/CHR/20%overshoot/ref
KPI = (0.6/Ks).*(Tg/Tu) ;
TiPI = Tg; 
PI=pidstd(KPI,TiPI);
skleistoubroxou=feedback(PI*Gs,1);
figure(4)
lsim(skleistoubroxou,u,t);
axis([0 900 0 10]);
title('Vim apokr PI/CHR/20% overshoot/ref');


%PID/CHR/20%overshoot/ref
KPID = (0.95/Ks).*(Tg/Tu) ;
TiPID =  1.4.*Tg; 
TdPID = 0.47.*Tu;
PID=pidstd(KPID,TiPID,TdPID);
skleistoubroxou=feedback(PID*Gs,1);
figure(5)
lsim(skleistoubroxou,u,t);
axis([0 900 0 10]);
title('Vim apokr PID/CHR/20% overshoot/ref');

%ypologismos sfalmatos
A=norm(u,inf);
et=A/(1+(PID*Gs));  
[y,tOut] = step(et);

%ypologismos tetargwnoy sfalmatos
et_sq=y.*y;


%ypologismos ISE 
integral=zeros(size(tOut));     
prev_integra1=zeros(size(tOut));
sum=zeros(size(tOut));
%xrisimopoioume dyo for wste na parasthsoume ton orismo
%tou oloklhromatos kai na paroume to epithimito apotelesma
 for i=2:length(tOut)
     integral(1)= 0;
     integral(i)=et_sq(i)*(tOut(i)-tOut(i-1));
 end

 for i=2:length(integral)
   sum(1)=0;
   prev_integra1(i)=sum(i-1);
   sum(i)=prev_integra1(i)+integral(i);    
 end

%vriskoume thn pio kontinh timh sthn timh apokatastashs  
figure(6)
plot(tOut,sum);
pos=find(tOut<=Tg);
ise=max(pos);         
ISE= sum(ise); 
title('ISE')

%Ypologismos ITSE me idio tropo
integral=zeros(size(tOut));
prev_integra1=zeros(size(tOut));
sum=zeros(size(tOut));
 
 for i=2:length(tOut)
     integral(1)= 0;
     integral(i)=i*et_sq(i)*(tOut(i)-tOut(i-1));
 end

 for i=2:length(integral)
   sum(1)=0;
   prev_integra1(i)=sum(i-1);
   sum(i)=prev_integra1(i)+integral(i);    
 end
 
figure(7)
plot(tOut,sum);
pos=find(tOut<=Tg);
itse=max(pos);         
ITSE= sum(itse);
title('ITSE')


%P/CHR/20%overshoot/ref me T1 = 10, T2 = 40
Ks = 0.75; Tu = 5; Tg = 50;
Gs2=0.75/(400*s^2+50*s+1);      %synarthsh metaforas
KP2 = (0.7/Ks).*(Tg/Tu) ;
P2=pidstd(KP2);
t = linspace(0,300,10000);
u0 = square(0.02*t+157);
u=0.5*u0+5.5;
skleistoubroxou=feedback(P2*Gs2,1);
figure(8)
lsim(skleistoubroxou,u,t);
axis([0 900 0 10])
title('Vim apokr P/CHR/20% overshoot/ref me T1=10, T2=40');

%PI/CHR/20%overshoot/ref me T1 = 10, T2 = 40
KPI2 = (0.6/Ks).*(Tg/Tu) ;
TiPI2 = Tg; 
PI2=pidstd(KPI2,TiPI2);
skleistoubroxou=feedback(PI2*Gs2,1);
figure(9)
lsim(skleistoubroxou,u,t);
axis([0 900 0 10]);
title('Vim apokr PI/CHR/20% overshoot/ref me T1 = 10, T2 = 40');

%PID/CHR/20%overshoot/ref me T1 = 10, T2 = 40
KPID2 = (0.95/Ks).*(Tg/Tu) ;
TiPID2 =  1.4.*Tg; 
TdPID2 = 0.47.*Tu;
PID2=pidstd(KPID2,TiPID2,TdPID2);
skleistoubroxou=feedback(PID2*Gs2,1);
figure(10)
lsim(skleistoubroxou,u,t);
axis([0 900 0 10]);
title('Vim apokr PID/CHR/20% overshoot/ref me T1 = 10, T2 = 40');


%ypologismos sfalmatos
A=norm(u,inf);
et=A/(1+(PID2*Gs2));           

%ypologismos tetargwnoy sfalmatos
et_sq=y.*y;             

%ypologismos ISE 
integral=zeros(size(tOut));     
prev_integra1=zeros(size(tOut));
sum=zeros(size(tOut));
%xrisimopoioume dyo for wste na parasthsoume ton orismo
%tou oloklhromatos kai na paroume to epithimito apotelesma
 for i=2:length(tOut)
     integral(1)= 0;
     integral(i)=et_sq(i)*(tOut(i)-tOut(i-1));
 end

 for i=2:length(integral)
   sum(1)=0;
   prev_integra1(i)=sum(i-1);
   sum(i)=prev_integra1(i)+integral(i);    
 end

%vriskoume thn pio kontinh timh sthn timh apokatastashs  
figure(11)
plot(tOut,sum);
pos=find(tOut<=Tg);
ise=max(pos);         
ISE= sum(ise); 
title('ISE')

%Ypologismos ITSE me idio tropo
integral=zeros(size(tOut));
prev_integra1=zeros(size(tOut));
sum=zeros(size(tOut));
 
 for i=2:length(tOut)
     integral(1)= 0;
     integral(i)=i*et_sq(i)*(tOut(i)-tOut(i-1));
 end

 for i=2:length(integral)
   sum(1)=0;
   prev_integra1(i)=sum(i-1);
   sum(i)=prev_integra1(i)+integral(i);    
 end
 
figure(12)
plot(tOut,sum);
pos=find(tOut<=Tg);
itse=max(pos);         
ITSE= sum(itse);
title('ITSE')


%3o erwthma
%PID/CHR/0%/Disturbance 
Ks = 0.75; Tu = 5; Tg = 50;
Gs=0.75/(308*s^2+35.15*s+1);        %synarthsh metaforas
KP01= (0.95/Ks).*(Tg/Tu) ;
TiP01 =  2.4.*Tg; 
TdP01 = 0.42.*Tu;
[u0,t] = gensig('square',600,900);
u=2*u0+6;
u0 = square(0.02*t);
PID=pidstd(KP01,TiP01,TdP01);
skleistoubroxou=feedback(PID*Gs,1);
figure(13)
lsim(skleistoubroxou,u,t);
axis([0 890 0 10]);
title('Vim apokr PID/CHR/0% disturbance/ref');

%ypologismos sfalmatos
A=norm(u,inf);
et=A/(1+(PID*Gs));           

%ypologismos tetargwnoy sfalmatos
et_sq=y.*y;             

%ypologismos ISE 
integral=zeros(size(tOut));     
prev_integra1=zeros(size(tOut));
sum=zeros(size(tOut));
%xrisimopoioume dyo for wste na parasthsoume ton orismo
%tou oloklhromatos kai na paroume to epithimito apotelesma
 for i=2:length(tOut)
     integral(1)= 0;
     integral(i)=et_sq(i)*(tOut(i)-tOut(i-1));
 end

 for i=2:length(integral)
   sum(1)=0;
   prev_integra1(i)=sum(i-1);
   sum(i)=prev_integra1(i)+integral(i);    
 end

%vriskoume thn pio kontinh timh sthn timh apokatastashs  
figure(14)
plot(tOut,sum);
pos=find(tOut<=Tg);
ise=max(pos);         
ISE= sum(ise); 
title('ISE')

%Ypologismos ITSE me idio tropo
integral=zeros(size(tOut));
prev_integra1=zeros(size(tOut));
sum=zeros(size(tOut));
 
 for i=2:length(tOut)
     integral(1)= 0;
     integral(i)=i*et_sq(i)*(tOut(i)-tOut(i-1));
 end

 for i=2:length(integral)
   sum(1)=0;
   prev_integra1(i)=sum(i-1);
   sum(i)=prev_integra1(i)+integral(i);    
 end
 
figure(15)
plot(tOut,sum);
pos=find(tOut<=Tg);
itse=max(pos);         
ITSE= sum(itse);
title('ITSE')


%PID/CHR/0%/Disturbance me T1 = 10, T2 = 40
Ks = 0.75; Tu = 5; Tg = 50;
Gs2=0.75/(400*s^2+50*s+1);          %synarthsh metaforas
KP02= (0.95/Ks).*(Tg/Tu) ;
TiP02 =  2.4.*Tg; 
TdP02 = 0.42.*Tu;
[u0,t] = gensig('square',600,900);
u=2*u0+6;
u0 = square(0.02*t);
PID=pidstd(KP02,TiP02,TdP02);
skleistoubroxou=feedback(PID2*Gs2,1);
figure(16)
lsim(skleistoubroxou,u,t);
axis([0 890 0 10]);
title('Vim apokr PID/CHR/0% disturbance/ref me T1 = 10, T2 = 40');

%ypologismos sfalmatos
A=norm(u,inf);
et=A/(1+(PID2*Gs2));          

%ypologismos tetargwnoy sfalmatos
et_sq=y.*y;             

%ypologismos ISE 
integral=zeros(size(tOut));     
prev_integra1=zeros(size(tOut));
sum=zeros(size(tOut));
%xrisimopoioume dyo for wste na parasthsoume ton orismo
%tou oloklhromatos kai na paroume to epithimito apotelesma
 for i=2:length(tOut)
     integral(1)= 0;
     integral(i)=et_sq(i)*(tOut(i)-tOut(i-1));
 end

 for i=2:length(integral)
   sum(1)=0;
   prev_integra1(i)=sum(i-1);
   sum(i)=prev_integra1(i)+integral(i);    
 end

%vriskoume thn pio kontinh timh sthn timh apokatastashs  
figure(17)
plot(tOut,sum);
pos=find(tOut<=Tg);
ise=max(pos);         
ISE= sum(ise); 
title('ISE')

%Ypologismos ITSE me idio tropo
integral=zeros(size(tOut));
prev_integra1=zeros(size(tOut));
sum=zeros(size(tOut));
 
 for i=2:length(tOut)
     integral(1)= 0;
     integral(i)=i*et_sq(i)*(tOut(i)-tOut(i-1));
 end

 for i=2:length(integral)
   sum(1)=0;
   prev_integra1(i)=sum(i-1);
   sum(i)=prev_integra1(i)+integral(i);    
 end
 
figure(18)
plot(tOut,sum);
pos=find(tOut<=Tg);
itse=max(pos);         
ITSE= sum(itse);
title('ITSE')


%4o erwthma
%P/Tsum
Ks = 0.75; Tu = 5; Tg = 50;
T1 = 18.5;
T2 = 16.65;
Gs=0.75/(308*s^2+35.15*s+1);            %synarthsh metaforas
Tsum=T1+T2;
KT=(1/Ks);
PT=pidstd(KT);
skleistoubroxou_T=feedback(PT*Gs,1);
t = linspace(0,300,10000);
u0 = square(0.02*t+157);
u=0.5*u0+5.5;
figure(19)
lsim(skleistoubroxou_T,u,t);
axis([0 900 0 10])
title('Vimatikh apokrish P/Tsum');

%PI tsum
KT= (0.5/Ks); 
TiT = 0.5 * Tsum ;
PIT=pidstd(KT,TiT);
skleistoubroxou_T=feedback(PIT*Gs,1);
figure(20)
lsim(skleistoubroxou_T,u,t);
axis([0 900 0 10])
title('Vimatikh apokrish PI/Tsum');

%PID tsum
KT= (1/Ks); 
TiT = 0.66 * Tsum;
TdT = 0.17 * Tsum;
PIDT=pidstd(KT,TiT);
skleistoubroxou_T=feedback(PIDT*Gs,1);
figure(21)
lsim(skleistoubroxou_T,u,t);
axis([0 900 0 10])
title('Vimatikh apokrish PID/Tsum');

%ypologismos sfalmatos
A=norm(u,inf);
et=A/(1+(PIDT*Gs));           

%ypologismos tetargwnoy sfalmatos
et_sq=y.*y;             

%ypologismos ISE
integral=zeros(size(tOut));      
prev_integra1=zeros(size(tOut));
sum=zeros(size(tOut));
%xrisimopoioume dyo for wste na parasthsoume ton orismo
%tou oloklhromatos kai na paroume to epithimito apotelesma
 for i=2:length(tOut)
     integral(1)= 0;
     integral(i)=et_sq(i)*(tOut(i)-tOut(i-1));
 end

 for i=2:length(integral)
   sum(1)=0;
   prev_integra1(i)=sum(i-1);
   sum(i)=prev_integra1(i)+integral(i);    
 end

%vriskoume thn pio kontinh timh sthn timh apokatastashs  
figure(17)
plot(tOut,sum);
pos=find(tOut<=Tg);
ise=max(pos);         
ISE= sum(ise); 
title('ISE')

%Ypologismos ITSE me idio tropo
integral=zeros(size(tOut));
prev_integra1=zeros(size(tOut));
sum=zeros(size(tOut));
 
 for i=2:length(tOut)
     integral(1)= 0;
     integral(i)=i*et_sq(i)*(tOut(i)-tOut(i-1));
 end

 for i=2:length(integral)
   sum(1)=0;
   prev_integra1(i)=sum(i-1);
   sum(i)=prev_integra1(i)+integral(i);    
 end
 
figure(18)
plot(tOut,sum);
pos=find(tOut<=Tg);
itse=max(pos);         
ITSE= sum(itse);
title('ITSE')

%P/Tsum me T1=10, T2=40
Ks = 0.75; Tu = 5; Tg = 50;
T11=10;
T22=40;
Gs2=0.75/(400*s^2+50*s+1);          %synarthsh metaforas
Tsum2=T11+T22;
KT2=(1/Ks);
PT2=pidstd(KT2);
skleistoubroxou_T2=feedback(PT2*Gs2,1);
t = linspace(0,300,10000);
u0 = square(0.02*t+157);
u=0.5*u0+5.5;
figure(24)
lsim(skleistoubroxou_T2,u,t);
axis([0 900 0 10])
title('Vimatikh apokrish P/Tsum me T1 = 10, T2 = 40');

%PI/Tsum me T1=10, T2=40
KT2= (0.5/Ks); 
TiT2 = 0.5 * Tsum2 ;
PIT2=pidstd(KT2,TiT2);
skleistoubroxou_T2=feedback(PIT2*Gs2,1);
figure(25)
lsim(skleistoubroxou_T2,u,t);
axis([0 900 0 10])
title('Vimatikh apokrish PI/Tsum me T1 = 10, T2 = 40');

%PID/Tsum me T1=10, T2=40
KT2= (1/Ks); 
TiT2 = 0.66 * Tsum2;
TdT2 = 0.17 * Tsum2;
PIDT2=pidstd(KT2,TiT2);
skleistoubroxou_T2=feedback(PIDT2*Gs2,1);
figure(26)
lsim(skleistoubroxou_T2,u,t);
axis([0 900 0 10])
title('Vimatikh apokrish PID/Tsum me T1 = 10, T2 = 40');

%ypologismos sfalmatos
A=norm(u,inf);
et=A/(1+(PIDT2*Gs2));           

%ypologismos tetargwnoy sfalmatos
et_sq=y.*y;             

%ypologismos ISE
integral=zeros(size(tOut));      
prev_integra1=zeros(size(tOut));
sum=zeros(size(tOut));
%xrisimopoioume dyo for wste na parasthsoume ton orismo
%tou oloklhromatos kai na paroume to epithimito apotelesma
 for i=2:length(tOut)
     integral(1)= 0;
     integral(i)=et_sq(i)*(tOut(i)-tOut(i-1));
 end

 for i=2:length(integral)
   sum(1)=0;
   prev_integra1(i)=sum(i-1);
   sum(i)=prev_integra1(i)+integral(i);    
 end

%vriskoume thn pio kontinh timh sthn timh apokatastashs  
figure(27)
plot(tOut,sum);
pos=find(tOut<=Tg);
ise=max(pos);         
ISE= sum(ise); 
title('ISE')

%Ypologismos ITSE me idio tropo
integral=zeros(size(tOut));
prev_integra1=zeros(size(tOut));
sum=zeros(size(tOut));
 
 for i=2:length(tOut)
     integral(1)= 0;
     integral(i)=i*et_sq(i)*(tOut(i)-tOut(i-1));
 end

 for i=2:length(integral)
   sum(1)=0;
   prev_integra1(i)=sum(i-1);
   sum(i)=prev_integra1(i)+integral(i);    
 end
 
figure(28)
plot(tOut,sum);
pos=find(tOut<=Tg);
itse=max(pos);         
ITSE= sum(itse);
title('ITSE')
























