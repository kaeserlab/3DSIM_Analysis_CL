function [binary_image_G]=binary_image_gaussian(binary_image,sigma)

image_8bit=binary_image*255; % convert image to double
image_8bit_gaussian=imgaussfilt3(image_8bit,sigma); % gnerate gaussian filtered image with sigma of 2
binary_image_G=image_8bit_gaussian>0; % convert back to binary