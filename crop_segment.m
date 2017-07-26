
function [] = crop_segment(I)
L=bwlabel(I,8);

% crop_segment(Image)

num_segment=0; % will hold the number of different segments

sLabel=size(L);

for r=1:sLabel(1)   % find the number of the segments
    for c=1:sLabel(2)
        if L(r,c) > num_segment 
            num_segment=num_segment+1;
        end
    end
end

for num=1:num_segment
    segmented(:,:,num)=select_segment(L,num); % seperate each segment and place to various matrices
    figure(num);
    binary(logical(segmented(:,:,num))); % crop segment
end
