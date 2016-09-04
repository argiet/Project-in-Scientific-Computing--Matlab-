%erwthma b(iii)
%isapexousa shmeia sto diasthma [1,2]
%gia n=4096

%double precision by default
k = linspace(1,2,4096);

%single presicion
k_s = single(k);

%f1

%klhsh sunarthshs f1 (erwthma a(i))
%kai apothikeush apotelesmatos sto sum_double
sum_double1=f1(k);
sum_double1

%single precision
%klhsh sunarthshs f1 (erwthma a(i))
%kai apothikeush apotelesmatos sto sum_single
sum_single1=f1(k_s);
sum_single1

%ypologismos empros sfalmatos (apoluth timh diaforas twn duo timwn)
%gia double kai single precision
dif1 = abs(sum_double1 - sum_single1);
dif1 %emfanish diaforas


%f2

%klhsh sunarthshs f2 (erwthma a(ii))
%kai apothikeush apotelesmatos sto sum_double
sum_double2=f2(k);
sum_double2

%single precision
%klhsh sunarthshs f2 (erwthma a(ii))
%kai apothikeush apotelesmatos sto sum_single
sum_single2=f2(k_s);
sum_single2

%ypologismos empros sfalmatos (apoluth timh diaforas twn duo timwn)
%gia double kai single precision
dif2 = abs(sum_double2 - sum_single2);
dif2 %emfanish diaforas


%f3

%double precision
%klhsh sunarthshs f3 (erwthma a(iii))
%kai apothikeush apotelesmatos sto sum_double
sum_double3=f3_2(k);
sum_double3

%single precision
%klhsh sunarthshs f3 (erwthma a(iii))
%kai apothikeush apotelesmatos sto sum_single
sum_single3=f3_2(k_s);
sum_single3

%ypologismos empros sfalmatos (apoluth timh diaforas twn duo timwn)
%gia double kai single precision
dif3 = abs(sum_double3 - sum_single3);
dif3 %emfanish diaforas


%f4

%double precision
%klhsh sunarthshs f4 (erwthma a(iv))
%kai apothikeush apotelesmatos sto sum_double
sum_double4=f4(k);
sum_double4

%single precision
%klhsh sunarthshs f4 (erwthma a(iv))
%kai apothikeush apotelesmatos sto sum_single
sum_single4=f4(k_s);
sum_single4

%ypologismos empros sfalmatos (apoluth timh diaforas twn duo timwn)
%gia double kai single precision
dif4 = abs(sum_double4 - sum_single4);
dif4 %emfanish diaforas