function filtro_imagen(x,y)

imageA = imread('lena_limpia','bmp');
figure; imshow(imageA);
title('Imagen Original');

 

fftA = fft2(double(imageA));

modulo=abs(fftA);
modulo(1:x,1:x)=                            zeros(x,x);
modulo((1024-x+1):1024,1:x)=                zeros(x,x);
modulo(1:x,(1024-x+1):1024)=                zeros(x,x);
modulo((1024-x+1):1024,(1024-x+1):1024)=    zeros(x,x);

fftC=modulo.*exp(i*angle(fftA));
imageC=ifft2(fftC);
cmin=min(min(abs(imageC)));
cmax=max(max(abs(imageC)));
figure, imshow(abs(imageC),[cmin,cmax]),colormap gray
title('Imagen altas_frecuancias');

modulo=abs(fftA);
modulo((512-y+1):(512+y),(512-y+1):(512+y))=zeros((2*y),(2*y));

fftC=modulo.*exp(i*angle(fftA));
imageC=ifft2(fftC);
cmin=min(min(abs(imageC)));
cmax=max(max(abs(imageC)));
figure, imshow(abs(imageC),[cmin,cmax]),colormap gray
title('Imagen con filtro bajas frecuencias');
