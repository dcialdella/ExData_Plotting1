
# read input file - very larg + 2m records
inputfile <- "./data/household_power_consumption.txt"

# move data from INPUTFILE to DATOS, converting them.
datos <- read.table(inputfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# SubSetting the data from 2007, very old.... I will check it with newest data too
subGrupo <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

# Define tiempo "Cuando"
Cuando <- strptime(paste(subGrupo$Date, subGrupo$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Solución en variable
SolutionGAP <- as.numeric(subGrupo$Global_active_power)

# Defino Fichero salida
png("plot2.png", width=480, height=480)

# Genero el gráfico, titulo, 
plot(Cuando, SolutionGAP, type="l", xlab="", ylab="Global Active Power. (KiloWatts)")

# REMEMBER THIS !!!!
dev.off()



