# global.R
#
# Description: Load and prepare the linelist
#

# Load the data
data.file <- "~/Programming/R/projects/linelist_table/data/identified.txt"
header <- read.table(data.file, sep="\t", stringsAsFactors = FALSE, nrows = 1, 
                     comment.char="-")
linelist <- read.table(data.file, sep="\t", stringsAsFactors = FALSE)
colnames(linelist) <- header[1:ncol(header)]


# Prepare the data
extract_species <- function(x) {
    strsplit(x, "\\(")[[1]][1]
}

extract_transition <- function(x) {
    transition <- strsplit(x, "\\(")[[1]][2]
    sprintf("(%s", transition)
}

linelist$Species <- sapply(linelist$Transition, extract_species)
linelist$Transition <- sapply(linelist$Transition, extract_transition)

# column.names <- colnames(linelist)
# column.names[1] <- "Species"
# column.names <- column.names[-1]
