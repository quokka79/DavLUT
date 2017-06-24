#Sample Images

##Making 'flat' 3D SMLM images, coloured by z-position

I often forget how to do this, so I will write it here for, at the very least, my own sake.

1. Get your 3D data open in ThunderSTORM (process something or import something)
2. Click the 'Visualisation' button
    * Set Magnification to something nice, like 10
    * Set your z-range to something a bit tight so that your data are spread out across the full 'spectrum' of your LUT.
    * Uncheck 'colorize by Z'
    * Generate the image
3. Click Image > Hyperstack > Temporal Color Code
    * It should tell you that your slices and your frames have been switched. You can do this yourself beforehand via Image > Hyperstack > Re-order Hyperstack if you wish.
    * Select your favourite LUT from the menu and click Apply.
    * You should get a new image window with the flattened, coloured-by-z image.

The images in this folder were created with:
Z range (from:step:to)[nm] = -200:10:250 (the Temporal Color Coding places a 'frame number' in the colour bar)
Magnification=10
Method=Normalized Gaussian
