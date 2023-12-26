function output=butter_low(I)
Y=fft2(im2double(I));%fft，注意进行uint8转double型
Y=fftshift(Y);%将坐标系移动到中心
[M,N]=size(Y);%获得图像的高度和宽度
h=zeros(M,N);%滤波器函数
%图像中心点
M0=M/2;
N0=N/2;
d0=200;%40、100
%巴特沃斯滤波器的阶数
n_0=2;
for x=1:M
    for y=1:N
        distance=sqrt((x-M0)^2+(y-N0)^2);
        h(x,y)=1/(1+(distance/d0)^(2*n_0));%滤波器函数
    end
end
%滤波后结果
res=h.*Y;%频域相乘
output=real(ifft2(ifftshift(res)));%输出
end