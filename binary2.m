function [newImage] = binary2(I)
% binary(Image)
%Crops image into valued pixels
sImage=size(I);

for r=1:sImage(1) % find the top of the image
    for c=1:sImage(2)-1
        if I(r,c)==1
            r_top=r;
            break;
        end
    end
    if I(r,c)==1
            break;
    end
end


for r=sImage(1):-1:1 % find the bottom of the image
    for c=1:sImage(2)-1
        if I(r,c)==1
            r_bottom=r;
            break;
        end
    end
    if I(r,c)==1
            break;
    end
end

for c=1:sImage(2) % find the leftmost of the image
    for r=1:sImage(1)-1
        if I(r,c)==1
            c_left=c;
            break;
        end
    end
    if I(r,c)==1
            break;
    end
end

for c=sImage(2):-1:1 % find the rightmost of the image
    for r=1:sImage(1)-1
        if I(r,c)==1
            c_right=c;
            break;
        end
    end
    if I(r,c)==1
            break;
    end
end
newImage=I(r_top:r_bottom,c_left:c_right);
imshow(newImage);