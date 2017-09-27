function[I]= threeOTscan(B)
% B=imread('square.png');
B=B(:,:,1);
B=logical(B);
vector=F4scan(B);
s=size(vector);
vector(1,s(2)+1)=0;

I=zeros(1,s(2));
for a=2:s(2)
    if vector(a)==vector(a-1)
        I(1,a-1)=0;
    elseif vector(a)==vector(1)
        I(1,a-1)=1;
    else 
        I(1,a-1)=2;
    end
        
end
