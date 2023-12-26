%读取图像
I = imread('lena.bmp');%读取图像
[m, n, y] = size(I);%图像参数
%图像预处理
%subplot(6,2,1);
figure
imshow(I);
title('原图');
%F=rgb2gray(I);%rbg转灰度图
F=I;
F=im2double(F);%灰度uint8转double

%subplot(6,2,3);
figure
imshow(F);
title('灰度图');

F_fft = fft2(F);%求频域
%subplot(6,2,4);
figure
mesh(abs(fftshift(F_fft)));%频域图,将低频移到中间
title('频域图');
%高频高斯噪声
N=gauss(m,n);
%subplot(6,2,5);
figure
imshow(N);
title('高斯时域')

N_fft=fft2(N);%噪声频域
%subplot(6,2,6);
figure
mesh(abs(fftshift(N_fft)));
title('高斯频域')

N_high=butter_high(N);%高斯噪声过高频滤波器
%subplot(6,2,7);
figure
imshow(N_high);
title('高频高斯时域')

N_high_fft=fft2(N_high);
%subplot(6,2,8);
figure
mesh(abs(fftshift(N_high_fft)));
title('高频高斯频域')
%噪声与图像叠加
Y=N_high+F;%加性噪声
%subplot(6,2,9);
figure
imshow(Y);
title('加噪图');

Y_fft=fft2(Y);%加噪图的频谱
%subplot(6,2,10);
figure
mesh(abs(fftshift(Y_fft)));
title('加噪频域')
%图像低通处理
Y_low=butter_low(Y);%过低通滤波器
%subplot(6,2,11);
figure
imshow(Y_low);
title('滤波后时域图')

Y_low_fft=fft2(Y_low);%通过低通滤波器后的频谱
%subplot(6,2,12);
figure
mesh(abs(fftshift(Y_low_fft)));
title('滤波后频域')

