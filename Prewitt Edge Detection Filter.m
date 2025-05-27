% Prewitt Filtresi 1306210068 Hafize Hale Ertem
I = imread('cameraman.tif');
I = double(I);

max_r = size(I,1);
max_c = size(I,2);
G = zeros(max_r,max_c);

% Prewitt maskesi kullanılarak gradyan hesaplamaları yapılıp bulunan değerlerle G matrisi oluşturuldu
for i=1:max_r-2
    for j=1: max_c-2
        Gx= -I(i,j) +I(i,j+2) 
            -I(i+1,j) +I(i+1,j+2) 
            -I(i+2,j) +I(i+2,j+2);
        Gy= I(i,j) -I(i,j+2)
            I(i+1,j) -I(i+1,j+2)
            I(i+2,j) -I(i+2,j+2);
        G(i,j)= sqrt(Gx^2 + Gy^2);
    end    
end    

subplot(1,2,1)
imshow(uint8(I));
title('orijinal görüntü');

subplot(1,2,2);
imshow(mat2gray(G));
title('prewitt filtresi');


