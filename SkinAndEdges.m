function x = SkinAndEdges(img)

 
   %%
   %hsv segmentation
   hsv=rgb2hsv(img);
   h=hsv(:,:,1);
   s=hsv(:,:,2);
  
   [r c v]=find(h>0.25 | s<=0.15 | s>0.9); %non skin
   numid=size(r,1);
  
   for i=1:numid
       img(r(i),c(i),:)=0;
   end
  
   figure
   imshow(img);
  
  
   %%
   %ycbcr segmentation
   img_ycbcr= img;  %image from the previous segmentation
   ycbcr=rgb2ycbcr(img_ycbcr);
   cb=ycbcr(:,:,2);
   cr=ycbcr(:,:,3);
   y=ycbcr(:,:,1);
  
   
    %Detect Skin
    %[r,c,v] = find(cb>=77 & cb<=127 & cr>=133 & cr<=173);
     [r c v] = find(cb<=77 | cb >=127 | cr<=133 | cr>=173);
    numid = size(r,1);
   
    %Mark Skin Pixels
    for i=1:numid
        img_ycbcr(r(i),c(i),:) = 0;
       % bin(r(i),c(i)) = 1;
    end
   
    figure
    title('ycbcr segmentation');
   imshow(img_ycbcr);
  
  
  
  %%
  %rgb segmentation

img_rgb= img;
r=img_rgb(:,:,1);
g=img_rgb(:,:,2);
b=img_rgb(:,:,3);


[row col v]= find(r<95 |g<40 |b<20 |abs(r-g)<15 | r<g | r<b ); %non skin pixels
numid=size(row,1);
for i=1:numid
    
    img_rgb(row(i),col(i),:)=1;
end

figure
imshow(img_rgb);



aimage=img_rgb+img_ycbcr;

A=aimage;
B=rgb2gray(A);

C=double(B);





for i=1:size(C,1)-2
        for j=1:size(C,2)-2

        %Sobel mask for x-direction:
        Gx=((2*C(i+2,j+1)+C(i+2,j)+C(i+2,j+2))-(2*C(i,j+1)+C(i,j)+C(i,j+2)));
        %Sobel mask for y-direction:
        Gy=((2*C(i+1,j+2)+C(i,j+2)+C(i+2,j+2))-(2*C(i+1,j)+C(i,j)+C(i+2,j)));
     
        %The gradient of the image
        %B(i,j)=abs(Gx)+abs(Gy);
        B(i,j)=sqrt(Gx.^2+Gy.^2);
     
    end
end
figure,imshow(B); title('Sobel gradient');




%prewitt 
Aa=aimage;
Bb=rgb2gray(Aa);
C=double(Bb);
for i=1:size(C,1)-2

    for j=1:size(C,2)-2
        %Sobel mask for x-direction:
        Gx=((1*C(i+2,j+1)+C(i+2,j)+C(i+2,j+2))-(1*C(i,j+1)+C(i,j)+C(i,j+2)));
        %Sobel mask for y-direction:
        Gy=((1*C(i+1,j+2)+C(i,j+2)+C(i+2,j+2))-(1*C(i+1,j)+C(i,j)+C(i+2,j)));
     
        %The gradient of the image
        %B(i,j)=abs(Gx)+abs(Gy);
        Bb(i,j)=sqrt(Gx.^2+Gy.^2);
     
    end
end

figure,imshow(Bb); title('perwitt gradient');




c1=double(Bb);

c2=double(B);

c3=Bb+B;




figure,imshow(c3); title('and gradient');

x = c3
end

