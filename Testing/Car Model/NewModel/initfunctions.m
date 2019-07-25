%init functions

S = load('latsurfs.mat');

B_surf_lat = S.B_surf_IA_P;
B_lat =  @(i,u,v)feval(B_surf_lat{i},[u,v]);

C_surf_lat = S.C_surf_IA_P;
C_lat =  @(i,u,v)feval(C_surf_lat{i},[u,v]);

D_surf_lat = S.D_surf_IA_P;
D_lat =  @(i,u,v)feval(D_surf_lat{i},[u,v]);

E_surf_lat = S.E_surf_IA_P;
E_lat =  @(i,u,v)feval(E_surf_lat{i},[u,v]);

Mu_surf_lat = S.Mu_surf_IA_P;
Mu_lat =  @(i,u,v)feval(Mu_surf_lat{i},[u,v]);

T = load('longsurfs.mat');

B_surf_long = T.B_surf_IA_P;
B_long =  @(i,u,v)feval(B_surf_long{i},[u,v]);

C_surf_long = T.C_surf_IA_P;
C_long =  @(i,u,v)feval(C_surf_long{i},[u,v]);

D_surf_long = T.D_surf_IA_P;
D_long =  @(i,u,v)feval(D_surf_long{i},[u,v]);

E_surf_long = T.E_surf_IA_P;
E_long =  @(i,u,v)feval(E_surf_long{i},[u,v]);

Mu_surf_long = T.Mu_surf_IA_P;
Mu_long =  @(i,u,v)feval(Mu_surf_long{i},[u,v]);