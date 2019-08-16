function [LEX LEY REX REY LM RM] = EyeAndMouthDetection (image)

%%
%Sperate Image to 3 Parts
[row col]= size(image);
image_top_left = image(1:row/2,1:col/2,:);
image_top_right = image(1:row/2,col/2+1:col,:);
image_bottom = image(row/2 + 1:row,1:col);

%%
%Get The Biggest Object in every part image
E_Left_Biggest = GetTheBiggest(image_top_left);
E_Right_Biggest = GetTheBiggest(image_top_right);
M_Biggest = GetTheBiggest(image_bottom);

%%
%Get the center point for every object
[LEX,LEY] = GetEyeLocation(E_Left_Biggest);
[TREX,TREY] = GetEyeLocation(E_Right_Biggest);
REX = TREX;
REY = round(col/2) + TREY;
[TLM,TRM] = GetMouthLocation(M_Biggest);
LM = round(row/2) + TLM;
RM = TRM;

end