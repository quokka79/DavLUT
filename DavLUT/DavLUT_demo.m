% DavLUT_demo - runs a demonstration of the DavLUTgen function

% options
LUT_bins = 256;         % number of color bins ... use 256 for ImageJ LUT
BrightnessMin = 1;    % reduce brightness of the lowest bin to this factor
BrightnessMax = 1;      % reduce brightness of the highest bin to this factor
% OutputLUTname = 'DavLUT';    % filename to save the colourmap to. 
OutputLUText = '.lut';        %Use .lut extension for ImageJ
OutputDelimiter = ' ';		% delimiter ... use a space for ImageJ LUT

DoGreyScale = true;
DoColor = true;
SaveLUT = true;
SavePNGs = true;

% uncomment to compare against other colormaps:

%    CustomColorMap = DavLUTgen(LUT_bins,BrightnessMin,BrightnessMax);
%    CustomCMapTitle = 'DavLUT';
%    OutputLUTname = 'DavLUT/DavLUT.lut';
%    OutputPNGname = 'DavLUT/DavLUT';

%   CustomColorMap = parula(LUT_bins);
%   CustomCMapTitle = 'MATLAB - Parula';
%   OutputLUTname = 'Parula.lut';
%   OutputPNGname = 'DavLUT/Parula';

%     CustomColorMap = jet(LUT_bins);
%     CustomCMapTitle = 'MATLAB - Jet';
%     OutputLUTname = 'Jet.lut';
%     OutputPNGname = 'DavLUT/Jet';

% Extra LUTs, mostly for fun

  CustomColorMap = Aubergine(LUT_bins,BrightnessMin,BrightnessMax);
  CustomCMapTitle = 'Aubergine';
  OutputLUTname = 'Aubergine/Aubergine.lut'; 
  OutputPNGname = 'Aubergine/Aubergine';

%   CustomColorMap = Blu2Yel(LUT_bins,BrightnessMin,BrightnessMax);
%   CustomCMapTitle = 'Blu2Yel';
%   OutputLUTname = 'Blu2Yel/Blu2Yel.lut'; 
%   OutputPNGname = 'Blu2Yel/Blu2Yel';

%   CustomColorMap = Bubblegum(LUT_bins,BrightnessMin,BrightnessMax);
%   CustomCMapTitle = 'Bubblegum';
%   OutputLUTname = 'Bubblegum/Bubblegum.lut'; 
%   OutputPNGname = 'Bubblegum/Bubblegum';

%   CustomColorMap = Candy(LUT_bins,BrightnessMin,BrightnessMax);
%   CustomCMapTitle = 'Candy';
%   OutputLUTname = 'Candy/Candy.lut'; 
%   OutputPNGname = 'Candy/Candy';

%   CustomColorMap = DavFire(LUT_bins,BrightnessMin,BrightnessMax);
%   CustomCMapTitle = 'DavFire';
%   OutputLUTname = 'DavFire/DavFire.lut'; 
%   OutputPNGname = 'DavFire/DavFire';

%   CustomColorMap = MerryLUTmas(LUT_bins,BrightnessMin,BrightnessMax);
%   CustomCMapTitle = 'MerryLUTmas';
%   OutputLUTname = 'MerryLUTmas/MerryLUTmas.lut'; 
%   OutputPNGname = 'MerryLUTmas/MerryLUTmas';

%   CustomColorMap = Passionfruit(LUT_bins,BrightnessMin,BrightnessMax);
%   CustomCMapTitle = 'Passionfruit';
%   OutputLUTname = 'Passionfruit/Passionfruit.lut'; 
%   OutputPNGname = 'Passionfruit/Passionfruit';

%   CustomColorMap = VioletCrumble(LUT_bins,BrightnessMin,BrightnessMax);
%   CustomCMapTitle = 'VioletCrumble';
%   OutputLUTname = 'VioletCrumble/VioletCrumble.lut'; 
%   OutputPNGname = 'VioletCrumble/VioletCrumble';

if DoColor
    % Show RGB values and peaks demo
    colFig = figure('Position',[100 100 1200 400]);
    p = uipanel('Parent',colFig,'BorderType','none');
    p.Title = CustomCMapTitle;
    p.TitlePosition = 'centertop';
    p.FontSize = 12;
    p.FontWeight = 'bold';

    % show RGB values
    subplot(2,2,1,'Parent',p)
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
    subplot(2,2,2,'Parent',p)
    % surf(peaks(500), 'EdgeColor', 'none')
    % title(['Peaks - ',CustomCMapTitle]);
    % view(2)
    % axis tight square
    % colormap(CustomColorMap);
    % axis square tight
    % colorbar('eastoutside')
    x = repmat(linspace(0, 6, 300),300,1);
    y = repmat(linspace(0, 3, 300)',1,300);
    z= 10*(cos(x.^2) .* exp(-y));
    imshow(z)
    colormap(CustomColorMap_Greys);
    caxis([-10 10])
    axis square tight

    subplot(2,2,3,'Parent',p)
    surf(peaks(500), 'EdgeColor', 'none')
    colormap(CustomColorMap);
    axis square tight

    subplot(2,2,4,'Parent',p)
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
    
    panel4pos = get(subplot(2,2,4),'Position');
    colorbar('Position', [panel4pos(1)+panel4pos(3)+0.02  panel4pos(2)  0.1  panel4pos(2)+panel4pos(3)*2.1]);

    set(colFig, 'PaperUnits', 'inches', ...
                     'PaperSize', [10 10], ...
                     'PaperPositionMode', 'manual', ...
                     'PaperPosition', [0 0 10 10], ...
                     'Visible','on');
    set(colFig,'units','inches','outerposition',[0 0 10 10])
    
    if  SavePNGs
        %print('-dpng','-r300',strcat(OutputPNGname,'_colour.png'));
        colFig.InvertHardcopy = 'off';
        saveas(colFig,strcat(OutputPNGname,'_colour.png'));
        close(colFig);
    end
end

% convert to 8-bit RGB values (n.b. check LUT_bins matches your intent!
% i.e. set to 256 for 8-bit indexed images)
CustomColorMap_8bit = floor(CustomColorMap * 255);

if SaveLUT
    dlmwrite(strcat(OutputLUTname,OutputLUText),CustomColorMap_8bit,'delimiter',OutputDelimiter);
end
%% greyscale version
% % convert to 8-bit RGB values (n.b. check LUT_bins matches your intent!
% % i.e. set to 256 for 8-bit indexed images)
% CustomColorMap_8bit = floor(CustomColorMap * 255);
if DoGreyScale
    %convert to greyscale ... weights from various places:
    % https://stackoverflow.com/questions/687261/converting-rgb-to-grayscale-intensity
    % https://jakevdp.github.io/blog/2014/10/16/how-bad-is-your-colormap/ (also pinched the maths used in the second panel from here)
    CustomColorMap_Greys = zeros(size(CustomColorMap,1),3);
    CustomColorMap_Greys(:,1) = 0.299*CustomColorMap(:,1) + 0.587 * CustomColorMap(:,2) + 0.114 * CustomColorMap(:,3);
    CustomColorMap_Greys(:,2) = CustomColorMap_Greys(:,1);
    CustomColorMap_Greys(:,3) = CustomColorMap_Greys(:,1);

    gsFig = figure('Position',[100 100 1200 400]);
    p = uipanel('Parent',gsFig,'BorderType','none');
    p.Title = CustomCMapTitle;
    p.TitlePosition = 'centertop';
    p.FontSize = 12;
    p.FontWeight = 'bold';

    % show RGB values
    subplot(2,2,1,'Parent',p)
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
    subplot(2,2,2,'Parent',p)
    % surf(peaks(500), 'EdgeColor', 'none')
    % title(['Peaks - ',CustomCMapTitle]);
    % view(2)
    % axis tight square
    % colormap(CustomColorMap_Greys);
    % axis square tight
    % colorbar('eastoutside')
    x = repmat(linspace(0, 6, 300),300,1);
    y = repmat(linspace(0, 3, 300)',1,300);
    z= 10*(cos(x.^2) .* exp(-y));
    imshow(z)
    colormap(CustomColorMap_Greys);
    caxis([-10 10])
    axis square tight

    subplot(2,2,3,'Parent',p)
    surf(peaks(500), 'EdgeColor', 'none')
    title(['Peaks - ',CustomCMapTitle]);
    colormap(CustomColorMap_Greys);
    axis square tight

    subplot(2,2,4,'Parent',p)
    z = linspace(0,4*pi,500);
    x = 2*cos(z) + rand(1,500) + z;
    y = 2*sin(z) + rand(1,500);
    scatter3(x,y,z,10,z,'filled')
    view(0,90)
    set(gca,'Color',[0.2 0.2 0.2])
    colormap(CustomColorMap_Greys);
    axis square tight
    
    panel4pos = get(subplot(2,2,4),'Position');
    colorbar('Position', [panel4pos(1)+panel4pos(3)+0.02  panel4pos(2)  0.1  panel4pos(2)+panel4pos(3)*2.1]);

    set(gsFig, 'PaperUnits', 'inches', ...
                     'PaperSize', [10 10], ...
                     'PaperPositionMode', 'manual', ...
                     'PaperPosition', [0 0 10 10], ...
                     'Visible','on');
    set(gsFig,'units','inches','outerposition',[0 0 10 10])

    
    if  SavePNGs
%         print('-dpng','-r300',strcat(OutputPNGname,'_greyscale.png'));
        gsFig.InvertHardcopy = 'off';
        saveas(gsFig,strcat(OutputPNGname,'_greyscale.png'));
        close(gsFig);
    end
end