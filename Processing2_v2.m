%UNTESTED
%Downsample to 256x256. Cat photo to GT (2x collums)
%Images within series must share base file name
%Numbered prefix starting at 1, incrementing by 1
%format: (prefix)(basename)
%ex: 1_gt.png
%Outputs to location of script
location_photo = input('enter location of this photo series (slash at end):');
location_gt = input('enter location of this ground truth series (slash at end):');
baseName_photo = input('enter base name of this photo series:');
baseName_gt = input('enter base name of this ground truth series:');
outputName = input('enter desired base name of output series:');
iterations = input('enter number of images in this series:');
%should I use input('prompt', 's');?
for i = 1:1:iterations
    iteration = int2str(i);
    inputImage_photo = imread(strcat(location_photo, iteration, baseName_photo));
    inputImage_gt = imread(strcat(location_gt, iteration, baseName_gt));
    processImage_photo = imresize(inputImage_photo, [256 256]);
    processImage_gt = imresize(inputImage_gt, [256 256]);
    outputImage = cat(2, processImage_photo, processImage_gt);
    imwrite(outputImage, strcat(iteration, outputName));
end
disp('done!')
%UNTESTED