# read input file - very larg + 2m records
inputfile <- "./data/household_power_consumption.txt"

# move data from INPUTFILE to DATOS, converting them.
datos <- read.table(inputfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# SubSetting the data from 2007, very old.... I will check it with newest data too
# data from 2007, all columns
subGrupo <- datos[  datos$Date %in% c("1/2/2007","2/2/2007") , ]

# Convert to Numeric, SOLUTION for global actuve power
SolutionGAP <- as.numeric(subGrupo$Global_active_power)

# Define output file PNG, why png ? mmmm strange, 640x640
png("plot1.png", width=640, height=640)

# genero el grafico final
hist(SolutionGAP, col="red", main="Global Active Power.", xlab="Global Active Power. (KiloWatts)")

# REMEMBER THIS !!!!
dev.off()
