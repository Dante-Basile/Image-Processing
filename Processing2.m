%Downsample to 256x256. Cat photo to GT (2x collums)
%Images within series must share base file name.
%Numbered prefix starting at 1, incrementing by 1
%Photo must end in _im.png, GT ends _gt.png
%ex: 1_im.png
%Outputs to location of script
location_photo = input('enter location of this photo series (slash at end):');
location_gt = input('enter location of this ground truth series (slash at end):');
iterations = input('enter number of images in this series:');
%should I use input('prompt', 's');?
for i = 1:1:iterations
    iteration = int2str(i);
    inputImage_photo = imread(strcat(location_photo, iteration, '_im.png'));
    inputImage_gt = imread(strcat(location_gt, iteration, '_gt.png'));
    processImage_photo = imresize(inputImage_photo, [256 256]);
    processImage_gt = imresize(inputImage_gt, [256 256]);
    outputImage = cat(2, processImage_photo, processImage_gt);
    imwrite(outputImage, strcat(iteration, '_trainSample.jpg'));
end
disp('done!')