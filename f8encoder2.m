
function [newvector,r,c,r_size,c_size] = f8encoder2(I)

% I=imread('brandom.png');
I=I(:,:,1);
I=logical(I);
flag=0;
counter=1;

s_Image=size(I);
H=zeros(2+s_Image(1),2+s_Image(2));
H(2:s_Image(1)+1,2:s_Image(2)+1)=I(:,:);

conved=conv2(H,ones(3),'same');
H=logical(conved)-logical(H);

s_H=size(H);
r_size=s_H(1);
c_size=s_H(2);
for r=1:s_H(1)
    for c=1:s_H(2)
        if H(r,c)==1
            break;
        end
    end
    if H(r,c)==1
            break;
    end
end

r_org=r;
c_org=c;


if flag==0
    if H(r,c+1)==1
        
        c=c+1;
        newvector(1,counter)=0;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r-1,c)==1
        r=r-1;
        newvector(1,counter)=2;
        counter=counter+1;
        flag=3;
        H(r,c)=2;
    elseif H(r-1,c+1)==1
        r=r-1;
        c=c+1;
        newvector(1,counter)=1;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r+1,c)==1
        r=r+1;
        newvector(1,counter)=6;
        counter=counter+1;
        flag=1;
        H(r,c)=2;
    elseif H(r+1,c+1)==1
        r=r+1;
        c=c+1;
        newvector(1,counter)=7;
        counter=counter+1;
        H(r,c)=2;
        
    elseif H(r,c+1)==2
        
        c=c+1;
        newvector(1,counter)=0;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r-1,c)==2
        r=r-1;
        newvector(1,counter)=2;
        counter=counter+1;
        flag=3;
        H(r,c)=2;
    elseif H(r-1,c+1)==2
        r=r-1;
        c=c+1;
        newvector(1,counter)=1;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r+1,c)==2
        r=r+1;
        newvector(1,counter)=6;
        counter=counter+1;
        flag=1;
        H(r,c)=2;
    elseif H(r+1,c+1)==2
        r=r+1;
        c=c+1;
        newvector(1,counter)=7;
        counter=counter+1;
        H(r,c)=2;
        
        
    else
        flag=2;
    end
elseif flag==1
    if H(r+1,c)==1
        
        r=r+1;
        newvector(1,counter)=6;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r,c+1)==1
        c=c+1;
        newvector(1,counter)=0;
        counter=counter+1;
        flag=0;
        H(r,c)=2;
    elseif H(r,c-1)==1
        c=c-1;
        newvector(1,counter)=4;
        counter=counter+1;
        flag=2;
        H(r,c)=2;
        
    elseif H(r+1,c-1)==1
        r=r+1;
        c=c-1;
        newvector(1,counter)=5;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r+1,c+1)==1
        r=r+1;
        c=c+1;
        newvector(1,counter)=7;
        counter=counter+1;
        H(r,c)=2;
        
    elseif H(r+1,c)==2
        
        r=r+1;
        newvector(1,counter)=6;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r,c+1)==2
        c=c+1;
        newvector(1,counter)=0;
        counter=counter+1;
        flag=0;
        H(r,c)=2;
    elseif H(r,c-1)==2
        c=c-1;
        newvector(1,counter)=4;
        counter=counter+1;
        flag=2;
        H(r,c)=2;
        
    elseif H(r+1,c-1)==2
        r=r+1;
        c=c-1;
        newvector(1,counter)=5;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r+1,c+1)==2
        r=r+1;
        c=c+1;
        newvector(1,counter)=7;
        counter=counter+1;
        H(r,c)=2;
        
    else
        flag=3;
    end
elseif flag==2
    if H(r,c-1)==1
        
        c=c-1;
        newvector(1,counter)=4;
        counter=counter+1;
        flag=2;
        H(r,c)=2;
    elseif H(r+1,c)==1
        r=r+1;
        newvector(1,counter)=6;
        counter=counter+1;
        flag=1;
        H(r,c)=2;
    elseif H(r-1,c)==1
        
        r=r-1;
        newvector(1,counter)=2;
        counter=counter+1;
        flag=3;
        H(r,c)=2;
    elseif H(r+1,c-1)==1
        r=r+1;
        c=c-1;
        newvector(1,counter)=5;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r-1,c-1)==1
        r=r-1;
        c=c-1;
        newvector(1,counter)=3;
        counter=counter+1;
        H(r,c)=2;
        
    elseif H(r,c-1)==2
        
        c=c-1;
        newvector(1,counter)=4;
        counter=counter+1;
        flag=2;
        H(r,c)=2;
    elseif H(r+1,c)==2
        r=r+1;
        newvector(1,counter)=6;
        counter=counter+1;
        flag=1;
        H(r,c)=2;
    elseif H(r-1,c)==2
        
        r=r-1;
        newvector(1,counter)=2;
        counter=counter+1;
        flag=3;
        H(r,c)=2;
    elseif H(r+1,c-1)==2
        r=r+1;
        c=c-1;
        newvector(1,counter)=5;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r-1,c-1)==2
        r=r-1;
        c=c-1;
        newvector(1,counter)=3;
        counter=counter+1;
        H(r,c)=2;
        
    else
        flag=0;
    end
elseif flag==3
    if H(r-1,c)==1
        r=r-1;
        newvector(1,counter)=2;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r,c-1)==1
        c=c-1;
        newvector(1,counter)=4;
        counter=counter+1;
        flag=2;
        H(r,c)=2;
    elseif H(r-1,c-1)==1
        r=r-1;
        c=c-1;
        newvector(1,counter)=3;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r-1,c+1)==1
        r=r-1;
        c=c+1;
        newvector(1,counter)=1;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r,c+1)==1
        
        c=c+1;
        newvector(1,counter)=0;
        counter=counter+1;
        flag=0;
        H(r,c)=2;
        
    elseif H(r-1,c)==2
        r=r-1;
        newvector(1,counter)=2;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r,c-1)==2
        c=c-1;
        newvector(1,counter)=4;
        counter=counter+1;
        flag=2;
        H(r,c)=2;
    elseif H(r-1,c-1)==2
        r=r-1;
        c=c-1;
        newvector(1,counter)=3;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r-1,c+1)==2
        r=r-1;
        c=c+1;
        newvector(1,counter)=1;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r,c+1)==2
        
        c=c+1;
        newvector(1,counter)=0;
        counter=counter+1;
        flag=0;
        H(r,c)=2;
    else
        flag=1;
    end
end


while r~=r_org || c~=c_org
    
if flag==0
    if H(r,c+1)==1
        
        c=c+1;
        newvector(1,counter)=0;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r-1,c)==1
        r=r-1;
        newvector(1,counter)=2;
        counter=counter+1;
        flag=3;
        H(r,c)=2;
    elseif H(r-1,c+1)==1
        r=r-1;
        c=c+1;
        newvector(1,counter)=1;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r+1,c)==1
        r=r+1;
        newvector(1,counter)=6;
        counter=counter+1;
        flag=1;
        H(r,c)=2;
    elseif H(r+1,c+1)==1
        r=r+1;
        c=c+1;
        newvector(1,counter)=7;
        counter=counter+1;
        H(r,c)=2;
        
    elseif H(r,c+1)==2
        
        c=c+1;
        newvector(1,counter)=0;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r-1,c)==2
        r=r-1;
        newvector(1,counter)=2;
        counter=counter+1;
        flag=3;
        H(r,c)=2;
    elseif H(r-1,c+1)==2
        r=r-1;
        c=c+1;
        newvector(1,counter)=1;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r+1,c)==2
        r=r+1;
        newvector(1,counter)=6;
        counter=counter+1;
        flag=1;
        H(r,c)=2;
    elseif H(r+1,c+1)==2
        r=r+1;
        c=c+1;
        newvector(1,counter)=7;
        counter=counter+1;
        H(r,c)=2;
        
        
    else
        flag=2;
    end
elseif flag==1
    if H(r+1,c)==1
        
        r=r+1;
        newvector(1,counter)=6;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r,c+1)==1
        c=c+1;
        newvector(1,counter)=0;
        counter=counter+1;
        flag=0;
        H(r,c)=2;
    elseif H(r,c-1)==1
        c=c-1;
        newvector(1,counter)=4;
        counter=counter+1;
        flag=2;
        H(r,c)=2;
        
    elseif H(r+1,c-1)==1
        r=r+1;
        c=c-1;
        newvector(1,counter)=5;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r+1,c+1)==1
        r=r+1;
        c=c+1;
        newvector(1,counter)=7;
        counter=counter+1;
        H(r,c)=2;
        
    elseif H(r+1,c)==2
        
        r=r+1;
        newvector(1,counter)=6;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r,c+1)==2
        c=c+1;
        newvector(1,counter)=0;
        counter=counter+1;
        flag=0;
        H(r,c)=2;
    elseif H(r,c-1)==2
        c=c-1;
        newvector(1,counter)=4;
        counter=counter+1;
        flag=2;
        H(r,c)=2;
        
    elseif H(r+1,c-1)==2
        r=r+1;
        c=c-1;
        newvector(1,counter)=5;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r+1,c+1)==2
        r=r+1;
        c=c+1;
        newvector(1,counter)=7;
        counter=counter+1;
        H(r,c)=2;
        
    else
        flag=3;
    end
elseif flag==2
    if H(r,c-1)==1
        
        c=c-1;
        newvector(1,counter)=4;
        counter=counter+1;
        flag=2;
        H(r,c)=2;
    elseif H(r+1,c)==1
        r=r+1;
        newvector(1,counter)=6;
        counter=counter+1;
        flag=1;
        H(r,c)=2;
    elseif H(r-1,c)==1
        
        r=r-1;
        newvector(1,counter)=2;
        counter=counter+1;
        flag=3;
        H(r,c)=2;
    elseif H(r+1,c-1)==1
        r=r+1;
        c=c-1;
        newvector(1,counter)=5;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r-1,c-1)==1
        r=r-1;
        c=c-1;
        newvector(1,counter)=3;
        counter=counter+1;
        H(r,c)=2;
        
    elseif H(r,c-1)==2
        
        c=c-1;
        newvector(1,counter)=4;
        counter=counter+1;
        flag=2;
        H(r,c)=2;
    elseif H(r+1,c)==2
        r=r+1;
        newvector(1,counter)=6;
        counter=counter+1;
        flag=1;
        H(r,c)=2;
    elseif H(r-1,c)==2
        
        r=r-1;
        newvector(1,counter)=2;
        counter=counter+1;
        flag=3;
        H(r,c)=2;
    elseif H(r+1,c-1)==2
        r=r+1;
        c=c-1;
        newvector(1,counter)=5;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r-1,c-1)==2
        r=r-1;
        c=c-1;
        newvector(1,counter)=3;
        counter=counter+1;
        H(r,c)=2;
        
    else
        flag=0;
    end
elseif flag==3
    if H(r-1,c)==1
        r=r-1;
        newvector(1,counter)=2;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r,c-1)==1
        c=c-1;
        newvector(1,counter)=4;
        counter=counter+1;
        flag=2;
        H(r,c)=2;
    elseif H(r-1,c-1)==1
        r=r-1;
        c=c-1;
        newvector(1,counter)=3;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r-1,c+1)==1
        r=r-1;
        c=c+1;
        newvector(1,counter)=1;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r,c+1)==1
        
        c=c+1;
        newvector(1,counter)=0;
        counter=counter+1;
        flag=0;
        H(r,c)=2;
        
    elseif H(r-1,c)==2
        r=r-1;
        newvector(1,counter)=2;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r,c-1)==2
        c=c-1;
        newvector(1,counter)=4;
        counter=counter+1;
        flag=2;
        H(r,c)=2;
    elseif H(r-1,c-1)==2
        r=r-1;
        c=c-1;
        newvector(1,counter)=3;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r-1,c+1)==2
        r=r-1;
        c=c+1;
        newvector(1,counter)=1;
        counter=counter+1;
        H(r,c)=2;
    elseif H(r,c+1)==2
        
        c=c+1;
        newvector(1,counter)=0;
        counter=counter+1;
        flag=0;
        H(r,c)=2;
    else
        flag=1;
    end
end

end

r=r_org;
c=c_org;
end
    