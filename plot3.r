

# read input file - very larg + 2m records
inputfile <- "./data/household_power_consumption.txt"

# move data from INPUTFILE to DATOS, converting them.
datos <- read.table(inputfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# SubSetting the data from 2007, very old.... I will check it with newest data too
subGrupo <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

# centro del problema
datetime     <- strptime(paste(subGrupo$Date, subGrupo$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# GAP = Global_active_power
SolutionGAP  <- as.numeric(subGrupo$Global_active_power)
subPartes1 <- as.numeric(subGrupo$Sub_metering_1)
subPartes2 <- as.numeric(subGrupo$Sub_metering_2)
subPartes3 <- as.numeric(subGrupo$Sub_metering_3)

# Grafico 480 x 480
png("plot3.png", width=480, height=480)

# Graphic subparte 1
plot(datetime,  subPartes1, type="l", ylab="Energy Submetering", xlab="")
# overgraph parte2
lines(datetime, subPartes2, type="l", col="red")
# overgraph parte 3
lines(datetime, subPartes3, type="l", col="blue")

# Add legenda top right
legend("topright", c("subPartes1", "subPartes2", "subPartes3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# REMEMBER THIS !!!! necesario para cerrar el fichero
dev.off()
