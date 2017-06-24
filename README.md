# DavLUT
A variety of Look-Up Tables (LUTs), some of which will be more useful than others.

# DavLUT/
I created this LUT as a color-blind friendly scheme, in that it should be less-awful than some of the regular LUTs out there (hello Jet)
![DavLUT with MinBrightness=1](DavLUT/DavLUT(MinBrightness=1).png?raw=true "DavLUT with MinBrightness=1")

This folder contains these files:
  - DavLUTgen.m - Function to generate and save a colormap in MATLAB.
  - DavLUT_demo.m - Demonstration of the above function using various plots in MATLAB
  - DavLUT with MinBrightness=0.4 LUT file for ImageJ (copy into the 'luts' folder). Includes a brightness gradient to dim lower values.
  - DavLUT with MinBrightness=1 LUT file for ImageJ. No brightness gradient (perceptually even). Good for scatter plots where you want your low values to still be visible!
  - PNG files showing output of the demo script for DavLUT, Jet, and Parula colormaps.
  - PNG files showing simulations of the three main dichromacies
