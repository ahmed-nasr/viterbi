function [rx_bit]=viterbi_dec(input_data)
rx_bit=zeros(1,length(input_data)/2);
input_data1=horzcat(input_data,zeros(1,6));
for i=1:2:length(input_data)
   in_pair1=input_data1(i:i+1);
   in_pair2=input_data1(i+2:i+3);
   in_pair3=input_data1(i+4:i+5);
   
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

pm_incase_0=[pm31 pm32 pm33 pm34];
pm_incase_1=[pm35 pm36 pm37 pm38];

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