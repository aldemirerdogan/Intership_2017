
function [finalImage] = myconv(Image, Masking)
dfdfd
% How to: myconv(Image, Masking)
% Image - The image wanted to be masked
% Masking - The masking filter

I=Image;
I=I(:,:,1);
s=size(I);
Mask=Masking;
sMask=size(Mask);
sImage=size(I);

convMatrix=zeros(sMask(1),sMask(2));
for r=1:sMask(1) % this loop creates the matrix which is when multiplied with the filter, mirrors the matrix by X and Y axis
    convMatrix(r,sMask(1)-r+1)=1;
end
convMask=Mask*convMatrix;
convMask=convMatrix*convMask; % convolution matrix is ready

newImage=zeros(sImage(1)+2*(sMask(1)-1),sImage(2)+2*(sMask(2)-1)); % create new image matrix with zeros
newImage(sMask(1):sImage(1)+sMask(1)-1,sMask(2):sImage(2)+sMask(2)-1)=I(:,:); % paste the image onto the new matrix with zeros


finalImage=zeros(sImage(1)+2*floor(sMask(1)/2),sImage(2)+2*floor(sMask(2)/2)); % final result will be stored to this matrix
for r=1:sImage(1)+2*floor(sMask(1)/2) % this loops applies the convolution calculation
    for c=1:sImage(2)+ 2*floor(sMask(2)/2)
        finalImage(r,c)=sum(sum(newImage(r:r+sMask(1)-1,c:c+sMask(2)-1).*convMask));
    end
end


myvalue=finalImage;
itsvalue=conv2(double(I),Mask);
imshow(myvalue-itsvalue);


