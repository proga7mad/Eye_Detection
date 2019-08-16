function BW1 = GetTheBiggest(I)

[L, num] = bwlabel(I, 8);
count_pixels_per_obj = sum(bsxfun(@eq,L(:),1:num));
[~,ind] = max(count_pixels_per_obj);
BW1 = (L==ind);
    
end