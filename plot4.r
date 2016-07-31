
# read input file - very larg + 2m records
inputfile <- "./data/household_power_consumption.txt"

# move data from INPUTFILE to DATOS, converting them.
datos <- read.table(inputfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# SubSetting the data from 2007, very old.... I will check it with newest data too
subGrupo <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

# centro del problema
datetime     <- strptime(paste(subGrupo$Date, subGrupo$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# GAP = Global_active_power - needed in this case
# active
SolutionGAP   <- as.numeric(subGrupo$Global_active_power)

# Reactive
SolutionGAP2  <- as.numeric(subSetData$Global_reactive_power)

# Voltage - convertir a numericos los valores
voltage    <- as.numeric(subGrupo$Voltage)

subPartes1 <- as.numeric(subGrupo$Sub_metering_1)
subPartes2 <- as.numeric(subGrupo$Sub_metering_2)
subPartes3 <- as.numeric(subGrupo$Sub_metering_3)

png("plot4.png", width=480, height=480)
par( mfcol = c(2, 2) ) 

# 1st graphic
plot(datetime, SolutionGAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# 2nd graphic
plot(datetime,  subPartes1, type="l", ylab="Energy Submetering.", xlab="")
lines(datetime, subPartes2, type="l", col="red")
lines(datetime, subPartes3, type="l", col="blue")
legend("topright", c("subPartes1", "subPartes2", "subPartes3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# 3er graphic
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")


# Generar el grafico final con todo. All in one
# 4rd with Global
plot(datetime, SolutionGAP2, type="l", xlab="datetime", ylab="Global_reactive_power")

# REMEMBER THIS !!!! necesario para cerrar el fichero
dev.off()

