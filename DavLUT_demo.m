% DavLUT_demo - runs a demonstration of the DavLUTgen function

% options
LUT_bins = 100;         % number of color bins
BrightnessMin = 0.4;    % reduce brightness of the lowest bin to this factor
BrightnessMax = 1;      % reduce brightness of the highest bin to this factor

% make the colormap
CustomColorMap = DavLUTgen(LUT_bins,BrightnessMin,BrightnessMax);
CustomCMapTitle = 'DavLUT';

% uncomment to compare against other colormaps:

    % CustomColorMap = parula(LUT_bins);
    % CustomCMapTitle = 'MATLAB - Parula';

    % CustomColorMap = jet(LUT_bins);
    % CustomCMapTitle = 'MATLAB - Jet';


% Show RGB values and peaks demo
figure('Position',[100 100 1200 400]);

% show RGB values
subplot(1,3,1)
hold on
plot(1:LUT_bins,CustomColorMap(:,1),'r')
plot(1:LUT_bins,CustomColorMap(:,2),'g')
plot(1:LUT_bins,CustomColorMap(:,3),'b')
xlabel('Cmap Index')
ylabel('Intensity')
axis([0 LUT_bins 0 1])
title([{'RGB Intensity';CustomCMapTitle}]);
legend({'R','G','B'},'Location','northeastoutside','FontSize',6,'FontWeight','normal')
axis square tight

% show demo data using the Peaks function
subplot(1,3,2)
peaks(500);
peaks_surf = findobj('EdgeColor','k');
set(peaks_surf,'EdgeColor','none');
title(['Peaks - ',CustomCMapTitle]);
view(2)
axis tight square
colormap(CustomColorMap);
axis square tight
colorbar('eastoutside')

subplot(1,3,3)
peaks(500);
peaks_surf = findobj('EdgeColor','k');
set(peaks_surf,'EdgeColor','none');
title(['Peaks - ',CustomCMapTitle]);
colormap(CustomColorMap);
axis square tight


% convert to 8-bit RGB values (n.b. check LUT_bins matches your intent!
% i.e. set to 256 for 8-bit indexed images)
CustomColorMap_8bit = floor(CustomColorMap * 255);
