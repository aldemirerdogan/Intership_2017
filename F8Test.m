function [result] = F8Test(I)
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
if num_segment==0
    result=0;
    return;
end


    
[v,r,c,r_size,c_size]=f8_encoder(select_segment(L,1));
decoded=logical(zeros(r_size,c_size));
result=logical(zeros(r_size,c_size));
decoded(:,:,1)=f8decoder(v,r,c,r_size,c_size);
result=decoded(:,:,1);
if num_segment>1
    
for n=2:num_segment
    [v,r,c,r_size,c_size]=f8_encoder(select_segment(L,n));
    decoded(:,:,n)=f8decoder(v,r,c,r_size,c_size);
    result=result+decoded(:,:,n);
end

end



end