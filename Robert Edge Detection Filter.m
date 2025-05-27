% Robert Filtresi 1306210068 Hafize Hale Ertem
I = imread('cameraman.tif');
I = double(I);

max_r = size(I,1);
max_c = size(I,2);
G = zeros(max_r,max_c);

% Robert maskesi kullanılarak gradyan hesaplamaları yapılıp bulunan değerlerle G matrisi oluşturuldu
for i=1:max_r-1
    for j=1: max_c-1
        Gx= I(i,j)-I(i+1,j+1);
        Gy= -I(i,j+1)+I(i+1,j);
        G(i,j)= sqrt(Gx^2 + Gy^2);
    end    
end    

subplot(1,2,1)
imshow(uint8(I));
title('orijinal görüntü');

subplot(1,2,2);
imshow(mat2gray(G));
title('robert filtresi');
