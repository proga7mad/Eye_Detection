function [a,b] = GetEyeLocation(I)

[r c p]= size(I);
 m = []
 n = []
for i = 1: r
    for j = 1: c 
         if I(i,j) == 1
             m(end+1) = i
             n(end+1) = j
         end
    end
end

a = median(m);
b = median(n);

end