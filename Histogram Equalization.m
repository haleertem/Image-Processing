% Histogram Eşitleme İşlemi / Hafize Hale Ertem 1306210068

img = imread('pout.tif'); 

% verilen görüntü renkliyse siyah beyaz çevirilir
 if(size(img,3) > 1)
     img = rgb2gray(img);
 end;

 max_r = size(img,1);
 max_c = size(img,2);
 histogram = zeros([1 256]);
 cumulative_hist = zeros([1 256]);

 % görüntünün piksel sayısı değerleri hesaplandı ve diziye kaydedildi
 for r=1: max_r
     for c=1: max_c
         for count=1: 256
             if(img(r,c) == (count-1))
                 histogram(count) = histogram(count) + 1;
             end
         end
     end
 end;

 % T(r) hesaplamaları için toplam piksel sayısı hesaplandı
 total = 0;
 for i=1 : 256
     total= total + histogram(i);
 end    

 new_value = 0;
 normalized_hist = zeros([1 256]);

 % T(r) değerleri hesaplanıp(cumulative_hist) T'(r) hesaplamak için bu değerler normalize
 % edildi(normalized_hist)
 for i=1: 256
     if(i==1)
         cumulative_hist(i) = histogram(i) / total;  % (i-1)'de 0 döndürmemesi için i=1 olduğunda ayrı işlem yaptırdım
     else    

         new_value = histogram(i)/total + cumulative_hist(i-1);
    
         if(new_value <= 1)
             cumulative_hist(i) = new_value;
         else 
             cumulative_hist(i) = 1;  
         end  
     end

      normalized_hist(i) = round(cumulative_hist(i)*255);

 end    



equalized_img = zeros([max_r max_c]);

% histogramı eşitlenmiş görüntünün piksellerini belirledim
for r=1 : max_r
    for c=1 : max_c
        for count=1 : 256
            if(img(r,c) == count-1)
                equalized_img(r,c) = normalized_hist(count);

            end    
        end    
    end    
end    

figure(),
% ekranda 2 ye 2 lik grafik alan oluşturuldu
subplot(2,2,1)
imshow(img);
title('Orijinal fotoğraf');
subplot(2,2,2)
imshow(uint8(equalized_img));
title('Histogram Eşitlenmiş Hali')
subplot(2,2,3)
imhist(img);
title('Orijinal fotoğraf histogramı')
ylim('auto');
subplot(2,2,4)
imhist(uint8(equalized_img));
title('Eşitlenmiş Histogram')
ylim('auto');

