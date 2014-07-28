%x=[0 1 0 1 1 1 0 0 1 0 1 0 0 0 1 0 0];
n_pack=100;
bits_per_pack=20000;
n_err_vec=zeros(1,n_pack);
err_cnt_vec=zeros(1,n_pack);
for k=1:n_pack
    k
x=randi(2,1,bits_per_pack)-1;
x2=horzcat(x,0,0);
xd1=horzcat(0,x,0);
xd2=horzcat(0,0,x);

y1_tmp=xor(x2,xd1);
y1=xor(y1_tmp,xd2);
y2=xor(x2,xd2);

y=horzcat(y1(1),y2(1));
for i=1:length(x)
    y=horzcat(y,y1(i),y2(i));
end
y1=y(3:length(y));
err_insert=zeros(1,length(y1));
% err_insert(4)=1;
% err_insert(40)=1;
% err_insert(34)=1;
% err_insert(59)=1;
% err_insert(111)=1;
% err_insert(157)=1;
% err_insert(182)=1;

rnd1=rand(1,length(y1));
n_err=0;
for i=1:length(rnd1)
    if rnd1(i)<=0.999
        err_insert(i)=0;
    else
        err_insert(i)=1;
        n_err=n_err+1;
    end
end
y2=xor(y1,err_insert);
rx3=viterbi_dec_3st(y2);
rx4=viterbi_dec_4st(y2);
rx5=viterbi_dec_5st(y2);


err_cnt3=0;
err_cnt4=0;
err_cnt5=0;

for i=1:length(x)
    if x(i)~=rx3(i)
        err_cnt3=err_cnt3+1;
    end
end
for i=1:length(x)
    if x(i)~=rx4(i)
        err_cnt4=err_cnt4+1;
    end
end
for i=1:length(x)
    if x(i)~=rx5(i)
        err_cnt5=err_cnt5+1;
    end
end
n_err_vec(k)=n_err;
err_cnt_vec3(k)=err_cnt3;
err_cnt_vec4(k)=err_cnt4;
err_cnt_vec5(k)=err_cnt5;


end
err_rate_before_fec=sum(n_err_vec)/(n_pack*bits_per_pack)

err_rate_after_fec_3st=sum(err_cnt_vec3)/(n_pack*bits_per_pack)
err_rate_after_fec_4st=sum(err_cnt_vec4)/(n_pack*bits_per_pack)
err_rate_after_fec_5st=sum(err_cnt_vec5)/(n_pack*bits_per_pack)

