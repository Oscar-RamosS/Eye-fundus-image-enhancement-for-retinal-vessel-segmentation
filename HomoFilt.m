%Please cite the following paper whether you use partially or completely this code:
%
% Ramos-Soto, Oscar, et al. "An efficient retinal blood vessel segmentation 
% in eye fundus images by using optimized top-hat and homomorphic filtering." 
% Computer Methods and Programs in Biomedicine 201 (2021): 105949.
%
% AUTHOR:
%     Oscar Ramos-Soto, Universidad de Guadalajara, División de electrónica y computación, Mexico,
%     email:osc.ramoss@gmail.com

function [Hf] = HomoFilt(sigma,I)
Ihf = im2double(I);
Ihf  = log(1 + Ihf );
M = 2*size(Ihf ,1) + 1;
N = 2*size(Ihf ,2) + 1;
[X, Y] = meshgrid(1:N,1:M);
centerX = ceil(N/2); 
centerY = ceil(M/2); 
gaussianNumerator = (X - centerX).^2 + (Y - centerY).^2;
H = exp(-gaussianNumerator./(2*sigma.^2));
H = 1 - H; 
H = fftshift(H);
If = fft2(Ihf , M, N);
Iout = real(ifft2(H.*If));
Iout = Iout(1:size(Ihf ,1),1:size(Ihf ,2));
Ihmf = im2uint8(exp(Iout) - 1);
Hf = Ihmf;
end