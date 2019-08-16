function [a,b] = GetMouthLocation(I)

a = 0
[r c p]= size(I);
b = round(c/2)
m = []
for i = 1:r
    if I(i,b) == 1
        m(end+1) = i
        break
    end
end

a = median(m);


end