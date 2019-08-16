clear all

rgb = imread('33.jpg');
imshow (rgb)
sd = skinAndEdges(rgb)
BW4 = MorphologyOperation(sd)
figure,imshow(BW4); title('gradient');
%[a,b,c,d,e,f]  = EyeAndMouthDetection(BW4)
%th = Verification(a,b,c,d,e,f)
%if th < 2.5
%    H = vision.TextInserter('eye left');
%    H.Location = [a,b];
%    InsertedImage = step(H, rgb);
%    H2 = vision.TextInserter('eye right');
%    H2.Location = [c,d];
%    InsertedImage2 = step(H2,InsertedImage);
%    imshow(InsertedImage2)
%end

