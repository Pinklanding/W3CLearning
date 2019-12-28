#######在R语言中，变量本身没有声明任何数据类型，而是获取分配给它的R - 对象的数据类型。 所以R称为动态类型语言，这意味着我们可以在程序中使用同一个变量时，一次又一次地更改变量的数据类型。#######

var_x <- "Hello"
cat("The class of var_x is ",class(var_x),"
")###cat: Concatenate and Print 

var_x <- 34.5
cat("  Now the class of var_x is ",class(var_x),"
")

var_x <- 27L
cat("   Next the class of var_x becomes ",class(var_x),"
")

#####所有大于1的数字被认为是逻辑值TRUE。#######
v <- c(3,0,TRUE,2+2i)
t <- c(4,0,FALSE,2+3i)
print(v|t)
print(v&t)

v <- c(3,0,TRUE,2+2i)
t <- c(1,3,TRUE,2+3i)
print(v&&t)

t <- c(0,3,TRUE,2+3i)
print(v||t)

######运算符#######
###%in% 逻辑in
v1 <- 8
v2 <- 12
t <- 1:10
print(v1 %in% t) 
print(v2 %in% t) 

###%*%矩阵乘
M = matrix( c(2,6,5,1,10,4), nrow = 2,ncol = 3,byrow = TRUE)
M1 = matrix( c(3,6,3,6,10,4), nrow = 3,ncol = 2,byrow = TRUE)
t = M %*% t(M)
t1 = M %*% M1
print(t)
print(t1)

######package#######
#包含R包的库位置
.libPaths()
#环境下的package
search()
detach()

####switch#######
x <- switch(
  3,
  "first",
  "second",
  "third",
  "fourth"
)
print(x)

#####repeat#######
v <- c("Hello","loop")
cnt <- 2

repeat {
  print(v)
  cnt <- cnt+1
  
  if(cnt > 5) {
    break
  }
}

#####next#####
v <- LETTERS[1:6]
for ( i in v) {
  
  if (i == "D") {
    next
  }
  print(i)
}

#####merge#####
library(MASS)
merged.Pima <- merge(x = Pima.te, y = Pima.tr,
                     by.x = c("bp", "bmi"),
                     by.y = c("bp", "bmi")
)
print(merged.Pima)
nrow(merged.Pima)

#####melt()拆分数据和cast()数据重构#####
library(reshape2)
library(knitr)
library(MASS)
print(ships)
molten.ships <- melt(ships, id = c("type","year"))
print(molten.ships)

#acast：返回向量/矩阵/数组
#dcast：返回数据框
recasted.ship <- dcast(molten.ships, type+year~variable,sum)
print(recasted.ship)

#####string#####
#paste(..., sep = " ", collapse = NULL)
a <- "Hello"
b <- 'How'
c <- "are you? "

print(paste(a,b,c))

print(paste(a,b,c, sep = "-"))

print(paste(a,b,c, sep = "", collapse = ""))

#####format#####
# Total number of digits displayed. Last digit rounded off.
result <- format(23.123456789, digits = 9)
print(result)

# Display numbers in scientific notation.
result <- format(c(6, 13.14521), scientific = TRUE)
print(result)

# The minimum number of digits to the right of the decimal point.
result <- format(23.47, nsmall = 5)
print(result)

# Format treats everything as a string.
result <- format(6)
print(result)

# Numbers are padded with blank in the beginning for width.
result <- format(13.7, width = 6)
print(result)

# Left justify strings.
result <- format("Hello", width = 8, justify = "l")
print(result)

# Justfy string with center.
result <- format("Hello", width = 8, justify = "c")
print(result)

####string 位数#####
result <- nchar("Count the number of characters")
print(result)

#####string操作#####
# Changing to Upper case.
result <- toupper("Changing To Upper")
print(result)

# Changing to lower case.
result <- tolower("Changing To Lower")
print(result)

# Extract characters from 5th to 7th position.
result <- substring("Extract", 5, 7)
print(result)

#####向量#####
#Creating a sequence from 5 to 13.
v <- 5:13
print(v)

# Creating a sequence from 6.6 to 12.6.
v <- 6.6:12.6
print(v)

# If the final element specified does not belong to the sequence then it is discarded.
v <- 3.8:11.4
print(v)

# Accessing vector elements using 0/1 indexing.
y <- t[c(0,0,0,0,0,0,1)]
print(y)

###向量元素回收： 如果我们对不等长的两个向量应用算术运算，则较短向量的元素被循环以完成操作。
v1 <- c(3,8,4,5,0,11)
v2 <- c(4,11)
# V2 becomes c(4,11,4,11,4,11)

add.result <- v1+v2
print(add.result)

sub.result <- v1-v2
print(sub.result)

#####列表list#####
# Create a list containing strings, numbers, vectors and a logical values.
list_data <- list("Red", "Green", c(21,32,11), TRUE, 51.23, 119.1)
print(list_data)

#合并
# Create two lists.
list1 <- list(1,2,3)
list2 <- list("Sun","Mon","Tue")

# Merge the two lists.
merged.list <- c(list1,list2)

# Print the merged list.
print(merged.list)

#转向量
# Create lists.
list1 <- list(1:5)
print(list1)

list2 <-list(10:14)
print(list2)

# Convert the lists to vectors.
v1 <- unlist(list1)
v2 <- unlist(list2)

print(v1)
print(v2)

# Now add the vectors
result <- v1+v2
print(result)

#####矩阵#####
# Elements are arranged sequentially by row.
M <- matrix(c(3:14), nrow = 4, byrow = TRUE)
print(M)

# Elements are arranged sequentially by column.
N <- matrix(c(3:14), nrow = 4, byrow = FALSE)
print(N)

# Define the column and row names.
rownames = c("row1", "row2", "row3", "row4")
colnames = c("col1", "col2", "col3")

P <- matrix(c(3:14), nrow = 4, byrow = TRUE, dimnames = list(rownames, colnames))
print(P)

#####数组array#####
vector <- c(5,9,3,10,11,12,13,14,15)
column.names <- c("COL1","COL2","COL3")
row.names <- c("ROW1","ROW2","ROW3")
matrix.names <- c("Matrix1","Matrix2")

# Take these vectors as input to the array.
new.array <- array(vector,dim = c(3,3,2),dimnames = list(row.names,column.names,
                                                                  matrix.names))
print(new.array)

##跨数组元素的计算 apply
if(FALSE){
  "MARGIN: a vector giving the subscripts which the function will be applied over. E.g., for a matrix 1 indicates rows, 2 indicates columns, c(1, 2) indicates rows and columns. Where X has named dimnames, it can be a character vector selecting dimension names."
}
# Use apply to calculate the sum of the rows across all the matrices.
result <- apply(new.array, c(1,2), sum)
print(result)

result <- apply(new.array, c(1), sum)
print(result)

result <- apply(new.array, c(2), sum)
print(result)

#####factor 因子#####
# Create a vector.
apple_colors <- c('green','green','yellow','red','red','red','green')

# Create a factor object.
factor_apple <- factor(apple_colors)

# Print the factor.
print(factor_apple)
print(nlevels(factor_apple))

#在创建具有文本数据列的任何数据框时，R语言将文本列视为分类数据并在其上创建因子。
# Create the vectors for data frame.
height <- c(132,151,162,139,166,147,122)
weight <- c(48,49,66,53,67,52,40)
gender <- c("male","male","female","female","male","female","male")

# Create the data frame.
input_data <- data.frame(height,weight,gender)
print(input_data)

# Test if the gender column is a factor.
print(is.factor(input_data$gender))

# Print the gender column so see the levels.
print(input_data$gender)

##update orders
data <- c("East","West","East","North","North","East","West","West","West","East","North")
# Create the factors
factor_data <- factor(data)
print(factor_data)

# Apply the factor function with required order of the level.
new_order_data <- factor(factor_data,levels = c("East","West","North"))
print(new_order_data)

##generate factor level n是给出级数的整数;k是给出复制数目的整数;labels是所得因子水平的标签向量。
v <- gl(3, 4, labels = c("Tampa", "Seattle","Boston"))
print(v)

#####dataframe
#添加行:要将更多行永久添加到现有数据帧，我们需要引入与现有数据帧相同结构的新行，并使用rbind()函数。
# Create the first data frame.
emp.data <- data.frame(
  emp_id = c (1:5), 
  emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
  salary = c(623.3,515.2,611.0,729.0,843.25), 
  
  start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11",
                         "2015-03-27")),
  dept = c("IT","Operations","IT","HR","Finance"),
  stringsAsFactors = FALSE
)

# Create the second data frame
emp.newdata <- 	data.frame(
  emp_id = c (6:8), 
  emp_name = c("Rasmi","Pranab","Tusar"),
  salary = c(578.0,722.5,632.8), 
  start_date = as.Date(c("2013-05-21","2013-07-30","2014-06-17")),
  dept = c("IT","Operations","Fianance"),
  stringsAsFactors = FALSE
)

# Bind the two data frames.
emp.finaldata <- rbind(emp.data,emp.newdata)
print(emp.finaldata)
