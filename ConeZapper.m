% PSYCH 221 COURSE PROJECT
% This program takes in jpeg images and first makes the RGB to  XYZ
% conversion. Then assuming either the L cone or the M cone is missing, it
% deletes information related to the cone of interest and then reconverts
% it into the RGB space. This image roughly represents the normal image
% perceived by a dichromat. Then, subtracting this from the original image,
% we find the information lost when the image is seen by a dichromat. We
% then make a transformation on the error function so as to map it to
% something that could be perceived by a dichromat.
% For that we take the red component of the information, which is likely to
% be lost the most, and then using some weigth function add it to the blue
% and the red. Finally we add this new modified error function to the
% original image. When this image goes through the vischeck algorithm, now
% previously invisible details become visible.

% Protanopia: Due to absence or improper functioning of L-Cones.
% Deuteranopia: Due to absence or improper functioning of M-Cones.
% Tritanopia: Due to absence or improper functioning of S-Cones.

clear;
file_name = 'D:\Downloads\Fruits and Veggies';
% file_name = 'D:\Downloads\crayons-Normal';
% file_name = 'D:\Downloads\Ishihara Plate 3';
% file_name = 'D:\Downloads\Ishihara Plate 7';
% file_name = 'D:\Downloads\Ishihara Plate 8';

% Plate	Normal	r/g deficiency	total color blindness
%   3	  29        70                  x
%   7	  74        21                  x
%   8	  6          x                  x

typelist={'protanopia','deutanopia','tritanopia'};

% convert from RGB to LMS
RGBtoLMS = [17.8824,  43.5161,   4.11935;
            3.45565,  27.1554,   3.86714;
            0.0299566, 0.184309, 1.46709];

% convert from LMS to RGB (inverse of above)
LMStoRGB = [  0.0809444479   -0.130504409    0.116721066    ;
             -0.0102485335    0.0540193266  -0.113614708    ;
             -0.000365296938 -0.00412161469  0.693511405    ];
         
% LMStoRGB = inv(RGBtoLMS);

RGBtoXYZ = [0.7328  0.4296 -0.1624 ;
		   -0.7036  1.6975  0.0061 ;
			0.0030  0.0136  0.9834];
        
XYZtoRGB = [1.0961 -0.2789  0.1827 ;
			0.4544  0.4735  0.0721 ; 
		   -0.0096 -0.0057  1.0153];
               
%Load image
% RGBimage = double(imread([file_name,'.jpg']));
RGBimage = double(imread('peppers.png'));

% % sim
% BlankBlock = zeros(50,50,3);
% RedBlock = BlankBlock;
% RedBlock(:,:,1) = 255;
% GrnBlock = BlankBlock;
% GrnBlock(:,:,2) = 255;
% BluBlock = BlankBlock;
% BluBlock(:,:,3) = 255;
% RGBimage = vertcat(RedBlock,GrnBlock,BluBlock);

ImageSize = size(RGBimage);

figure
subplot(4,4,1)
imshow(uint8(RGBimage))
subplot(4,4,2)
imshow(uint8(RGBimage(:,:,1)))
subplot(4,4,3)
imshow(uint8(RGBimage(:,:,2)))
subplot(4,4,4)
imshow(uint8(RGBimage(:,:,3)))


% transform each pixel (i,j) from RGB to LMS
% R --> L
% G --> M
% B --> S
LMSimage = NaN(ImageSize);
for i = 1:ImageSize(1)
    for j = 1:ImageSize(2)
        LMSimage(i,j,:) = RGBtoLMS * permute(RGBimage(i,j,:),[3 1 2]); %'
    end
end

% XYZimage = NaN(ImageSize);
% for i = 1:ImageSize(1)
%     for j = 1:ImageSize(2)
%         XYZimage(i,j,:) = RGBtoXYZ * permute(RGBimage(i,j,:),[3 1 2]); %'
%     end
% end

startpanel = 5;
for n = 1:3
% n=3
    type = typelist{n};

    %transormation matrices
    switch type

        case 'protanopia'
            %            L/Red          M/Green     S/Blue
            lms_tform = [0.0          2.02344      -2.52581       ;  % --> diminish L/Red, contribution from M/Green into 'red'.
                         0.0          1.0           0.0           ;
                         0.0          0.0           1.0           ];

        case 'deutanopia'
            lms_tform = [1.0          0.0           0.0           ;
                         0.494207     0.0           1.24827       ;  % --> diminish M/Grn, contribution from L/Red.
                         0.0          0.0           1.0           ];

        case 'tritanopia'
            lms_tform = [1.0          0.0           0.0           ;
                         0.0          1.0           0.0           ; 
                         -0.395913	  0.801109      0.0           ]; % --> diminish S/Blu, contribution with Yellow (M/L)

    end

    %Restrict each pixel (i,j) in LMSimage to colorblind range
    LMSrestricted = NaN(ImageSize);
    for i = 1:ImageSize(1)
        for j = 1:ImageSize(2)
            LMSrestricted(i,j,:) = lms_tform * permute(LMSimage(i,j,:),[3 1 2]); %'
        end
    end

%     %Restrict each pixel (i,j) in LMSimage to colorblind range
%     XYZrestricted = NaN(ImageSize);
%     for i = 1:ImageSize(1)
%         for j = 1:ImageSize(2)
%             XYZrestricted(i,j,:) = lms_tform * permute(XYZimage(i,j,:),[3 1 2]); %'
%         end
%     end
    
    %transform LMS(restricted) to RGB(restricted)
    RGBrestricted = NaN(ImageSize);
    for i = 1:ImageSize(1)
        for j = 1:ImageSize(2)
            RGBrestricted(i,j,:) = LMStoRGB * permute(LMSrestricted(i,j,:),[3 1 2]); %'
        end
    end
    
    if n==3
        Green = RGBrestricted(:,:,2);
        Blue = RGBrestricted(:,:,3);
        
        RGBrestricted(:,:,2) = Blue;
        RGBrestricted(:,:,3) = Green;
    end
%     %transform XYZ(restricted) to RGB(restricted)
%     RGBrestricted = NaN(ImageSize);
%     for i = 1:ImageSize(1)
%         for j = 1:ImageSize(2)
%             RGBrestricted(i,j,:) = XYZtoRGB * permute(XYZrestricted(i,j,:),[3 1 2]); %'
%         end
%     end
% figure
% imshow(uint8(RGBrestricted))
    subplot(4,4,startpanel)
    imshow(uint8(RGBrestricted))

    subplot(4,4,startpanel+1)
    imshow(uint8(RGBrestricted(:,:,1)))
    subplot(4,4,startpanel+2)
    imshow(uint8(RGBrestricted(:,:,2)))
    subplot(4,4,startpanel+3)
    imshow(uint8(RGBrestricted(:,:,3)))
    
    startpanel = startpanel + 4;
end

% figure
% subplot(2,3,1)
% imshow(uint8(RGBimage(:,:,1)))
% subplot(2,3,2)
% imshow(uint8(RGBimage(:,:,2)))
% subplot(2,3,3)
% imshow(uint8(RGBimage(:,:,3)))
% 
% subplot(2,3,4)
% imshow(uint8(RGBrestricted(:,:,1)))
% subplot(2,3,5)
% imshow(uint8(RGBrestricted(:,:,2)))
% subplot(2,3,6)
% imshow(uint8(RGBrestricted(:,:,3)))
% 
% RGBtoLMS = [43.5161,  17.8824,   4.11935;
%             3.45565,  27.1554,   3.86714;
%             0.299566, 1.84309, 14.6709];

%           case 'protanopia'
%             lms_tform = [0          2.02344     -2.52581    ;  % --> diminish L/Red, confusion with M/Grn.
%                          0          1           0           ;
%                          0          0           1           ];
% 
%         case 'deutanopia'
%             lms_tform = [1          0           0           ;
%                          0.494207   0           1.24827     ;  % --> diminish M/Grn, confusion with L/Red.
%                          0          0           1           ];
% 
%         case 'tritanopia'
%             lms_tform = [1          0           0           ;
%                          0          1           0           ; 
%                          -0.395913	0.801109    0           ]; % --> diminish S/Blu, confusion with Yellow (M/L)
% 
%         
        
        
% 
% %Restrict LMS to colorblind range
% LMS_r = zeros(ImageSize);
% for i = 1:ImageSize(1)
%     for j = 1:ImageSize(2)
%         lms = LMSimage(i,j,:);
%         lms = lms(:);
%         
%         LMS_r(i,j,:) = lms_tform * lms;
%     end
% end
% 
% %transform restricted LMS back to RGB
% RGB_r = zeros(ImageSize);
% for i = 1:ImageSize(1)
%     for j = 1:ImageSize(2)
%         lmsr = LMS_r(i,j,:);
%         lmsr = lmsr(:);
%         RGB_r(i,j,:) = LMStoRGB \ lmsr;
%     end
% end
% imshow(uint8(RGB_r))
% 
% 
% %calculate errors between two RGB values
% errorp = (RGBimage - RGB_p);
% errord = (RGBimage - RGB_d);
% errort = (RGBimage - RGB_t);
% 
% 
% 
% lms2lms_p = [0 2.02344 -2.52581; 0 1 0; 0 0 1] ; % protanopia - red deficiency
% lms2lms_d = [1 0 0; 0.494207 0 1.24827; 0 0 1] ; % deutanopia - green deficiency
% lms2lms_t = [1 0 0; 0 1 0; -0.395913 0.801109 0] ; % tritanopia - blue deficiency
% 
% 
% 
% %daltonize (modifying errors)
% err2mod_p = [0 0 0; .7 1 0; .7 0 1];
% err2mod_d = [.7 0 1; 0 0 0; .7 0 1];
% err2mod_t = [1 0 .7; .7 1 0; 0 0 0];
% 
% ERR_p = zeros(ImageSize);
% ERR_d = zeros(ImageSize);
% ERR_t = zeros(ImageSize);
% for i = 1:ImageSize(1)
%     for j = 1:ImageSize(2)
%         errp = errorp(i,j,:);
%         errp = errp(:);
%         ERR_p(i,j,:) = err2mod_p * errp;
%         
%         errd = errord(i,j,:);
%         errd = errd(:);
%         ERR_d(i,j,:) = err2mod_d * errd;
%         
%         errt = errort(i,j,:);
%         errt = errt(:);
%         ERR_t(i,j,:) = err2mod_t * errt;
%     end
% end
% 
% % boost deficient colours in the original image.
% dtnp = ERR_p + RGBimage;
% dtnd = ERR_d + RGBimage;
% dtnt = ERR_t + RGBimage;
% 
% %convert to uint8 for saving
% RGB_p = uint8(RGB_p);
% dtnp = uint8(dtnp);
% ERR_p = uint8(ERR_p);
% errorp = uint8(errorp);
% 
% RGB_d = uint8(RGB_d);
% dtnd = uint8(dtnd);
% ERR_d = uint8(ERR_d);
% errord = uint8(errord);
% 
% RGB_t = uint8(RGB_t);
% dtnt = uint8(dtnt);
% ERR_t = uint8(ERR_t);
% errort = uint8(errort);
% imshow(RGB_t)
% 
% % %write to file
% % imwrite(RGB_p,[file_name '_protanopic.jpg'],'jpeg');
% % imwrite(dtnp,[file_name '_protan_boosted.jpg'],'jpeg');
% % imwrite(errorp,[file_name '_protan_error.jpg'],'jpeg');
% % imwrite(ERR_p,[file_name '_protan_correction_factor.jpg'],'jpeg');
% % 
% % imwrite(RGB_d,[file_name '_deutanopic.jpeg'],'jpg');
% % imwrite(dtnd,[file_name '_deutan_boosted.jpg'],'jpeg');
% % imwrite(errord,[file_name '_deutan_error.jpg'],'jpeg');
% % imwrite(ERR_p,[file_name '_deutan_correction_factor.jpg'],'jpeg');
% % 
% % imwrite(RGB_t,[file_name '_tritanopic.jpg'],'jpeg');
% % imwrite(dtnt,[file_name '_tritan_boosted.jpg'],'jpeg');
% % imwrite(errort,[file_name '_tritan_error.jpg'],'jpeg');
% % imwrite(ERR_t,[file_name '_tritan_correction_factor.jpg'],'jpeg');




