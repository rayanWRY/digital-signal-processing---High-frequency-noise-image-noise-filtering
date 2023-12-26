function output=gauss(m,n)
%I=uint8(256*rand(m,n));%法1、直接用rand随机。
I=zeros(m,n);%法2、先生成一个0矩阵，再用imnoise给图片加高斯噪声
% 添加高斯白噪声给图像I,均值为m,方差为v.默认m = 0,v = 0.01
J=imnoise(I,'gaussian',0,0.5);
output=J;

end
