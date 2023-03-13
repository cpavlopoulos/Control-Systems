%erotima d1
s=tf('s')
Gs=0.8/(0.179*s^2+0.85*s+1) %sinartisi metaforas 
Ds=pidstd(3.28, 1.26)       %PI controller CHR Method
figure(1)
step(Gs)
title('Vimatikh apokrish G(s)')
axis([0 5 0 1]);

%erotima d2
figure(2)
Tg=1.05;                    %Tg(Ts) 
t = linspace(0,60);         %prosarmozoume parametrous 
x = square(0.4*t);          %gia thn anaparastash
s = tf('s');                %tou systhmatos

systhma = feedback(Ds*Gs, 1);
u=250*x+1750;               %tetargwnikos polwmenos palmos
lsim(systhma,u,t);
axis([0 60 0 4000])
title('Vimatikh apokrish kinhthra me PI Controller')

figure(3)
A=norm(u,inf);
et=A/(1+(Ds*Gs));           %ypologismos sfalmatos
step(et);
[y,tOut] = step(et);
title('Sfalma');

et_sq=y.*y;             %ypologismos tetargwnoy sfalmatos
figure(4)  
plot(tOut,et_sq);
title('Sfalma^2')

integral=zeros(size(tOut));     %ypologismos ISE 
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
figure(5)
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
 
figure(6)
plot(tOut,sum);
pos=find(tOut<=Tg);
itse=max(pos);         
ITSE= sum(itse);
title('ITSE')

%erotima d3
%PI controller set with Tsum method
Ds_Tsum=pidstd(0.625,0.425);
systhma_Tsum=feedback(Ds_Tsum*Gs,1);
figure(7);
lsim(systhma_Tsum,u,t);
title('Vimatikh apokrish kinhthra me PI Controller//Tsum')
axis([0 60 0 4000]);

%ypologismos sfalmatos Tsum
et_tsum=A-(systhma_Tsum*A);
figure(8)
step(et_tsum);
title('Sfalma//Tsum');
axis([0 8 -500 2000]);
[y2,tOut2] = step(et_tsum);

et_tsum_sq=y2.*y2;  %ypologismos tetragwnikou sfalmatos Tsum
figure(9)
plot(tOut2,et_tsum_sq);
title('Sfalma^2//Tsum');

integral=zeros(size(tOut2));
prev_integra1=zeros(size(tOut2));
sum=zeros(size(tOut2));

%ISE kai ITSE me thn methodo pou xrhsimopoihthke parapanw 
 for i=2:length(tOut2)
     integral(1)= 0;
     integral(i)=et_tsum_sq(i)*(tOut2(i)-tOut2(i-1));
 end

 for i=2:length(integral)
   sum(1)=0;
   prev_integra1(i)=sum(i-1);
   sum(i)=prev_integra1(i)+integral(i);    
 end
 
figure(10)
plot(tOut2,sum);
pos2=find(tOut2<=Tg);
ise2_t=max(pos2);
ISE= sum(ise2_t);
title('ISE/Tsum')

integral=zeros(size(tOut2));
prev_integra1=zeros(size(tOut2));
sum=zeros(size(tOut2));

 %ftiaxnv to olokliroma itse 
 for i=2:length(tOut2)
     integral(1)= 0;
     integral(i)=i*et_tsum_sq(i)*(tOut2(i)-tOut2(i-1));
 end

 for i=2:length(integral)
   sum(1)=0;
   prev_integra1(i)=sum(i-1);
   sum(i)=prev_integra1(i)+integral(i);    
 end
 
figure(11)
plot(tOut2,sum);
pos2=find(tOut2<=Tg);
itse2=max(pos2);
ITSE2= sum(itse2);  
title('ITSE/Tsum')
