function [H] = f8decoder(newvector,r,c)

% newvector=[0,0,0,1,2,4,5,6,7,0,0,0];

% r=4;
% c=3;

counter=1;

length=size(newvector);

H=zeros(length(2)*2+r+c);
H(r,c)=1;
while counter<=length(2)
    
   if newvector(1,counter)==0
       H(r,c+1)=1;
       c=c+1;
   elseif newvector(1,counter)==1
       H(r-1,c+1)=1;
       r=r-1;
       c=c+1;
   elseif newvector(1,counter)==2
       H(r-1,c)=1;
       r=r-1;
   elseif newvector(1,counter)==3
       H(r-1,c-1)=1;
       r=r-1;
       c=c-1;
   elseif newvector(1,counter)==4
       H(r,c-1)=1;
       c=c-1;
   elseif newvector(1,counter)==5
       H(r+1,c-1)=1;
       r=r+1;
       c=c-1;
   elseif newvector(1,counter)==6
       H(r+1,c)=1;
       r=r+1;
   elseif newvector(1,counter)==7
       H(r+1,c+1)=1;
       r=r+1;
       c=c+1;
   end
   counter=counter+1;
end

end