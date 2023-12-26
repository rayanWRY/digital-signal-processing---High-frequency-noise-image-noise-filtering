function output=butter_high(I)
Y=fft2(im2double(I));%傅里叶变换
Y=fftshift(Y);%坐标系转换
[M,N]=size(Y);
h=zeros(M,N);%滤波器函数
%图像中心点
M0=M/2;
N0=N/2;
d0=300;
%巴特沃斯滤波器的阶数
n_0=2;
for x=1:M
    for y=1:N
        distance=sqrt((x-M0)^2+(y-N0)^2);
        h(x,y)=1/(1+(d0/distance)^(2*n_0));%滤波器公式
    end
end
%滤波后结果
res=h.*Y;%频域相乘
output=real(ifft2(ifftshift(res)));%转换回时域、输出
end