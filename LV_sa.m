%filename:  LV_sa.m
clear all %clear all variables
clf       %and figures
global T TS tauS tauD;
global Csa Rs RMi RAo dt CHECK PLA;
in_LV_sa  %initialize

for klok=1:klokmax
  t=klok*dt;
  PLV_old=PLV;
  Psa_old=Psa;
  CLV_old=CLV;
  CLV=CV_now(t,CLVS,CLVD);
  %find self-consistent 
  %valve states and pressures:
  set_SMi_SAo
  %store in arrays for future plotting:
  t_plot(klok)=t;
  CLV_plot(klok)=CLV;
  PLV_plot(klok)=PLV;
  Psa_plot(klok)=Psa;
  VLV_plot(klok)=CLV*PLV+VLVd;
  Vsa_plot(klok)=Csa*Psa+Vsad;
  QMi_plot(klok)=SMi*(PLA-PLV)/RMi;
  QAo_plot(klok)=SAo*(PLV-Psa)/RAo;
  Qs_plot(klok)=Psa/Rs;
  SMi_plot(klok)=SMi;
  SAo_plot(klok)=SAo;
end
%plot results:
figure(1)
subplot(2,1,1), plot(t_plot,CLV_plot)
title('Compliance(t)')
subplot(2,1,2), plot(t_plot,PLV_plot,t_plot,Psa_plot)
title('PLV(t) (blue) and Psa(t) (red)')
figure(2)
plot(t_plot,Vsa_plot)
title('Volume(t)')
figure(3)
plot(t_plot,SMi_plot,t_plot,SAo_plot)
title('SMi(t) (blue) and SAo(t) (red)')
ylim([-0.1,1.1])
