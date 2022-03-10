#Questo è il primo script che useremo a lezione
#install.packages("raster")
library(raster)
setwd("C:/lab/") #setta la cartella di lavoro, pesca sempre da qui
Landsat_2011 <- brick("C:/lab/Landsat_p224r63/p224r63_2011.grd")
Landsat_2011
plot(Landsat_2011) #posso usare la f.ne plot perchè i dati sono dei valori di punti con delle coordinate x e y; R mette legenda standard 
grigi <- colorRampPalette(c("black", "grey", "light grey")) (100) #crea una legenda con i colori selezionati; fa passaggio graduale tra i colori pari a (100), in questo caso
plot(Landsat_2011, col=grigi)
