function [segmented] = select_segment (I,num)
% select_segment(Image, Segment value)
segmented=I;
sImage=size(segmented);

for r=1:sImage(1) % making all values equal to zero except the segment value
    for c=1:sImage(2)
        if segmented(r,c)~=num
            segmented(r,c)=0;
        end
    end
end