#Questo è il primo script che useremo a lezione
#install.packages("raster")
#install.packages("gglpot2") #virgolette per "uscire" da R (ovvero legge file esterni al programma R); quello dentro le parentesi si chiama ARGOMENTO
#install.packages("rgdal")
#install.packages("RStoolbox")
library(raster)
library(Rstoolbox)

setwd("C:/lab/") #setta la cartella di lavoro, pesca sempre da qui
Landsat_2011 <- brick("C:/lab/Landsat_p224r63/p224r63_2011.grd")
Landsat_2011
plot(Landsat_2011) #posso usare la f.ne plot perchè i dati sono dei valori di punti con delle coordinate x e y; R mette legenda standard 
grigi <- colorRampPalette(c("black", "grey", "light grey")) (100) #crea una legenda con i colori selezionati; fa passaggio graduale tra i colori pari a (100), in questo caso
plot(Landsat_2011, col=grigi)

# b1= blue
# b2= green
#b3= red
#b4= NIR

blue <- colorRampPalette(c("blue4", "blue", "cornflowerblue")) (100) #palette dei blu
plot(Landsat_2011$B1_sre, col=blue)

green <- colorRampPalette(c("dark green", "green", "light green")) (100)
plot(Landsat_2011$B2_sre, col=green)

par(mfrow = c(1,2)) #crea un multiframe di 1 riga e 2 colonne, inserisce i plot nell'ordine in cui sono scritti
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
