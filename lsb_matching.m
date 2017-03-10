for i=1:100
    image=imread(['cover\' num2str(i) '.pgm']);
%    image=imresize(image,[256 256]);
Image=double(image);
alpha=0.5;
S=size(Image);
location=rand(S(1),S(2));
location(location<=alpha)=1;
location(location~=1)=0;
lsb_Image=mod(Image,2);
message=double(rand(S(1),S(2))>0.5);
% =rand(S(1),S(2))>0.5
Plus_Minus_ps=double(rand(S(1),S(2))>0.5);

randi(S(1),S(2));
message(location==0)=lsb_Image(location==0);
Plus_Minus=2*(Plus_Minus_ps-.5);
Image(lsb_Image~=message)=Image(lsb_Image~=message)+Plus_Minus(lsb_Image~=message);
I=uint8(Image);
imwrite(I,['stego\' num2str(i) '.pgm']);
end