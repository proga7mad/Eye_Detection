function aimage = SkinDetection(img) 

  
   %hsv segmentation
   hsv=rgb2hsv(img);
   h=hsv(:,:,1);
   s=hsv(:,:,2);
  
   [r c v]=find(h>0.25 | s<=0.15 | s>0.9); %non skin
   numid=size(r,1);
  
   for i=1:numid
       img(r(i),c(i),:)=0;
   end
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


aimage=img_rgb+img_ycbcr;

end

