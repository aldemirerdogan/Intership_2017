function[holdmatrix_1,number_of_max] = findmaxvalue(A)
%%this function finds max values from a vector it takes one vector A,and
%%gives a vector max values and how many there are exist
s=size(A);
B=zeros(1,s(2)+1);
B(1:s(2))=A;
counter=1;
a=1;
%% there are two control counter which is defined counter. this counter controls which value is controled
%control value controls processing which value is written max or min
%vector.
while counter <s(2)
    control=0;
    while B(counter)<B(counter+1)&& counter <s(2)
    counter=counter+1;
    control=1;
  end
     holdmatrix_1(1,a)=B(counter);
    while B(counter)>B(counter+1) && counter <s(2)
        
    counter=counter+1;
    control=-1;
    end
      holdmatrix_2(1,a)=B(counter);
    a=a+1;
end
number1=size(holdmatrix_1);
number_of_max=number1(2);
number2=size(holdmatrix_1);
number_of_min=number2(2);

