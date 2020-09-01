# Extracting-Sub-aperture-Image-of-Light-Field

This is a matlab code to extract sub-aperture images from the light-field image. Light field cameras capture both spatial and angular resoltuion. The number of lenslets defines the angular resolution and the number of pixels behind each lenslet gives the spatial resolution.

- put light field data in './data/foldername' (make sure to set your own directory in code)
- set spatial resolution and angular resolution of your light field image (x, y, u, v) in extract_SuvApertureImage.m (line 4, 5)
- run extract_SubApertureImage.m
- sub-aperture images will be saved in './result/filename/'

