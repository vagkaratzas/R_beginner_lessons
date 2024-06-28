# SEARCHING ####

# Create a character vector for searching.
charvec <- c("a", "b", "bc", "c", "cb", "b")

# grep/grepl ####
# Using grep and grepl for pattern matching.
grep("b", charvec)            # Finds indices with "b"
grep("^b", charvec)           # Finds indices starting with "b"
grep("b$", charvec)           # Finds indices ending with "b"
grep("^b$", charvec)          # Finds indices that are exactly "b"
grepl("^b$", charvec)         # Logical vector of matches
charvec[grep("b", charvec)]   # Subsets charvec with grep
charvec[grepl("^b$", charvec)] # Subsets charvec with grepl

# match ####
# Using match to find exact matches.
match("b", charvec)           # Finds the first occurrence of "b"
"b" %in% charvec              # Checks if "b" is in charvec

# which ####
# Using which to find indices of exact matches.
which(charvec %in% "b")       # Finds all exact matches

# BENCHMARKING ####

# proc.time() ####
start <- proc.time()
# Perform some operations
Sys.sleep(1) # Simulate a delay
end <- proc.time()

# Calculate elapsed time
elapsed_time <- end - start
cat(sprintf("Execution took %.2f seconds.\n", elapsed_time[3])) # formatted

# Loops vs non-loops ####
data <- rnorm(10000000) # vector of random doubles from normal distribution

# Using a loop
start <- proc.time()
for (i in 1:length(data)) {
  data[i] <- data[i] + 1
}
end <- proc.time()
cat("Loop execution time: ", end - start, "\n")

# Using vectorized operation
start <- proc.time()
data <- data + 1 # ~50 times faster
end <- proc.time()
cat("Vectorized operation time: ", end - start, "\n")

# I/O ####
# read.table ####
file_path <- "String_Yeast_coexpression.txt"
if (file.exists(file_path)) {
  start <- proc.time()
  datatable <- read.table(file_path, header = FALSE, sep = "\t", 
                          col.names = c("Node1", "Node2", "Weight"), stringsAsFactors = FALSE)
  end <- proc.time()
  cat("Reading table execution time: ", end - start, "\n")
  
  # Display data frame information
  print(class(datatable))
  str(datatable)
  summary(datatable)
} else {
  cat("File not found: ", file_path, "\n")
}

# readLines ####
con <- file(file_path, "r")
if (con) {
  first_line <- readLines(con, 1)
  cat("First line of file: ", first_line, "\n")
  close(con)
} else {
  cat("File not found: ", file_path, "\n")
}

# match vs which vs grep benchmarking example ####
if (exists("datatable")) {
  search_value <- "YPR203W"
  
  # Using match
  start <- proc.time()
  match(search_value, datatable$Node1) # fast
  end <- proc.time()
  cat("Match execution time: ", end - start, "\n")
  
  # Using which
  start <- proc.time()
  which(datatable$Node1 %in% search_value) # slow
  end <- proc.time()
  cat("Which execution time: ", end - start, "\n")
  
  # Using grep
  start <- proc.time()
  grep(search_value, datatable$Node1) # slower
  end <- proc.time()
  cat("Grep execution time: ", end - start, "\n")
}

# Save/Load Objects ####
saveRDS(datatable, "datatable.rds") # R object, non-readable format

start <- proc.time()
loaded_datatable <- readRDS("datatable.rds") # still, faster than read.table
end <- proc.time()
cat("Reading RDS execution time: ", end - start, "\n")

# write.table ####
write.table(loaded_datatable, "loaded_datatable.csv", sep=",", col.names = FALSE, row.names = FALSE, quote = FALSE)

# write lines to outfile ####
con <- file("output.txt", "w") # usual i/o, r/w/a
for (i in 1:100){
  cat(sprintf("Line %d\n", i), file=con)
}
close(con)

# rbind vs i/o benchmarking example ####
# Using rbind
df <- data.frame(Node1=character(), Node2=character(), Weight=integer(), stringsAsFactors = FALSE)
start <- proc.time()
for (i in 1:1000){
  df <- rbind(df, datatable[i,])
}
end <- proc.time()
cat("Rbind execution time: ", end - start, "\n")

# Using I/O
start <- proc.time()
con <- file("outTable.txt", "w") # usual i/o, r/w/a
for (i in 1:1000){
  cat(sprintf("%s\t%s\t%d\n", datatable[i,1], datatable[i,2], datatable[i,3]), file=con)
}
close(con)
df2 <- read.table("outTable.txt", header = FALSE, sep = "\t", 
                  col.names = c("Node1", "Node2", "Weight"), stringsAsFactors = FALSE)
end <- proc.time()
cat("I/O execution time: ", end - start, "\n")

# PARSING - gsub ####
# Function that parses user text, separating data by commas, spaces, tabs, carriage returns and new lines
# @param text: the text data to be parsed
# @return: the parsed data in a list (trimmed, empty and NA values removed)
parseFunction <- function(text){
  text <- gsub(",", "\n", text)
  text <- gsub(" ", "\n", text)
  text <- gsub("\t", "\n", text)
  text <- gsub("\r", "\n", text)
  text <- strsplit(text, "\n")
  text <- lapply(text, function(z){ z[!is.na(z) & z != ""]})
  return(text)
}

text <- "  HSPA4L, SASH1\n, PRR7\r\n OR2W3,CENPC, NODAL    "
parsedList <- parseFunction(text)
print(parsedList)
