function [rx_bit]=viterbi_dec(input_data)
rx_bit=zeros(1,length(input_data)/2);
input_data1=horzcat(input_data,zeros(1,10));
for i=1:2:length(input_data)
   in_pair1=input_data1(i:i+1);
   in_pair2=input_data1(i+2:i+3);
   in_pair3=input_data1(i+4:i+5);
   in_pair4=input_data1(i+6:i+7);
   in_pair5=input_data1(i+8:i+9);
   
   
if i==1   
    cs=[0 0];
    pm_in=0;
else
    cs=cs_prev;
    pm_in=pm_prev;
end
%1st stage
[ns11,ns12,pm11,pm12]=state_decode(cs,in_pair1,pm_in);
%2nd stage
[ns21,ns22,pm21,pm22]=state_decode(ns11,in_pair2,pm11);
[ns23,ns24,pm23,pm24]=state_decode(ns12,in_pair2,pm12);
%3rd stage
[ns31,ns32,pm31,pm32]=state_decode(ns21,in_pair3,pm21);
[ns33,ns34,pm33,pm34]=state_decode(ns22,in_pair3,pm22);
[ns35,ns36,pm35,pm36]=state_decode(ns23,in_pair3,pm23);
[ns37,ns38,pm37,pm38]=state_decode(ns24,in_pair3,pm24);
%4th stage
[ns41,ns42,pm41,pm42]=state_decode(ns31,in_pair4,pm31);
[ns43,ns44,pm43,pm44]=state_decode(ns32,in_pair4,pm32);
[ns45,ns46,pm45,pm46]=state_decode(ns33,in_pair4,pm33);
[ns47,ns48,pm47,pm48]=state_decode(ns34,in_pair4,pm34);
[ns49,ns410,pm49,pm410]=state_decode(ns35,in_pair4,pm35);
[ns411,ns412,pm411,pm412]=state_decode(ns36,in_pair4,pm36);
[ns413,ns414,pm413,pm414]=state_decode(ns37,in_pair4,pm37);
[ns415,ns416,pm415,pm416]=state_decode(ns38,in_pair4,pm38);
%5th stage
[ns51,ns52,pm51,pm52]=state_decode(ns41,in_pair5,pm41);
[ns53,ns54,pm53,pm54]=state_decode(ns42,in_pair5,pm42);
[ns55,ns56,pm55,pm56]=state_decode(ns43,in_pair5,pm43);
[ns57,ns58,pm57,pm58]=state_decode(ns44,in_pair5,pm44);
[ns59,ns510,pm59,pm510]=state_decode(ns45,in_pair5,pm45);
[ns511,ns512,pm511,pm512]=state_decode(ns46,in_pair5,pm46);
[ns513,ns514,pm513,pm514]=state_decode(ns47,in_pair5,pm47);
[ns515,ns516,pm515,pm516]=state_decode(ns48,in_pair5,pm48);
[ns517,ns518,pm517,pm518]=state_decode(ns49,in_pair5,pm49);
[ns519,ns520,pm519,pm520]=state_decode(ns410,in_pair5,pm410);
[ns521,ns522,pm521,pm522]=state_decode(ns411,in_pair5,pm411);
[ns523,ns524,pm523,pm524]=state_decode(ns412,in_pair5,pm412);
[ns525,ns526,pm525,pm526]=state_decode(ns413,in_pair5,pm413);
[ns527,ns528,pm527,pm528]=state_decode(ns414,in_pair5,pm414);
[ns529,ns530,pm529,pm530]=state_decode(ns415,in_pair5,pm415);
[ns531,ns532,pm531,pm532]=state_decode(ns416,in_pair5,pm416);


pm_incase_0=[pm51 pm52 pm53 pm54 pm55 pm56 pm57 pm58 pm59 pm510 pm511 pm512 pm513 pm514 pm515 pm516];
pm_incase_1=[pm517 pm518 pm519 pm520 pm521 pm522 pm523 pm524 pm525 pm526 pm527 pm528 pm529 pm530 pm531 pm532];

min_incase_of_0=min(pm_incase_0);
min_incase_of_1=min(pm_incase_1);

if(min_incase_of_0<min_incase_of_1)
    rx_bit((i+1)/2)=0;
    cs_prev=ns11;
    pm_prev=pm11;
else
    rx_bit((i+1)/2)=1;
    cs_prev=ns12;
    pm_prev=pm12;
end
%pm_prev_vec((i+1)/2)=pm_prev
%cs_prev_vec(i:i+1)=cs_prev


end