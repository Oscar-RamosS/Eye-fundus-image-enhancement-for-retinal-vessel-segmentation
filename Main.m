%Please cite the following paper whether you use partially or completely this code:
%
% Ramos-Soto, Oscar, et al. "An efficient retinal blood vessel segmentation 
% in eye fundus images by using optimized top-hat and homomorphic filtering." 
% Computer Methods and Programs in Biomedicine 201 (2021): 105949.
%
% AUTHOR:
%     Oscar Ramos-Soto, Universidad de Guadalajara, División de electrónica y computación, Mexico,
%     email:osc.ramoss@gmail.com

%In order to obtain different results for your purposes, modify the
%structural elements sizes(Se1_size and Se2_size) and the sigma value(sigma)

clc 
clear all
close all

I = imread('02_test.tif');
I = I(:,:,2);%For green channel extraction

%Thin vessel enhancement
sigma = 20;
Se1_size = 4;
Se2_size = 24;
Thin_TH = Optimized_tophat(Se1_size,Se2_size,I);
Thin_Hf = HomoFilt(sigma,Thin_TH);

%Thick vessel enhancement
sigma = 2;
Se1_size = 8;
Se2_size = 16;
Thick_TH = Optimized_tophat(Se1_size,Se2_size,I);
Thick_Hf = HomoFilt(sigma,Thick_TH);

Final = mat2gray(Thick_Hf + Thin_Hf);


figure(1)
subplot(1,2,1)
imshow(I,[])
title('Green channel')
subplot(1,2,2)
imshow(Final,[])
title('Enhancement')
figure(2)
subplot(1,2,1)
imshow(Thin_Hf,[])
title('Thin vessel enhancement')
subplot(1,2,2)
imshow(Thick_Hf,[])
title('Thick vessel enhancement')