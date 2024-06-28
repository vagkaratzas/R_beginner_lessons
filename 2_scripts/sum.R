# sum_numbers.R
args <- commandArgs(trailingOnly = TRUE)

# Check if two arguments are provided
if (length(args) != 2) {
  stop("Please provide exactly two numeric arguments.")
}

# Convert arguments to numeric
num1 <- as.numeric(args[1])
num2 <- as.numeric(args[2])

# Check if the conversion was successful
if (is.na(num1) || is.na(num2)) {
  stop("Both arguments must be numeric.")
}

# Function to sum two numbers
sum_func <- function(a, b) {
  return(a + b)
}

# Calculate the sum and print the result
result <- sum_func(num1, num2)
cat("The sum of", num1, "and", num2, "is:", result, "\n")
