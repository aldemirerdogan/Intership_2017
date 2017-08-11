clear
clc
load liver_GT;

size_I=size(liver_GT);

counter=1;

for n=1:size_I(3)
    
    I=liver_GT(:,:,n);
    
    % Image contour made with convolution and filled with imfill
    B=boundary(liver_GT(:,:,n));
    B=logical(B);
    B=double(B);
    B_fill=imfill(B);    
    B=logical(B);
    B_fill=logical(B_fill);
    
    % From image contour back to the original image
    BO=B_fill-B;
    
    % Encoded & Decoded Image, filled with imfill
    F=F8Test(liver_GT(:,:,n));
    F=logical(F);
    F=double(F);
    F_fill=imfill(F);  
    F=logical(F);
    F_fill=logical(F_fill);
    F_fill=F_fill(2:end-1,2:end-1);
    F=F(2:end-1,2:end-1);
    
    
    % Testing the original image and the one from the contour
    test_boundary_original(1,counter)=isequal(BO,I);
    
    % Testing the contour filled image and chaincode filled image
    test_boundary_chain(1,counter)=isequal(B_fill,F_fill);
    
    test(1,counter)=isequal(B,F);
    counter=counter+1;
end
    