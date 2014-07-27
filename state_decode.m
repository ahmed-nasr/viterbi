function [NS1,NS2,PM1,PM2] = state_decode(in_state,rx_bits,pm_in)

     
    if in_state==[0 0]
        NS1=[0 0];
        NS2=[1 0];      
        if rx_bits==[0 0]
            PM1=pm_in;
            PM2=pm_in+2;
        elseif rx_bits==[0 1]
            PM1=pm_in+1;
            PM2=pm_in+1;
        elseif rx_bits==[1 0]       
            PM1=pm_in+1;
            PM2=pm_in+1;
        elseif rx_bits==[1 1]
            PM1=pm_in+2;
            PM2=pm_in;
        else
            PM1=888
            PM2=888             
        end
    elseif in_state==[0 1]
        NS1=[0 0];
        NS2=[1 0];
        if rx_bits==[0 0]
            PM1=pm_in+2;
            PM2=pm_in;
        elseif rx_bits==[0 1]
            PM1=pm_in+1;
            PM2=pm_in+1;
        elseif rx_bits==[1 0]       
            PM1=pm_in+1;
            PM2=pm_in+1;
        elseif rx_bits==[1 1]
            PM1=pm_in;
            PM2=pm_in+2;
        else
            PM1=888
            PM2=888         
        end    
    elseif in_state==[1 0]
        NS1=[0 1];
        NS2=[1 1];
        if rx_bits==[0 0]
            PM1=pm_in+1;
            PM2=pm_in+1;
        elseif rx_bits==[0 1]
            PM1=pm_in+2;
            PM2=pm_in;
        elseif rx_bits==[1 0]       
            PM1=pm_in;
            PM2=pm_in+2;
        elseif rx_bits==[1 1]
            PM1=pm_in+1;
            PM2=pm_in+1;
        else
            PM1=888
            PM2=888         
        end     
    elseif in_state==[1 1]
        NS1=[0 1];
        NS2=[1 1];
        if rx_bits==[0 0]
            PM1=pm_in+1;
            PM2=pm_in+1;
        elseif rx_bits==[0 1]
            PM1=pm_in;
            PM2=pm_in+2;
        elseif rx_bits==[1 0]       
            PM1=pm_in+2;
            PM2=pm_in;
        elseif rx_bits==[1 1]
            PM1=pm_in+1;
            PM2=pm_in+1;
        else
            PM1=888
            PM2=888         
        end      
    else
        PM1=888
        PM2=888    
end
