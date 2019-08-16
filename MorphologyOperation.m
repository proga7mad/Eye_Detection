function im = MorphologyOperation(image)

%Structure Element
se = strel('disk',3);


a = imclearborder(image)
b = bwareaopen(a,3)
c = imclose(b,se)
d = imerode(c,se)
e = bwareaopen(d,45) %%remove small pixels
im = imclose(e ,se)

end