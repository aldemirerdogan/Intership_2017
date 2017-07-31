clear all
load liver_GT;

I=liver_GT(:,:,40);
I=I(:,:,1);
D=I;
D=double(D);
conv2(D,ones(3));
D=double(D);
conv2(D,ones(3));
conv2(D,ones(3),'same');
D=logical(ans)-logical(D);

[v,r,c,r_size,c_size]=f8encoder(I);
result=f8decoder(v,r,c,r_size,c_size);

first=binary(D);
second=binary(result);


fill_first=imfill(first);
fill_second=imfill(second);


test=isequal(fill_first,fill_second);
imshow(fill_first-fill_second);

