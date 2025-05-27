% Histogram Germe İşlemi / Hafize Hale Ertem 1306210068

img = imread('pout.tif');

% verilen görüntü renkliyse siyah beyaz çevirilir
 if(size(img,3) > 1)
     img = rgb2gray(img);
 end;

max_r = size(img,1);
max_c = size(img,2);
streched_img = zeros(max_r,max_c); % Görüntünün gerilmiş hali için aynı boutlarda matris tanımlandı

% Histogram germe formülü img'a uygulanarak yeni görüntüye piksellerin ataması yapıldı (min(img(:)) img nin en küçük piksel değerini döndürür)
for r=1: max_r
    for c=1: max_c
        streched_img(r,c) = ( 255/(max(img(:))-min(img(:)))*(img(r,c)-min(img(:))) + 0 );
    end    
end    

subplot(2,2,1)
imshow(img);
title('Orijinal Görüntü')
subplot(2,2,2)
imshow(uint8(streched_img));
title('Histogram germe uygulanmış hali')
subplot(2,2,3)
imhist(img);
title('Orijinal fotoğraf histogramı')
ylim('auto');
subplot(2,2,4)
imhist(uint8(streched_img));
title('Gerilmiş Histogram')
ylim('auto');