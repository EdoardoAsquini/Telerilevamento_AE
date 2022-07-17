#Introductive script
#install.packages("raster")
#install.packages("gglpot2") #we use quotes ("") e per "uscire" da R (ovvero legge file esterni al programma R); quello dentro le parentesi si chiama ARGOMENTO
#install.packages("rgdal")
#install.packages("RStoolbox")
#install.packages("rasterdiv")

library(raster)
library(Rstoolbox)

setwd("C:/lab/") #sets work directory
Landsat_2011 <- brick("C:/lab/Landsat_p224r63/p224r63_2011.grd")
Landsat_2011
plot(Landsat_2011) #images can be visualized via plot command because each point possesses x and y values.  
grigi <- colorRampPalette(c("black", "grey", "light grey")) (100) #creates a new legend with the said colours; gradual passage between them (100)
plot(Landsat_2011, col=grigi)

# b1=blue
# b2=green
# b3=red
# b4=NIR

blue <- colorRampPalette(c("blue4", "blue", "cornflowerblue")) (100) #blue palette
plot(Landsat_2011$B1_sre, col=blue)

green <- colorRampPalette(c("dark green", "green", "light green")) (100)
plot(Landsat_2011$B2_sre, col=green)

par(mfrow = c(1,2)) #creates a multiframe of 1 row and 2 columns, plots are inserted in the order they are coded
plot(Landsat_2011$B1_sre, col=blue)
plot(Landsat_2011$B2_sre, col=green)

red <- colorRampPalette(c("darkred", "red", "pink")) (100)
plot(Landsat_2011$B3_sre, col=red)

nir <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(Landsat_2011$B4_sre, col=nir)

par(mfrow = c(2,2))
plot(Landsat_2011$B1_sre, col=blue)
plot(Landsat_2011$B2_sre, col=green)
plot(Landsat_2011$B3_sre, col=red)
plot(Landsat_2011$B4_sre, col=nir)

plotRGB(Landsat_2011, r=3, g=2, b=1, stretch="lin"/"hist") #true colours image, stretch can be done via linear model or histogram
plotRGB(Landsat_2011, r=4, g=3, b=2, stretch="lin") #NIR in the Red band
plotRGB(Landsat_2011, r=3, g=4, b=2, stretch="lin") #NIR in the Green band
plotRGB(Landsat_2011, r=3, g=2, b=4, stretch="lin") #NIR in the Blue band, soil becomes yellow

Landsat_1988 <- brick("C:/lab/Landsat_p224r63/p224r63_1988.grd") #1988 image taken by Landsat
Landsat_1988

par(mfrow=c(2,1)) #compares the two images, NIR in the red band
plotRGB(Landsat_1988, r=4, g=3, b=1, stretch="lin")
plotRGB(Landsat_2011, r=4, g=3, b=1, stretch="lin")

l1992 <- brick("C:/lab/defor1.jpg")
l1998 <- brick("C:/lab/defor2.jpg")

plotRGB(l1992, r=1, g=3, b=2, stretch="lin")
plotRGB(l1998, r=1, g=3, b=2, stretch="lin")

par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plotRGB(l1998, r=1, g=2, b=3, stretch="lin")

DVI1992 <- l1992[[1]] - l1992[[2]] #Difference Vegetation Inedex=Nir-Red; used as a proxy for vegetation health status
DVI1998 <- l1998[[1]] - l1998[[2]]

NDVI1992 <- DVI1992/(l1992[[1]] + l1992[[2]])
NDVI1998 <- DVI1998/(l1998[[1]] + l1998[[2]])

ndvi <- colorRampPalette(c("darkblue", "yellow", "red", "black")) (100)

plot(DVI1992, col=ndvi)
plot(DVI1998, col=ndvi)
plot(NDVI1992, col=ndvi)
plot(NDVI1998, col=ndvi)

DVIdiff <- colorRampPalette(c("blue", "white", "red")) (100)

DVI_diff <- DVI1992 - DVI1998
plot(DVI_diff, col=DVIdiff)

par(mfrow=c(2,1))
plotRGB(Landsat_1988, r=1, g=2, b=3, stretch="lin")
plot(NDVI1992, col=ndvi)

par(mfrow=c(2,1))
plot(NDVI1992, col=ndvi)
plot(NDVI1998, col=ndvi)

library(RStoolbox)

SI1992 <- spectralIndices(l1992, green = 3, red = 2, nir = 1)
plot(SI1992, col=ndvi)

library(rasterdiv)

plot(copNDVI) #mean NDVI from Copernicus data, function from rasterdiv package
