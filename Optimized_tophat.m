%Please cite the following paper whether you use partially or completely this code:
%
% Ramos-Soto, Oscar, et al. "An efficient retinal blood vessel segmentation 
% in eye fundus images by using optimized top-hat and homomorphic filtering." 
% Computer Methods and Programs in Biomedicine 201 (2021): 105949.
%
% AUTHOR:
%     Oscar Ramos-Soto, Universidad de Guadalajara, División de electrónica y computación, Mexico,
%     email:osc.ramoss@gmail.com

function [TH] = Optimized_tophat(Se1_size,Se2_size,I)
Icomp = imcomplement(I);
Se = strel('disk',Se1_size);
Isc = imopen(Icomp,Se);
Se2 = strel('disk',Se2_size);
Ift = imclose(Isc,Se2);
TH = Icomp - Ift;
end