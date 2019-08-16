function th = Verification (x2 , y2 , x1,y1 , x3,y3) 

%%
%Ecludean Distances Calculation
D1 = sqrt((x3-x1)^2+(y3-y1)^2);
D2 = sqrt((x3-x2)^2+(y3-y2)^2);

%%
%Get Thresholding
th = abs(D2 - D1);
end