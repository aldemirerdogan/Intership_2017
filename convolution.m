
Mask=[0,0,0,0,0;0,0,-1,0,0;0,-1,5,-1,0;0,0,-1,0,0;0,0,0,0,0];
% Mask=[1,1,1;1,0,1;1,1,1];
% load woman;
% I=X;
I=imread('car.jpg');
I=I(:,:,1);
% I=[1,2,3,4;5,6,7,8;9,10,11,12];
s=size(I);
H=Mask;
sMask=size(H);
sImage=size(I);

convMatrix=zeros(sMask(1),sMask(2));
for r=1:sMask(1)
    convMatrix(r,sMask(1)-r+1)=1;
end
convMask=H*convMatrix;
convMask=convMatrix*convMask;

newImage=zeros(sImage(1)+2*(sMask(1)-1),sImage(2)+2*(sMask(2)-1)); % create new image matrix with zeros
newImage(sMask(1):sImage(1)+sMask(1)-1,sMask(2):sImage(2)+sMask(2)-1)=I(:,:);


finalImage=zeros(sImage(1)+2*floor(sMask(1)/2),sImage(2)+2*floor(sMask(2)/2));
for r=1:sImage(1)+floor(sMask(1)/2)+1
    for c=1:sImage(2)+ floor(sMask(2)/2)+1
        finalImage(r,c)=sum(sum(newImage(r:r+sMask(1)-1,c:c+sMask(2)-1).*convMask));
    end
end

%imshow(uint8(finalImage));
myvalue=finalImage;
itsvalue=conv2(double(I),Mask);
imshow(myvalue-itsvalue);




%figure(2);imshow(double(mod(newImage,256)));
%figure(2);imshow(double(newImage));


