% DavLUT_demo - runs a demonstration of the DavLUTgen function

% options
LUT_bins = 256;         % number of color bins ... use 256 for ImageJ LUT
BrightnessMin = 1;    % reduce brightness of the lowest bin to this factor
BrightnessMax = 1;      % reduce brightness of the highest bin to this factor
OutputName = 'DavLUT.lut';    % filename to save the colourmap to. Use .lut extension for ImageJ
OutputDelimiter = ' ';		% delimiter ... use a space for ImageJ LUT

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
subplot(1,4,1)
hold on
plot(1:LUT_bins,CustomColorMap(:,1),'r')
plot(1:LUT_bins,CustomColorMap(:,2),'g')
plot(1:LUT_bins,CustomColorMap(:,3),'b')
xlabel('Cmap Index')
ylabel('Intensity')
axis([0 LUT_bins 0 1])
title({'RGB Intensity';CustomCMapTitle});
legend({'R','G','B'},'Location','northeastoutside','FontSize',6,'FontWeight','normal')
axis square tight

% show demo data using the Peaks function
subplot(1,4,2)
surf(peaks(500), 'EdgeColor', 'none')
title(['Peaks - ',CustomCMapTitle]);
view(2)
axis tight square
colormap(CustomColorMap);
axis square tight
colorbar('eastoutside')

subplot(1,4,3)
surf(peaks(500), 'EdgeColor', 'none')
title(['Peaks - ',CustomCMapTitle]);
colormap(CustomColorMap);
axis square tight

subplot(1,4,4)
z = linspace(0,4*pi,500);
x = 2*cos(z) + rand(1,500) + z;
y = 2*sin(z) + rand(1,500);
scatter3(x,y,z,10,z,'filled')
view(-45,15)
view(0,90)
% whitebg(gcf,'k')
set(gca,'Color',[0.2 0.2 0.2])
colormap(CustomColorMap);
axis square tight

% convert to 8-bit RGB values (n.b. check LUT_bins matches your intent!
% i.e. set to 256 for 8-bit indexed images)
CustomColorMap_8bit = floor(CustomColorMap * 255);

dlmwrite(OutputName,CustomColorMap_8bit,'delimiter',OutputDelimiter);

%% greyscale version
% % convert to 8-bit RGB values (n.b. check LUT_bins matches your intent!
% % i.e. set to 256 for 8-bit indexed images)
% CustomColorMap_8bit = floor(CustomColorMap * 255);

%convert to greyscale ... weights from discussion at https://stackoverflow.com/questions/687261/converting-rgb-to-grayscale-intensity
CustomColorMap_Greys = zeros(size(CustomColorMap,1),3);
CustomColorMap_Greys(:,1) = 0.3*CustomColorMap(:,1) + 0.59 * CustomColorMap(:,2) + 0.11 * CustomColorMap(:,3);
CustomColorMap_Greys(:,2) = CustomColorMap_Greys(:,1);
CustomColorMap_Greys(:,3) = CustomColorMap_Greys(:,1);

figure 
% show RGB values
subplot(1,4,1)
hold on
plot(1:LUT_bins,CustomColorMap(:,1),'r')
plot(1:LUT_bins,CustomColorMap(:,2),'g')
plot(1:LUT_bins,CustomColorMap(:,3),'b')
xlabel('Cmap Index')
ylabel('Intensity')
axis([0 LUT_bins 0 1])
title({'RGB Intensity';CustomCMapTitle});
legend({'R','G','B'},'Location','northeastoutside','FontSize',6,'FontWeight','normal')
axis square tight

% show demo data using the Peaks function
subplot(1,4,2)
surf(peaks(500), 'EdgeColor', 'none')
title(['Peaks - ',CustomCMapTitle]);
view(2)
axis tight square
colormap(CustomColorMap_Greys);
axis square tight
colorbar('eastoutside')

subplot(1,4,3)
surf(peaks(500), 'EdgeColor', 'none')
title(['Peaks - ',CustomCMapTitle]);
colormap(CustomColorMap_Greys);
axis square tight

subplot(1,4,4)
z = linspace(0,4*pi,500);
x = 2*cos(z) + rand(1,500) + z;
y = 2*sin(z) + rand(1,500);
scatter3(x,y,z,10,z,'filled')
view(-45,15)
whitebg(1,'k')
colormap(CustomColorMap_Greys);
axis square tight
