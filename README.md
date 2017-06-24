# DavLUT
A variety of Look-Up Tables (LUTs), some of which will be more useful than others.

Each sub folder contains a file to generate that LUT in MATLAB as well as some sample images.
The 'DavLUT' folder includes sample images using the Jet and Parula colormaps.
The 'Color Deficiency Checks' folder contains images representing the three main color deficiencies protanpia, deutanopia, and tritanopia.
The 'Sample Images' folder contains the same SMLM image displayed with all the available LUTs.

In the root folder, LUTdemofig.m will create the demo figure containing various plots using a particular LUT; it will also spit out the .lut file, e.g. to copy into ImageJ's LUT folder.

The TotalLUTshow.m script will create two demo figures, one full colour and one converted to greyscale. The MakeAllLUTs.m script will generate colour and greyscale demo figures for all the LUTs in this repo.

## DavLUT (the eponymous LUT)
I created this LUT as a color-blind friendly scheme, in that it should be less-awful than some of the regular LUTs out there (hello Jet).

![DavLUT](DavLUT/DavLUT_colour.png?raw=true "DavLUT")

### Simulated Dichromacy

The demo image, as seen by someone with protanopia:

![DavLUT - Protanope](Color%20Deficiency%20Checks/DavLUT-Bright-Inverted_colour.png-Protanope.png?raw=true "DavLUT - Protanope")

The demo image, as seen by someone with deutanopia:

![DavLUT - Deuteranope](Color%20Deficiency%20Checks/DavLUT-Bright-Inverted_colour.png-Deuteranope.png?raw=true "DavLUT - Deuteranope")

The demo image, as seen by someone with tritanopia:

![DavLUT - Tritanope](Color%20Deficiency%20Checks/DavLUT-Bright-Inverted_colour.png-Tritanope.png?raw=true "DavLUT - Tritanope")


