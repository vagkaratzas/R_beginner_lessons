# BASIC DATA TYPES ####

# Numeric ####
# Create a numeric variable and display its value, class, and type.
num <- 1.2
print(num)        # Prints the value of num
class(num)        # Prints the class of num (should be "numeric")
typeof(num)       # Prints the type of num (should be "double")

# Integer ####
# Create an integer variable and display its value, class, and type.
int <- as.integer(2)
print(int)        # Prints the value of int
class(int)        # Prints the class of int (should be "integer")
typeof(int)       # Prints the type of int (should be "integer")

# Character ####
# Create a character variable and display its value, class, and type.
char <- "whatever"
print(char)       # Prints the value of char
class(char)       # Prints the class of char (should be "character")
typeof(char)      # Prints the type of char (should be "character")

# Logical ####
# Create a logical variable and display its value, class, and type.
flag <- TRUE
print(flag)       # Prints the value of flag
class(flag)       # Prints the class of flag (should be "logical")
typeof(flag)      # Prints the type of flag (should be "logical")

# Factor ####
# Create a factor variable and display its value, number of levels, levels, class, and type.
fact <- factor(c("bad", "good", "ugly", "good", "ugly")) # c() creates a vector
print(fact)            # Prints the factor values
nlevels(fact)          # Prints the number of levels in the factor
levels(fact)           # Prints the levels of the factor
class(fact)            # Prints the class of fact (should be "factor")
typeof(fact)           # Prints the type of fact (should be "integer")
class(levels(fact))    # Prints the class of the levels (should be "character")
table(fact)            # Prints a table of the factor levels

# DATA STRUCTURES ####

# Vector ####
# Create and manipulate vectors.
int_v <- c(1:5)
length(int_v)     # Prints the length of int_v
int2 <- seq(1, 10, by = 2)
print(int2)       # Prints the sequence 1, 3, 5, 7, 9
char_v <- c("a", "b", "c")
print(char_v[2:3]) # Prints elements 2 and 3 of char_v

# List ####
# Create and manipulate lists.
list_example <- list(int_v, char_v, fact)
class(list_example)              # Prints the class of list_example (should be "list")
class(list_example[[1]])         # Prints the class of the first element (should be "integer")
class(list_example[[2]])         # Prints the class of the second element (should be "character")
class(list_example[[3]])         # Prints the class of the third element (should be "factor")
print(list_example[[1]][1])      # Prints the first element of the first list element
weird_list <- list(list_example, list_example)
weird_list[[2]][[1]][1]       # Prints the first element of the first list element of the second list

names(list_example) <- c("list1", "list2", "list3")
print(list_example$list1)        # Prints the first list element using its name

unlisted_elements <- unlist(list_example)
print(unlisted_elements)         # Prints the unlisted elements of list_example
list_example[[3]] <- as.character(list_example[[3]]) # Converts factors to characters
unlisted_elements <- unlist(list_example)
print(unlisted_elements)         # Prints the unlisted elements of the updated list_example

# Matrix ####
# Create and manipulate matrices.
M <- matrix(1, nrow = 2, ncol = 3)
print(M)                         # Prints the matrix
M2 <- matrix(c('AI', 'ML', 'DL', 'Tensorflow', 'Pytorch', 'Keras'), nrow = 2, ncol = 3, byrow = TRUE)
print(M2)                        # Prints the matrix M2
print(M2[1:2, 1:2])              # Prints a submatrix of M2
nrow(M2)                         # Prints the number of rows in M2
ncol(M2)                         # Prints the number of columns in M2

# Dataframe ####
# Create and manipulate data frames.
dataset <- data.frame(
  Person = c("Aditya", "Ayush", "Akshay"),
  Age = c(26, 26, 27),
  Weight = c(81, 85, 90),
  Height = c(6, 5.8, 6.2),
  Salary = c(50000, 80000, 100000),
  stringsAsFactors = FALSE
)
class(dataset)                   # Prints the class of dataset (should be "data.frame")
typeof(dataset)                  # Prints the type of dataset (should be "list")
nrow(dataset)                    # Prints the number of rows in dataset
ncol(dataset)                    # Prints the number of columns in dataset
dataset$Person                   # Prints the Person column
class(dataset$Person)            # Prints the class of Person column
typeof(dataset$Person)           # Prints the type of Person column

dataset[1]                       # Prints the first column of dataset
class(dataset[1])                # Prints the class of the first column
typeof(dataset[1])               # Prints the type of the first column

dataset <- rbind(dataset, list("Random", 30, 100, 6, 100000)) # Adds a new row to dataset
dataset                          # Prints the updated dataset

dataset <- cbind(dataset, c(seq(1, nrow(dataset), 1))) # Adds a new column to dataset
dataset
colnames(dataset)[6] <- "Sequence" # Renames the new column
dataset

rownames(dataset) <- c("Person1", "Person2", "Person3", "Person4") # Renames the rows
rownames(dataset)
dataset

dataset$X <- list(c(1,2,3,4), c(5,6,7,8), c(9,10,11,12), c(13,14,15,16)) # Adds a list column
dataset$Y <- list(c(1,2,3,4))                                            # Adds another list column
dataset

dataset[1:2, 1:2]             # Prints a sub-dataframe of dataset
dataset[1:1, 1:1, drop = F]   # Prints a sub-dataframe with drop = F to retain dataframe structure

subset(dataset, Weight > 84)  # Subsets dataset based on a condition
str(dataset)                  # Prints the structure of dataset
summary(dataset)              # Prints a summary of dataset
