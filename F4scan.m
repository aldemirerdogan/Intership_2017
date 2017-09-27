function[vector_hold]= F4scan(B);
% B=imread('circle.png');
B=B(:,:,1);
B=logical(B);
s=size(B);
I=zeros(s(1)+2,s(2)+2);
I(2:end-1,2:end-1)=B(1:end,1:end);

[r,c]=findintloc(I);


counter=1;
hold_1=r;
hold_2=c;
hold=0;
control=0;
a=1;

        if I(r,c+1)==1
            vector_hold(1,counter)=0;
            counter=counter+1;
            c=c+1;
            hold=0;
        elseif I(r+1,c)==1
            vector_hold(1,counter)=3;
            counter=counter+1;
            r=r+1;
            hold=1;
            
        end
       while hold_1 ~= r || hold_2 ~= c
    
    if hold==0
        if I(r,c+1)==1
            vector_hold(1,counter)=0;
            counter=counter+1;
            c=c+1;
            hold=0;
            
           
        
        elseif I(r-1,c)==1
                vector_hold(1,counter)=1;
            counter=counter+1;
            r=r-1;
            hold=1;
            
        elseif I(r+1,c)==1
            vector_hold(1,counter)=3;
            counter=counter+1;
            r=r+1;
            hold=1;
        end
        
    end
    
    if hold==1
        if I(r+1,c)==1
            vector_hold(1,counter)=3;
            counter=counter+1;
            r=r+1;
            hold=1;
            
           
        
        elseif I(r,c+1)==1
                vector_hold(1,counter)=0;
            counter=counter+1;
            c=c+1;
            hold=0;
            
        elseif I(r,c-1)==1
            vector_hold(1,counter)=2;
            counter=counter+1;
            c=c-1;
            hold=2;
        end
        
    end
    if hold==2
        if I(r,c-1)==1
            vector_hold(1,counter)=2;
            counter=counter+1;
            c=c-1;
            hold=2;
            
           
        
        elseif I(r+1,c)==1
                vector_hold(1,counter)=3;
            counter=counter+1;
            r=r+1;
            hold=1;
           
        elseif I(r-1,c)==1
            vector_hold(1,counter)=1;
            counter=counter+1;
            r=r-1;
            hold=3;
           
        
            
           
        end
        
    end
    
    if hold==3
        if I(r-1,c)==1
            vector_hold(1,counter)=1;
            counter=counter+1;
            r=r-1;
            hold=3;
          
           
        
        elseif I(r,c+1)==1
                vector_hold(1,counter)=0;
            counter=counter+1;
            c=c+1;
            hold=0;
            
        elseif I(r,c-1)==1
            vector_hold(1,counter)=2;
            counter=counter+1;
            c=c-1;
            hold=2;
            
       
            
        end
   
    end
    
end
        