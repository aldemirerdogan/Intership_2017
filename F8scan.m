function [vector_hold,hold_1,hold_2,row,column]= F8scan(B);
%  B=imread('try2.png');
% B=liver_GT(:,:,10);
B=logical(B);
s=size(B);
row=s(1);
column=s(2);
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
            vector_hold(1,counter)=6;
            counter=counter+1;
            r=r+1;
            hold=1;
            
        elseif I(r+1,c+1)==1
            vector_hold(1,counter)=7;
            counter=counter+1;
            r=r+1;
            c=c+1;
            hold=1;
            
        
            
        end
        
   
    
while hold_1 ~= r || hold_2 ~= c
    
    if hold==0 %sağa git
        if I(r,c+1)==1
            vector_hold(1,counter)=0;
            counter=counter+1;
            c=c+1;
            hold=0;
            
           
        
        
            
        elseif I(r+1,c)==1
            vector_hold(1,counter)=6;
            counter=counter+1;
            r=r+1;
            hold=1;
            
       elseif I(r-1,c)==1
                vector_hold(1,counter)=2;
            counter=counter+1;
            r=r-1;
            hold=3;
            
        elseif I(r+1,c+1)==1
            vector_hold(1,counter)=7;
            counter=counter+1;
            r=r+1;
            c=c+1;
            hold=0;
            
        elseif I(r-1,c+1)==1
            vector_hold(1,counter)=1;
            counter=counter+1;
            r=r-1;
            c=c+1;
            hold=0;
        else 
            if I(r+1,c-1)==1 && I(r-1,c-1)==0
            vector_hold(1,counter)=5;
            counter=counter+1;
            r=r+1;
            c=c-1;
            hold=1;
            elseif I(r-1,c-1)==1 && I(r+1,c-1)==0
               
            vector_hold(1,counter)=3;
            counter=counter+1;
            r=r-1;
            c=c-1;
            hold=3;
            elseif I(r-1,c-1)==1 && I(r+1,c-1)==1 && ( I(r-2,c-2)==1 || I(r-2,c-1)==1 || I(r-2,c)==1)
                vector_hold(1,counter)=3;
            counter=counter+1;
            r=r-1;
            c=c-1;
            hold=3;
            
            elseif I(r-1,c-1)==1 && I(r+1,c-1)==1 && ( I(r+2,c-2)==1 || I(r+2,c-1)==1 || I(r+2,c)==1)
                vector_hold(1,counter)=5;
            counter=counter+1;
            r=r+1;
            c=c-1;
            hold=1;
            
                
            end    
            
            
        end
        
    
    
    elseif hold==1%aşa git
        if I(r+1,c)==1
            vector_hold(1,counter)=6;
            counter=counter+1;
            r=r+1;
            hold=1;
            
           
        
        elseif I(r,c+1)==1
                vector_hold(1,counter)=0;
            counter=counter+1;
            c=c+1;
            hold=0;
            
        elseif I(r,c-1)==1
            vector_hold(1,counter)=4;
            counter=counter+1;
            c=c-1;
            hold=2;
            
        elseif I(r+1,c+1)==1
            vector_hold(1,counter)=7;
            counter=counter+1;
            r=r+1;
            c=c+1;
            hold=0;
            
        elseif I(r+1,c-1)==1
            vector_hold(1,counter)=5;
            counter=counter+1;
            r=r+1;
            c=c-1;
            hold=2;
        else 
            if I(r-1,c-1)==1 && I(r-1,c+1)==0
            vector_hold(1,counter)=3;
            counter=counter+1;
            r=r-1;
            c=c-1;
            hold=2;
            elseif I(r-1,c+1)==1 && I(r-1,c-1)==0
               
            vector_hold(1,counter)=1;
            counter=counter+1;
            r=r-1;
            c=c+1;
            hold=0;
            elseif I(r-1,c-1)==1 && I(r-1,c+1)==1 && ( I(r-1,c+2)==1 || I(r,c+2)==1 || I(r-2,c+2)==1)
                vector_hold(1,counter)=1;
            counter=counter+1;
            r=r-1;
            c=c+1;
            hold=0;
            elseif I(r-1,c-1)==1 && I(r-1,c+1)==1 && ( I(r-1,c-2)==1 || I(r,c-2)==1 || I(r-2,c-2)==1)
                vector_hold(1,counter)=3;
            counter=counter+1;
            r=r-1;
            c=c-1;
            hold=2;
                
            end    
            
            
        end
        
    
    elseif hold==2%sola git
        if I(r,c-1)==1
            vector_hold(1,counter)=4;
            counter=counter+1;
            c=c-1;
            hold=2;
            
           
        
        elseif I(r+1,c)==1
                vector_hold(1,counter)=6;
            counter=counter+1;
            r=r+1;
            hold=1;
           
        elseif I(r-1,c)==1
            vector_hold(1,counter)=2;
            counter=counter+1;
            r=r-1;
            hold=3;
           
        elseif I(r-1,c-1)==1
            vector_hold(1,counter)=3;
            counter=counter+1;
            r=r-1;
            c=c-1;
            hold=2;
            
        elseif I(r+1,c-1)==1
            vector_hold(1,counter)=5;
            counter=counter+1;
            r=r+1;
            c=c-1;
            hold=2;
        elseif I(r-1,c-1)==1 && I(r-1,c)==0
            vector_hold(1,counter)=3;
            counter=counter+1;
            r=r-1;
            c=c-1;
            hold=0;
         elseif I(r+1,c-1)==1 && I(r-1,c)==0
            vector_hold(1,counter)=5;
            counter=counter+1;
            r=r+1;
            c=c-1;
            hold=0;
         else 
            if I(r+1,c+1)==1 && I(r-1,c+1)==0
            vector_hold(1,counter)=7;
            counter=counter+1;
            r=r+1;
            c=c+1;
            hold=1; 
            
            elseif I(r-1,c+1)==1 && I(r+1,c+1)==0
               
            vector_hold(1,counter)=1;
            counter=counter+1;
            r=r-1;
            c=c+1;
            hold=3;
            
            
            
            elseif I(r-1,c-1)==1 && I(r+1,c-1)==1 && ( I(r+2,c+2)==1 || I(r+2,c+1)==1 || I(r+2,c)==1)
                vector_hold(1,counter)=7;
            counter=counter+1;
            r=r+1;
            c=c+1;
            hold=1; 
            elseif I(r-1,c+1)==1 && I(r+1,c+1)==1 && ( I(r-2,c+2)==1 || I(r-2,c+1)==1 || I(r-2,c)==1)
                vector_hold(1,counter)=1;
            counter=counter+1;
            r=r-1;
            c=c+1;
            hold=3;
           
            
                
                
                
            end    
            
           
        end
        
    
    
    elseif hold==3%%yukarı git
        if I(r-1,c)==1
            vector_hold(1,counter)=2;
            counter=counter+1;
            r=r-1;
            hold=3;
          
           
        
        elseif I(r,c+1)==1
                vector_hold(1,counter)=0;
            counter=counter+1;
            c=c+1;
            hold=0;
            
        elseif I(r,c-1)==1
            vector_hold(1,counter)=4;
            counter=counter+1;
            c=c-1;
            hold=2;
            
        elseif I(r-1,c-1)==1
            vector_hold(1,counter)=3;
            counter=counter+1;
            r=r-1;
            c=c-1;
            hold=2;
            
        elseif I(r-1,c+1)==1
            vector_hold(1,counter)=1;
            counter=counter+1;
            r=r-1;
            c=c+1;
            hold=0;
        else 
            if I(r+1,c-1)==1 && I(r+1,c+1)==0
            vector_hold(1,counter)=5;
            counter=counter+1;
            r=r+1;
            c=c-1;
            hold=2;
            elseif I(r+1,c+1)==1 && I(r+1,c-1)==0
               
            vector_hold(1,counter)=7;
            counter=counter+1;
            r=r+1;
            c=c+1;
            hold=0;
            
            elseif I(r+1,c+1)==1 && I(r+1,c-1)==1 && ( I(r-1,c-2)==1 || I(r,c-2)==1 || I(r-2,c-2)==1)
                vector_hold(1,counter)=5;
            counter=counter+1;
            r=r+1;
            c=c-1;
            hold=2;
            elseif I(r+1,c+1)==1 && I(r+1,c-1)==1 && ( I(r-1,c+2)==1 || I(r,c+2)==1 || I(r-2,c+2)==1)
                vector_hold(1,counter)=7;
            counter=counter+1;
            r=r+1;
            c=c+1;
            hold=0;
            
                
            end    
            
        end
   
    end
    
end
