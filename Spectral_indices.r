library(raster)
setwd("C:/lab/")
l1992 <- brick("C:/lab/defor1.jpg")
l1998 <- brick("C:/lab/defor2.jpg")

plotRGB(l1992, r=1, g=3, b=2, stretch="lin")
plotRGB(l1998, r=1, g=3, b=2, stretch="lin")

DVI1992 <- l1992[[1]] - l1992[[2]] #Difference Vegetation Inedex=Nir-Red; misura stato di salute della vegetazione
DVI1998 <- l1998[[1]] - l1998[[2]]

ndvi <- colorRampPalette(c("darkblue", "yellow", "red", "black")) (100)

plot(DVI1992, col=ndvi)
plot(DVI1998, col=ndvi)

DVIdiff <- colorRampPalette(c("blue", "white", "red")) (100)ù

DVI_diff <- DVI1992 - DVI1998
plot(DVI_diff, col=DVIdiff)

NDVI1992 <- DVI1992/(l1992[[1]] + l1992[[2]])
NDVI1998 <- DVI1998/(l1998[[1]] + l1998[[2]])

plot(NDVI1992, col=ndvi)
plot(NDVI1998, col=ndvi)

par(mfrow=c(2,1))
plotRGB(Landsat_1988, r=1, g=2, b=3, stretch="lin")
plot(NDVI1992, col=ndvi)
