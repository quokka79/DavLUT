function TotalLUTshow(CustomColorMap, CustomCMapTitle, OutputLUTname, OutputPNGname)    
%TotalLUTshow Generates a demonstration image for the LUTs found lying around here.
% Be sure to add this folder with subfolders to your path!
%
% LUTs can be generated by calling the function named after the LUT:
%
%   cmap = LUTname;
%   cmap = LUTname(LUT_bins);
%   cmap = LUTname(LUT_bins, BrightnessMin, BrightnessMax);
%
% Without arguments the LUT will be generated with defaults, i.e. 256 bins  
% and various brightness gradients. You can supply the following arguments 
% to adjust the LUT to your needs:
%
%   LUT_bins(>1)            number of color bins ... use 256 for ImageJ LUT
%   BrightnessMin(0-1)       reduce brightness of the lowest bin to this factor
%   BrightnessMax(0-1)      reduce brightness of the highest bin to this factor

    DoColor = true;             % Make the colour demo image?
    DoGreyScale = true;         % Make the greyscale demo image?
    SavePNGs = true;            % Save the demo images?

    SaveLUT = true;             % Save the LUT values somewhere?
    OutputDelimiter = ' ';		% Use a space for ImageJ LUT

    if DoColor
        
        ColorFig = LUTdemofig(CustomColorMap,CustomCMapTitle);
        
        if  SavePNGs
            saveas(ColorFig,strcat(OutputPNGname,'_colour.png'));
            close(ColorFig);
        end
        
    end

    if SaveLUT
        
        CustomColorMap_8bit = floor(CustomColorMap * 255);
        dlmwrite(OutputLUTname,CustomColorMap_8bit,'delimiter',OutputDelimiter);
   
    end

    if DoGreyScale
        
        %convert to greyscale ... weights are from various places, e.g.:
        % https://stackoverflow.com/questions/687261/converting-rgb-to-grayscale-intensity
        CustomColorMap_Greys = zeros(size(CustomColorMap,1),3);
        CustomColorMap_Greys(:,1) = 0.299*CustomColorMap(:,1) + 0.587 * CustomColorMap(:,2) + 0.114 * CustomColorMap(:,3);
        CustomColorMap_Greys(:,2) = CustomColorMap_Greys(:,1);
        CustomColorMap_Greys(:,3) = CustomColorMap_Greys(:,1);

        GreyscaleFig = LUTdemofig(CustomColorMap_Greys,CustomCMapTitle);

        if  SavePNGs
            saveas(GreyscaleFig,strcat(OutputPNGname,'_greyscale.png'));
            close(GreyscaleFig);
        end

    end

end
