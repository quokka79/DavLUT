# DavLUT
A variety of Look-Up Tables (LUTs), some of which will be more useful than others.

## DavLUT (the eponymous LUT)
I created this LUT as a color-blind friendly scheme, in that it should be less-awful than some of the regular LUTs out there (hello Jet).

This folder contains these files:
  - DavLUTgen.m - Function to generate and save a colormap in MATLAB.
  - DavLUT_demo.m - Demonstration of the above function using various plots in MATLAB
  - DavLUT with MinBrightness=0.4 LUT file for ImageJ (copy into the 'luts' folder). Includes a brightness gradient to dim lower values.
  - DavLUT with MinBrightness=1 LUT file for ImageJ. No brightness gradient (perceptually even). Good for scatter plots where you want your low values to still be visible!
  - PNG files showing output of the demo script for DavLUT, Jet, and Parula colormaps.
  - PNG files showing simulations of the three main dichromacies

![DavLUT](DavLUT/DavLUT_colour.png?raw=true "DavLUT")

### Simulated Dichromacy

The demo image, as seen by someone with protanopia:

![DavLUT - Protanope](Color%20Deficiency%20Checks/DavLUT-Bright-Inverted_colour.png-Protanope.png?raw=true "DavLUT - Protanope")

The demo image, as seen by someone with deutanopia:

![DavLUT - Deuteranope](Color%20Deficiency%20Checks/DavLUT-Bright-Inverted_colour.png-Deuteranope.png?raw=true "DavLUT - Deuteranope")

The demo image, as seen by someone with tritanopia:

![DavLUT - Tritanope](Color%20Deficiency%20Checks/DavLUT-Bright-Inverted_colour.png-Tritanope.png?raw=true "DavLUT - Tritanope")


