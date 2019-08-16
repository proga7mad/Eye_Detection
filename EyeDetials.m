function c1 = EyeDetials(img_orig)

 
   
   %ycbcr segmentation
   img_ycbcr= img_orig;  %image from the previous segmentation
   ycbcr=rgb2ycbcr(img_ycbcr);
   cb=ycbcr(:,:,2);
   cr=ycbcr(:,:,3);
   y=ycbcr(:,:,1);
  
   
    %Detect Skin
    %[r,c,v] = find(cb>=77 & cb<=127 & cr>>=133 & cr<=173);
     [r c v] = find(cb>=77 & cb <=127 & cr>=133 & cr<173);
    numid = size(r,1);
   
    %Mark Skin Pixels
    for i=1:numid
        img_ycbcr(r(i),c(i),:) = 0;
       % bin(r(i),c(i)) = 1;
    end
   
    figure
    title('ycbcr segmentation');
   imshow(img_ycbcr);
   
   

[row col p]= size( img_ycbcr );

mage_tst = img_ycbcr(1:row,1:col/2,:);


image_tdt = img_ycbcr(1:row,col/2:col,:);


figure
imshow(mage_tst);

figure
imshow(image_tdt);



c1 = mage_tst
%boxImage = imread('D:\Aftkasat\11026145_487032461501591_7970556899183448799_n.jpg');
%figure
%imshow(boxImage);
%title('Image of a Box');

%sceneImage = imread('D:\Aftkasat\11026145_487032461501591_7970556899183448799_n - Copy.jpg');
%figure
%imshow(sceneImage);
%title('Image of a Cluttered Scene');


%boxPoints = detectSURFFeatures(boxImage);
%scenePoints = detectSURFFeatures(sceneImage);

%figure
%imshow(boxImage);
%title('100 Strongest Feature Points from Box Image');
 % hold on;

%plot(selectStrongest(boxPoints, 100));


end

