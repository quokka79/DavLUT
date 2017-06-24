% generate all the things!

cmap_DavLUT = DavLUT;
CustomCMapTitle = 'DavLUT';
OutputLUTname = 'DavLUT/DavLUT.lut'; 
OutputPNGname = 'DavLUT/DavLUT';
TotalLUTshow(cmap_DavLUT, CustomCMapTitle, OutputLUTname, OutputPNGname)

cmap_DavLUTBright = DavLUT(LUT_bins,1,1);
CustomCMapTitle = 'DavLUT (Bright)';
OutputLUTname = 'DavLUT/DavLUT-Bright.lut'; 
OutputPNGname = 'DavLUT/DavLUT-Bright';
TotalLUTshow(cmap_DavLUTBright, CustomCMapTitle, OutputLUTname, OutputPNGname)

% inverted DavLUT
cmap_DavLUTInverted = 1 - cmap_DavLUT;          % inverting the map can be an easy way around the problem
CustomCMapTitle = 'DavLUT (Bright Inverted)';   % of generating your plot on a white background when convention       
OutputLUTname = 'DavLUT/DavLUT-Inverted.lut';   % likes to have it on a black background, e.g. smlm reconstructions.
OutputPNGname = 'DavLUT/DavLUT-Inverted';       % Let your software use a black background and use the inverted LUT
TotalLUTshow(cmap_DavLUTInverted, CustomCMapTitle, OutputLUTname, OutputPNGname) % then invert the image yourself afterwards: normal LUT on white bg!

cmap_DavLUTBrightInverted = 1 - cmap_DavLUTBright;
CustomCMapTitle = 'DavLUT (Bright Inverted)';
OutputLUTname = 'DavLUT/DavLUT-Bright-Inverted.lut';
OutputPNGname = 'DavLUT/DavLUT-Bright-Inverted';
TotalLUTshow(cmap_DavLUTBrightInverted, CustomCMapTitle, OutputLUTname, OutputPNGname)

% Parula and Jet for comparison
cmap_Parula = parula(LUT_bins);
CustomCMapTitle = 'MATLAB - Parula';
OutputLUTname = 'DavLUT/Parula.lut';
OutputPNGname = 'DavLUT/Parula';
TotalLUTshow(cmap_Parula, CustomCMapTitle, OutputLUTname, OutputPNGname)

cmap_Jet = jet(LUT_bins);
CustomCMapTitle = 'MATLAB - Jet';
OutputLUTname = 'DavLUT/Jet.lut';
OutputPNGname = 'DavLUT/Jet';
TotalLUTshow(cmap_Jet, CustomCMapTitle, OutputLUTname, OutputPNGname)


% Extra LUTs, mostly for fun but there might be something useful to someone
% here!

% PeachPassion
cmap_PeachPassion = PeachPassion;
CustomCMapTitle = 'PeachPassion';
OutputLUTname = 'PeachPassion/PeachPassion.lut'; 
OutputPNGname = 'PeachPassion/PeachPassion';
TotalLUTshow(cmap_PeachPassion, CustomCMapTitle, OutputLUTname, OutputPNGname)

% Blu2Yel
cmapBlu2Yel = Blu2Yel;
CustomCMapTitle = 'Blu2Yel';
OutputLUTname = 'Blu2Yel/Blu2Yel.lut'; 
OutputPNGname = 'Blu2Yel/Blu2Yel';
TotalLUTshow(cmapBlu2Yel, CustomCMapTitle, OutputLUTname, OutputPNGname)

% Bubblegum
cmap_Bubblegum = Bubblegum;
CustomCMapTitle = 'Bubblegum';
OutputLUTname = 'Bubblegum/Bubblegum.lut'; 
OutputPNGname = 'Bubblegum/Bubblegum';
TotalLUTshow(cmap_Bubblegum, CustomCMapTitle, OutputLUTname, OutputPNGname)

% Candy
cmap_CandyBright = Candy(LUT_bins,1,1);
CustomCMapTitle = 'Candy (Bright)';
OutputLUTname = 'Candy/Candy-Bright.lut'; 
OutputPNGname = 'Candy/Candy-Bright';
TotalLUTshow(cmap_CandyBright, CustomCMapTitle, OutputLUTname, OutputPNGname)

cmap_Candy = Candy(LUT_bins,0.5,1);
CustomCMapTitle = 'Candy';
OutputLUTname = 'Candy/Candy.lut'; 
OutputPNGname = 'Candy/Candy';
TotalLUTshow(cmap_Candy, CustomCMapTitle, OutputLUTname, OutputPNGname)

cmap_CandyBrightInverted = 1 - cmap_CandyBright;
CustomCMapTitle = 'Candy (Bright Inverted)';
OutputLUTname = 'Candy/Candy-Bright-Inverted.lut';
OutputPNGname = 'Candy/Candy-Bright-Inverted';
TotalLUTshow(cmap_CandyBrightInverted, CustomCMapTitle, OutputLUTname, OutputPNGname)

% DavFire
cmap_DavFire = DavFire;
CustomCMapTitle = 'DavFire';
OutputLUTname = 'DavFire/DavFire.lut'; 
OutputPNGname = 'DavFire/DavFire';
TotalLUTshow(cmap_DavFire, CustomCMapTitle, OutputLUTname, OutputPNGname)

%MerryLUTmas
cmap_MerryLUTmas = MerryLUTmas;
CustomCMapTitle = 'MerryLUTmas';
OutputLUTname = 'MerryLUTmas/MerryLUTmas.lut'; 
OutputPNGname = 'MerryLUTmas/MerryLUTmas';
TotalLUTshow(cmap_MerryLUTmas, CustomCMapTitle, OutputLUTname, OutputPNGname)

% CharleyHorse
cmap_CharleyHorse = CharleyHorse;
CustomCMapTitle = 'CharleyHorse';
OutputLUTname = 'CharleyHorse/CharleyHorse.lut'; 
OutputPNGname = 'CharleyHorse/CharleyHorse';
TotalLUTshow(cmap_CharleyHorse, CustomCMapTitle, OutputLUTname, OutputPNGname)

% VioletCrumble
cmap_VioletCrumble = VioletCrumble;
CustomCMapTitle = 'VioletCrumble';
OutputLUTname = 'VioletCrumble/VioletCrumble.lut'; 
OutputPNGname = 'VioletCrumble/VioletCrumble';
TotalLUTshow(cmap_VioletCrumble, CustomCMapTitle, OutputLUTname, OutputPNGname)