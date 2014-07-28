%x=[0 1 0 1 1 1 0 0 1 0 1 0 0 0 1 0 0];
n_err_vec=zeros(1,100);
err_cnt_vec=zeros(1,100);
for k=1:100
    k
x=randi(2,1,20000)-1;
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
rx=viterbi_dec(y2);
err_cnt=0;
for i=1:length(x)
    if x(i)~=rx(i)
        err_cnt=err_cnt+1;
    end
end
n_err_vec(k)=n_err;
err_cnt_vec(k)=err_cnt
end