function fig = LUTdemofig(CustomColorMap, CustomCMapTitle)    
    LUT_bins = size(CustomColorMap,1);
    
    fig = figure('Position',[100 100 1200 400],'visible','off');
    p = uipanel('Parent',fig,'BorderType','none');
    p.Title = CustomCMapTitle;
    p.TitlePosition = 'centertop';
    p.FontSize = 12;
    p.FontWeight = 'bold';

    % plot RGB values
    subplot(2,2,1,'Parent',p)
    hold on
    if isequal(CustomColorMap(:,1), CustomColorMap(:,2), CustomColorMap(:,3))
        plot(1:LUT_bins,CustomColorMap(:,1),'k')
        legend({'Greys'},'Location','northeastoutside','FontSize',6,'FontWeight','normal')
    else
        plot(1:LUT_bins,CustomColorMap(:,1),'r')
        plot(1:LUT_bins,CustomColorMap(:,2),'g')
        plot(1:LUT_bins,CustomColorMap(:,3),'b')
        legend({'R','G','B'},'Location','northeastoutside','FontSize',6,'FontWeight','normal')
    end
    xlabel('Cmap Index')
    ylabel('Intensity')
    axis([0 LUT_bins 0 1])
    title({'RGB Intensity';CustomCMapTitle});
    
    axis square tight

    % plot function from https://jakevdp.github.io/blog/2014/10/16/how-bad-is-your-colormap/
    subplot(2,2,2,'Parent',p)
    x = repmat(linspace(0, 6, 300),300,1);
    y = repmat(linspace(0, 3, 300)',1,300);
    z= 10*(cos(x.^2) .* exp(-y));
    imshow(z)
    colormap(CustomColorMap);
    caxis([-10 10])
    axis square tight

    % plot peaks
    subplot(2,2,3,'Parent',p)
    surf(peaks(500), 'EdgeColor', 'none')
    colormap(CustomColorMap);
    axis square tight

    % plot 3D worm thing
    subplot(2,2,4,'Parent',p)
    z = linspace(0,4*pi,500);
    x = 2*cos(z) + rand(1,500) + z;
    y = 2*sin(z) + rand(1,500);
    scatter3(x,y,z,10,z,'filled')
    view(-45,15)
    view(0,90) % view(-45,15)
    set(gca,'Color',[0.2 0.2 0.2])
    colormap(CustomColorMap);
    axis square tight
    
    panel4pos = get(subplot(2,2,4),'Position');
    colorbar('Position', [panel4pos(1)+panel4pos(3)+0.02  panel4pos(2)  0.1  panel4pos(2)+panel4pos(3)*2.1]);
    
    fig.InvertHardcopy = 'off';
    set(fig, 'PaperUnits', 'inches', ...
             'PaperSize', [10 10], ...
             'PaperPositionMode', 'manual', ...
             'PaperPosition', [0 0 10 10], ...
             'Visible','off', ...
             'units','inches', ...
             'outerposition',[0 0 10 10]);