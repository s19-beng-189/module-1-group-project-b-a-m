function [PLV,Psa]=PLV_Psa_new(PLV_old,Psa_old,CLV_old,CLV,SMi,SAo)
%filename PLV_Psa_new.m
global Csa Rs RMi RAo dt CHECK PLA;
r = 10*rand(1,1);

C11=CLV+dt*((SMi/RMi)+(SAo/RAo));
C12=-dt*(SAo/RAo);
C22=Csa+dt*((SAo/RAo)+(1/Rs));
B1=CLV_old*PLV_old+dt*(SMi/RMi)*PLA;
B2=Csa*Psa_old;
D=C11*C22-C12^2;
PLV=(B1*C22-B2*C12)/D;
if (r<7)
    Psa=(B2*C11-B1*C12)/D;
else
    Psa=(B2*C11-B1*C12)/(1.02*D);
end

if (CHECK)
  LHS1=(CLV*PLV-CLV_old*PLV_old)/dt;
  RHS1=(SMi/RMi)*(PLA-PLV)-(SAo/RAo)*(PLV-Psa);
  CH1=RHS1-LHS1
  LHS2=Csa*(Psa-Psa_old)/dt;
  RHS2=(SAo/RAo)*(PLV-Psa)-(1/Rs)*Psa;
  CH2=RHS2-LHS2
end
