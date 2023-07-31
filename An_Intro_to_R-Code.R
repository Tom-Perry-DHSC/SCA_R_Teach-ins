#############################################
# -------------------------------------------
#         SCA Programming Teach-ins
# -------------------------------------------
#############################################

######## Some really useful guides for learning R:
########    R for Data Science - Hadley Wickham & Garrett Grolemund: https://r4ds.had.co.nz/r-markdown.html
########        The second version (released around a month ago) is here: https://r4ds.hadley.nz/preface-2e.html
########    R Cheatsheets - Posit: https://posit.co/resources/cheatsheets/
########    Introduction to R - Analysis Function: https://learninghub.ons.gov.uk/course/view.php?id=498

###########################
# -------------------------
#         Session 1        Introduction to R Studio and Data Types in R
# -------------------------
###########################

# ---------------------------------------------------------
# Section 1a: Overview of R Studio and R
# ---------------------------------------------------------

# ---------------------------------------------------------
# Section 1a: RStudio
# ---------------------------------------------------------

######## Let's cover the basics of R Studio.

######## Cover the Console, the environment and the files folder.

######## Above the console on the latest version of R available, you will see the version of R used
########    this should be 4.2.1.

######## Tools < Global Options < General - setting up R Studio setting.
######## Tools < Global Options < Appearance - this is for the theme of R Studio.

# ---------------------------------------------------------
# Section 1b: R
# ---------------------------------------------------------

######## For those with experience in other programming languages such as Python, or SQL
########    R will be a relatively basic language to learn.
######## While case-sensitive, it is not hugely "picky" with inputs, it is designed to be easy to use.

######## It is worth noting is that R is not "zero-indexed".
######## This means that counting does not start from 0, instead it begins from 1.

######## Languages such as Python, C, C#, C++ are all zero indexed, so often you will see the following:
########    for i in range(0, n):
########        print(i)
########    This would print 0, 1, 2, 3, ..., n-1 in Python

for (i in 0:5){
  print(i)
}

######## While base R (the standard version of R) is incredibly useful and usable in its own right,
########    various packages make it even easier to perform some types of analysis.
######## We will use packages in later sessions, mostly the tidyverse package.

# ---------------------------------------------------------
# Section 1c: Best Practice in R
# ---------------------------------------------------------

######## When naming objects in R, there are different defined ways of labelling a newly created object
######## These include,
########    snake_case - where_underscores_replace_spaces
########    CamelCase  - whereCapitalsReplaceSpaces

######## Internal consistency is the most important thing - make sure to always
########    use the same convention for all variable names, and the same convention
########    for all function names.
######## As an example, the tidyverse uses snake_case for both variables 
########    and functions. See https://style.tidyverse.org/syntax.html#object-names

######## When code spans multiple lines, it is best practice to split at sensible points.
######## It is also best to leave whitespace to make code most readable.
######## Compare the following examples:

######## mutate(total=sum((data_1+data_2)/data_3,na.rm=TRUE))
######## mutate(total = sum((data_1 + data_2) / data_4, na.rm = TRUE))

######## Evidently one is better!

# ---------------------------------------------------------
# Section 2: Variable assignment in R
# ---------------------------------------------------------

######## Variables are assigned with either <- or =
######## It is not good practice to use =
######## Much like other languages, each operator has a specific use.

######## The two lines below do the same thing - assign the value 7 to the variable
########   called num_colours_in_rainbow.

num_colours_in_rainbow <- 7
num_colours_in_rainbow =  7

######## Use the print function to see the current value of a variable

print(num_colours_in_rainbow) # Prints 7

######## Alternatively, we "run" the variable

num_colours_in_rainbow

######## If we want to change a variable that already exists, we can do so.
######## For example if the status of something changes:

num_planets_in_solar_system <- 9
num_planets_in_solar_system <- 8

######## This way of assignment is not just when we are using numerical variables!

# ---------------------------------------------------------
# Section 3: Data types in R
# ---------------------------------------------------------

######## R has 6 so-called basic data types:
########    logical, numeric, integer, complex, character, and raw
########    (We've just seen a couple of examples of one of these, the numeric class)

######## Let's bear in mind that the first three of these are still "numbers"

######## You can use the "class" function to check the class of a variable:

class(num_colours_in_rainbow) # Prints "numeric"

# ---------------------------------------------------------
# Section 3a: Logical variables
# ---------------------------------------------------------

######## logical variables take one of two possible values, TRUE or FALSE. They're
########   often used for indexing/filtering and if statements.

operational_research_is_cool <- TRUE

print(operational_research_is_cool) # Prints TRUE

######## Key operations on logicals are: NOT (!), AND (&), and OR (|).

print(!TRUE)          # Prints FALSE
print(TRUE  & TRUE)   # Prints TRUE
print(TRUE  & FALSE)  # Prints FALSE
print(TRUE  | FALSE)  # Prints TRUE
print(FALSE | FALSE)  # Prints FALSE

# ---------------------------------------------------------
# Section 3b: Numeric variables
# ---------------------------------------------------------

######## Numeric variables can be used for both integers and decimals:

a <- 21
b <- 2.1
c <- 2.1e-1

d <- -1

######## Numbers can be added, multiplied etc:

print(1 + 2)   # Addition
print(12 - 15) # Subtraction
print(4 * 5.5) # Multiplication
print(21 / 3)  # Division

print(2^3)     # Exponentiation

######## While R does have a set order of operations, using parentheses minimises
########    the risk of unexpected behaviour.

print(1/3^2 + 5 * 2)     # Not clear what is intended.
print(1/(3^2) + (5 * 2)) # Same result, but much clearer.

######## There also many standard functions:

print(log(10)) 	       # Defaults to the natural log (base e)
print(log(10, base=2)) # Base can be declared
print(sin(pi/2))       # pi is a defined constant
print(sqrt(9))

print(floor(2.9))       # Rounds down to nearest whole number
print(ceiling(2.1))        # Rounds up to nearest whole number
print(round(2.4))       # Rounds up or down to nearest whole number
print(round(2.451515, digits=3))  # Can optionally choose number of decimal places
print(round(31415, digits=-1))    # Including negative values for e.g. to nearest ten

######## We can also get help on what a function does and needs.

?log

# ---------------------------------------------------------
# Section 3c: Integer variables
# ---------------------------------------------------------

######## In many instances, you can use "numeric" to represent integers, but where memory
########    or precision is particularly important, you may want to use the integer data type.
######## To do so, write an upper case 'L' after the number.

a <- 2L
class(a)

######## Note that division will always output a "numeric", even when the result
########    is a whole number:

print(class(2L / 2L)) # Prints "numeric"

######## Use as.integer() to force conversion to an integer:

print(class(as.integer(2L / 2L))) # Prints "integer"

######## Note also that decimals will always be rounded towards 0 when using as.integer():

print(as.integer(1.5))  # Prints 1
print(as.integer(2.5))  # Prints 2
print(as.integer(-1.5)) # Prints -1

# ---------------------------------------------------------
# Section 3d: Complex and Raw variables
# ---------------------------------------------------------

######## Complex and raw variables won't be covered here.

# ---------------------------------------------------------
# Section 3e: Character variables
# ---------------------------------------------------------

######## These are equivalent to what is often called a "string" in other programming languages,
########    and are the main way you'll interact with text-based data in R.
######## Double quotes are used when defining a character variable:

the_wheels_on_the_bus_go <- "round and round"
sky_colour <- "blue"

######## Beware backslash (\), R's escape character.
######## This is used to tell R that the following character should be treated specially.
######## If you want an actual backslash, you need to use two:

my_text <- "It's a yes\no question." # Wrong - R will see "It's a yes{newline}o question."
my_text <- "It's a yes\\no question." # Right

######## There are lots of "special" characters that can be accessed in this way, e.g. \n, \t, but they're
######## beyond the scope of this course.

######## There are many useful string functions in base r.

favourite_colour <- "orange"

######## Use paste() to combine multiple character variables. The 'sep' argument is a string that will
########    be inserted between each component. If no 'sep' is given, the default is a space.

favourite_colour_sentence <- paste("My favourite colour is ", favourite_colour, ".")

######## An alternative to the paste function is the paste0 function.
######## This is equivalent to the paste function with sep = ""

######## We can extract parts of a string as well
######## This uses the substr function
######## substr(input, start, stop)

print(substr(favourite_colour, 2, 4)) # Prints "ran"

######## Use nchar() to get the length of a character variable.
######## Do not use length() though since this is for vectors

print(nchar(favourite_colour)) # Prints 6

######## Other functions like grep(), gsub(), sprintf() can be very handy, but are a bit more complex.

# ---------------------------------------------------------
# Section 4: Comparisons and Operators
# ---------------------------------------------------------

# ---------------------------------------------------------
# Section 4a: Equality
# ---------------------------------------------------------

######## Basic variables can be compared.
######## Checking for equality uses "==" (not "=" - that is only used for variable assignment)

print(1 == 1) # Prints TRUE
print("hello" == "goodbye") # Prints FALSE

######## Non-equality can be checked with "!=":

print(1 != 1) # Prints FALSE
print("hello" != "goodbye") # Prints TRUE

# ---------------------------------------------------------
# Section 4a: Further Operators
# ---------------------------------------------------------

######## We also have <, >, <=, >=, which behave as expected on numerical variables:

print(1 > 2) # Prints FALSE
print(100 <= 100) # Prints TRUE

######## They can also be used on character variables, comparing via lexicographic ordering.
######## Before using, it's worth doing some simple test cases that these behave as you'd expect
######## when it comes to e.g. punctuation, or upper- vs lower-case.

print("cat" < "dog") # Prints TRUE

######## We all can perform integer division and find remainders

print(7 %% 2)  # prints 1
print(7 %/% 2) # prints 3

# ---------------------------------------------------------
# Section 5: Larger Data Types
# ---------------------------------------------------------

# ---------------------------------------------------------
# Section 5a: Vectors
# ---------------------------------------------------------

######## A vector in R is an ordered set of basic variables, all of which have the same type.
######## In fact, all the variables we have seen so far have secretly been vectors of length one!
######## Vectors can be defined explicitly using c():

planets <- c("mercury", "venus", "earth", "mars", "jupiter", "saturn", "uranus", "neptune")
numbers <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
clock_sounds <- c("tick", "tock", "tick", "tock", "tick", "tock")

######## Note that vectors need to have the same class of data for each entry.
######## We can default to using strings to cover all datatypes.

house_numbers <- c("1", "2", "3a", "3b", "generic_house_name")

######## As noted above all basic variables are vectors of length one,
########    so the two lines below do the same thing.

sky_colour <- "blue"
sky_colour <- c("blue")

######## Sometimes explicit definitions would be tedious to write out. There are some shortcuts:

numbers <- 1:10 # Makes a vector of the numbers from 1 to 10 (inclusive)
clock_sounds <- rep(c("tick", "tock"), 4) # REPeats the vector c("tick", "tock") 3 times

######## Use length() to check the length of a vector

print(length(planets)) # Prints "8"

######## You can get elements of a vector by indexing, using [] notation.
######## Note that R, unlike many languages, uses 1-indexing rather than 0-indexing.
######## This means that the first element of a vector has index 1.

print(planets[1]) # Prints "mercury"
planet_4 <- planets[4]
print(planet_4)   # Prints "mars"

# ---------------------------------------------------------
# Section 5b: Index positions
# ---------------------------------------------------------

######## You can also index multiple elements at once. There are two main ways of doing this - with
########    a vector of "index positions", and with a vector of logicals.

outer_solar_system_planet_indices <- c(5, 6, 7, 8)
outer_solar_system_planet_names <- planets[outer_solar_system_planet_indices]

######## Or more simply:

outer_solar_system_planet_names <- planets[5:8]
print(outer_solar_system_planet_names) # Prints the planets in the outer solar system

######## Logical indexing:

planets_with_moons <- c(FALSE, FALSE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE)
print(planets[planets_with_moons]) # Prints everything but Mercury and Venus.

###### You'll rarely write out your own list of logicals, but this approach is very useful
###### when combined with functions that output logicals.

# ---------------------------------------------------------
# Section 5c: Vectors and functions
# ---------------------------------------------------------

######## Almost all functions/operations can act element-wise on vectors, outputting a vector:

print(c(1, 2, 3) + c(1, -2, 5.2)) # prints the vector c(2, 0, 8.2)

planets <- c("mercury", "venus", "earth", "mars", "jupiter", "saturn", "uranus", "neptune")
planet_start_letters <- substr(planets, 1, 1) # Gives the vector c("m", "v", "e", "m", "j", "s", "u", "n")

planet_descriptions <- c("small", "hot", "where humans live", "red", "big", "ringed", "icy", "very far away")
planet_sentences <- paste(toupper(planet_start_letters), substr(planets, 2, nchar(planets)), " is ", planet_descriptions, ".", sep="")

######## Hidden in the last example is the fact that R can handle operations involving vectors of different lengths, but only when
######## there is one longest vector whose length is (pairwise) a multiple of all other vector lengths in the expression.

print(c(1, 2, 3) + 1) # Prints (2, 3, 4)
print(c(1, 2, 3, 4) + c(0, 1)) # Prints (1, 3, 3, 5)
print(c(1, 2, 3) + c(0, 1)) # Returns an error - neither vector length is a multiple of the other.

######## This behaviour is mostly useful for combining 1-length vectors with vectors of other lengths.
######## For other cases, be sure that the behaviour is what you're expecting it to be!

######## In R, a vector can't be "higher dimensional" - unlike other languages, it's not possible
########    to have a vector with vector elements.
######## Making a vector of vectors instead concatenates the vectors:

even_numbers <- c(2, 4, 6)
odd_numbers <- c(1, 3, 5)

all_numbers <- c(odd_numbers, even_numbers)

######## Vectors can be sorted:

sorted_numbers <- sort(all_numbers)
sorted_numbers <- all_numbers[order(all_numbers)] # Useful for e.g. sorting a dataframe on one column.

# ---------------------------------------------------------
# Section 5d: Lists
# ---------------------------------------------------------

######## Lists behave similarly to vectors in many ways.
######## Unlike vectors, they can contain different variable types as entries:

my_list <- list(1, "two", FALSE)

######## Like vectors, they can be indexed to retrieve elements. Note that standard indexing will always return a list:

element_2 <- my_list[2] # Creates a new list of length 1, equal to list("two")
print(class(element_2)) # Prints "list"
multiple_elements <- my_list[2:3] # Creates a new list of length 2, equal to list("two", FALSE)

######## To get the actual element at an index, use double brackets:

element_2 <- my_list[[2]]
print(class(element_2)) # Prints "character"

######## Double brackets accept only a single index - what would it mean to return multiple elements of the list not as a list?

multiple_elements <- my_list[[1:2]] # Will cause an error.

######## Lists can be nested:

multi_dimensional <- list(list("a", "b"), list("c", "d"))
element_1 <- multi_dimensional[[1]] # Returns the list given by list("a", "b")
print(element_1[[2]]) # Prints "b"

######## With one less step:

print(multi_dimensional[[1]][[2]]) # Prints "b".

######## Both lists and vectors can optionally be "named".
######## Naming lets you access elements with strings as well as their indices.
######## This acts like a dictionary object in many other programming languages.

animal_info <- c(type="dog", noise="woof") # Left hand side of "=" sign is the name of the element; the right hand side is the value
print(animal_info["type"]) # Prints "dog"
print(animal_info[1]) # Can still use numerical indices.

print(names(animal_info)) # Prints c("type", "noise")

# ---------------------------------------------------------
# Section 5e: Dataframes
# ---------------------------------------------------------

######## Dataframes are the main way of handling tabular information in base R.
######## They are structured as having rows and columns.
######## Rows are often called "observations"; columns are often called "variables".
######## One column can have different data types to others, but all variables within a column must have a single data type.

# Here, we create a dataframe with three columns. "type" and "noise" hold character variables, while "legs" has numeric.
# Note that all columns must have the same length.

animal_info_df <- data.frame(
  type  = c("dog", "fish", "chicken", "cat"),
  noise = c("woof", "blub", "cluck", "meow"), 
  legs  = c(4, 0, 2, 4)
)

######## Dataframes can be indexed similarly to vectors and lists, but now two dimensions must be given:
######## First the row index, then the column index.

print(animal_info_df[2, 1]) # Prints "fish"

######## Columns can be indexed by name:

print(animal_info_df[1, "noise"]) # Prints "woof"

######## Vectors can also be used for indexing:

print(animal_info_df[c(1, 4), "type"]) # Prints "dog" "cat"

######## So long as only one column is indexed, the returned data is a vector (possibly of length one, so a single data point):

print(class(animal_info_df[2, 1])) # Prints "character"
print(class(animal_info_df[2, 3])) # Prints "numeric"
print(class(animal_info_df[c(1, 4), "type"])) # Prints "character"

######## But when more than one column is indexed, the returned data is a dataframe

print(class(animal_info_df[2, c(1, 2)])) # Prints "data.frame"
print(class(animal_info_df[2, c("type", "legs")]))

######## Indexing can be skipped in one or both dimensions of the dataframe:

animal_info_df[, "type"] # Prints the vector c("dog", "fish", "chicken", "cat")
animal_info_df[c(1, 2),] # Prints a sub-dataframe with all info about dogs and fish

######## It's also possible to access a column of the dataframe by name using $:

animal_info_df$type # Prints the vector c("dog", "fish", "chicken", "cat")

######## Performing comparisons on dataframe columns can be very useful for indexing:

indicator_vector <- (animal_info_df$legs > 2) # Creates the vector c(TRUE, FALSE, FALSE, TRUE)
filtered_df <- animal_info_df[indicator_vector,] # Creates a df containing only info on animals with more than 2 legs.

######## Or in a single step:

filtered_df <- animal_info_df[animal_info_df$legs > 2,]

######## The %in% operator can be very useful here:

cats_and_fish <- animal_info_df$type %in% c("cat", "fish")
filtered_df <- animal_info_df[cats_and_fish,] #Dataframes are the main way of handling tabular information in base R.

###########################
# -------------------------
#         Session 2        Data Manipulation
# -------------------------
###########################

# ---------------------------------------------------------
# Section 1: Packages
# ---------------------------------------------------------

######## When analysing data in R, you will almost always need to import a library.
######## The most common is tidyverse, which is a collection of packages that
########    provide various useful abilities

######## To install the tidyverse package, we run the following line

install.packages("tidyverse")
install.packages(tidyverse)

######## Note that this only needs to be done once - after the packages are
########    installed, they're saved to a local library.
######## There's no need to run this line every time you open R.

######## On some outdated versions of R, you may need to run the following line of code:

install.packages("tidyverse", type = "binary")

######## Once a package is installed, it's available for use.
######## You still need to tell RStudio that you intend to use it in the current session/script.
######## To load/import a library, we run

library(tidyverse)
packages <- c(tidyverse, ggplot2)
library(packages)

# ---------------------------------------------------------
# Section 2: What is the Tidyverse?
# ---------------------------------------------------------

######## Before we start using data, we need to focus on the tidyverse
######## The tidyverse is the main package you will use in R
######## Let's load in the tidyverse, once we've made sure that it's installed

install.packages("tidyverse")
library(tidyverse)

######## The tidyverse includes many packages:
######## Part of the tidyverse is the "core tidyverse"
######## This includes ggplot2, dplyr, readr and tidyr

######## You can find out more about the tidyverse at
######## https://tidyverse.org/

# ---------------------------------------------------------
# Section 3: Importing and Exporting Data
# ---------------------------------------------------------

######## Most R projects will usually consist of importing data, (sometimes combining data), 
########   analysing it and then exporting either a summary or a visualisation
######## Today we'll focus on the importing/exporting and combining

######## To import data, the most useful package is readr, part of the tidyverse
######## It includes options to import csv, xlsx and other file types

# ---------------------------------------------------------
# Section 3a: .csv Files and Filepaths
# ---------------------------------------------------------

######## Let's start with importing the easiest format, a csv.
######## To import a csv, we have a couple of options, a base R function, (in the utils package), 

read.csv()

######## Or a function from the readr package

readr::read_csv()

######## You can read about the advantages of each here:
########    https://r4ds.had.co.nz/data-import.html#compared-to-base-r

######## I recommend the tidyverse version because:
########    - It is (much) quicker
########    - Part of the tidyverse and so works better with other tidyverse functions
########    - Usually does not struggle with importing column names
########    - It usually guesses the column types pretty well

######## Let's import some data

######## We only need to specify where we are importing the data from and what we are calling it
######## Firstly, where; we need to ensure this file can be found, 
########   making sure the directory is specified, by either setwd or withr::with_dir

getwd()

setwd(paste0(getwd(), "/R files"))

######## Secondly, what; We also need to assign it to a variable, if we are going to use this data set

my_data <- readr::read_csv("filepath/filename.csv")

######## Using the withr package's with_dir, we can easily change the wd very easily for just a single use.
######## I'll give an example in session 5.

with_dir(filepath, my_function)

with_dir(filepath, read_csv("filename.csv"))

######## Note that the name of the file and the filepath need to be strings!

######## Once we have performed analysis on an imported dataframe, we may need to export this
######## To export a data frame, we use either of the following:

write.csv()

readr::write_csv()

######## In practice, we need to specify where and what:

readr::write_csv(dataframe, filepath)
my_data <- storms

######## Usually csvs are the easiest data sources to use,
########    usually, a csv is already processed in some sense
########    and so is approaching "oven-ready"

# ---------------------------------------------------------
# Section 3b: .xls/.xlsx Files
# ---------------------------------------------------------

######## Often however, you will be using Excel files, most commonly
########    a .xls or .xlsx file

######## To handle Excel files, we use another tidyverse package, readxl

readxl::read_excel()

######## This detects the file extension, and calls one of the following:

readxl::read_xls()
readxl::read_xlsx()

######## For example, some preloaded data in the readxl package:

readxl::read_xlsx(readxl_example("datasets.xlsx"))

# ---------------------------------------------------------
# Section 3c: Data From Other Programming Languages/Software
# ---------------------------------------------------------

######## Unfortunately the world doesn't just use .csv or .xlsx files :(
######## Thankfully the haven package (part of the tidyverse) has us covered

######## SAS data

read_sas("mtcars.sas7bdat")
write_xpt(mtcars, "mtcars.xpt")

######## SPSS data

read_sav("mtcars.sav")
write_sav(mtcars, "mtcars.sav")

######## Stata data

read_dta("mtcars.dta")
write_dta(mtcars, "mtcars.dta")

# ---------------------------------------------------------
# Section 3d: Handy Tips
# ---------------------------------------------------------

######## Don't import everything

######## col_select allows us to only import certain columns.
######## This is really useful when you're dealing with enormous dataframes with >50/100 columns.

read_csv(filepath, filename, col_select = c("column_1", "column_2"))

# ---------------------------------------------------------
# Section 5: Manipulating Data (binding and merging)
# ---------------------------------------------------------

######## We will use the storms dataset, which is contained within the tidyverse
######## So we can play around with some functions, we'll define some other dataframes
######## Let's assign them separately

my_data <- storms

######## We'll use these for binding
storms_old <- my_data[my_data["year"] < 2000, ]
storms_new <- my_data[my_data["year"] >= 2000, ]

######## We'll use these for joining
storms_lat_long <- my_data[c("year", "month", "day", "lat", "long")]
storms_type <- my_data[c("year", "month", "day", "status", "category")]

######## I'll also create another table we'll need, don't worry about the contents yet.

lat_lookup <- mutate(tibble(lat = seq(-90,90,0.1)), lat_label = case_when(lat < 0 ~ "southern hemisphere", lat < 23.43 ~ "below tropic of cancer", lat < 66.57 ~ "between cancer and arctic", TRUE ~ "above arctic"))
lat_lookup_filtered <- filter(lat_lookup, (5 * lat) %% 1 == 0)
long_lookup <- mutate(tibble(lat = seq(-90,90,0.1)),lat_label =  case_when(lat < 0 ~ "western hemisphere", TRUE ~ "eastern hemisphere"))

######## To combine data sets with the same column or row names, we can use.

dplyr::bind_rows()
dplyr::bind_cols()

######## For example
######## Can you guess what these produce

storms_all_dates <- dplyr::bind_rows(storms_old, storms_new)

storms_all_info <- dplyr::bind_cols(storms_lat_long, storms_type)

######## Similarly, to join data sets together, we can use 

dplyr::left_join()
dplyr::right_join()
dplyr::inner_join()
dplyr::full_join()

storms_lat_labelled_left <- dplyr::left_join(storms_lat_long, lat_lookup)


storms_lat_labelled_full <- dplyr::full_join(storms_lat_long, lat_lookup)
storms_lat_labelled_right <- dplyr::right_join(storms_lat_long, lat_lookup)

storms_lat_labelled_inner <- dplyr::inner_join(storms_lat_long, lat_lookup_filtered)
storms_lat_labelled_full2 <- dplyr::full_join(storms_lat_long, lat_lookup_filtered)

######## Note longer means more rows and wider means more columns

######## reduce(full_join, by='id')

###########################
# -------------------------
#         Session 3        Data Analysis
# -------------------------
###########################

######## Let's play around with the Storms dataset some more.
storms <- storms

# ---------------------------------------------------------
# Section 1: Basic Maths in Analysis
# ---------------------------------------------------------

######## There are some basic mathematical functions we can use in R
######## Note that the $(dollar) sign is use to denote which column of the dataset we want

max(storms$pressure)
min(storms$pressure)

mean(storms$wind)
median(storms$wind)

mean(storms$ts_diameter)
median(storms$ts_diameter)

mean(storms$ts_diameter, na.rm = TRUE)
median(storms$ts_diameter, na.rm = TRUE)

# ---------------------------------------------------------
# Section 2: dplyr and %>% 
# ---------------------------------------------------------

######## The key to using dplyr functions is the *pipe* which looks like: %>%
######## The shortcut to add a pipe is <ctrl-shift-m>
######## We call our dataset, use the pipe %>%, and then call the different functions we want to apply.

######## For those interested, the pipe is from the magrittr package

# ---------------------------------------------------------
# Section 2a: select()
# ---------------------------------------------------------

######## First off, the Select Function allows us to select specific Columns that we are interested in. 
######## Here, we can create a new dataset that just looks at the date and time of each storm by listing the columns from our original dataset that we want to keep.

storms_dates <- storms %>%
  dplyr::select(name, year, month, day, hour)

storms_dates_reordered <- storms %>%
  dplyr::select(name, hour, day, month, year)

######## This can also be achieved by deselecting the columns we are not interested in. To deselect, add a minus sign infront of column name. 
######## This can be useful when you have a large dataset with lots of columns, and only want to remove a one or two. 

storms_dates2 <- storms %>%
  dplyr::select(-lat, -long, -status, -category, -wind, -pressure, -ts_diameter, -hu_diameter)

# ---------------------------------------------------------
# Section 2b: rename()
# ---------------------------------------------------------

######## The rename function allows us to rename columns (duh!)
######## The first variable is the new name, the second variable is the old name (less obvious!)

storms_renamed <- storms %>% 
  dplyr::rename(storm_name = name)

######## The arrange function allows us to sort out dataset by a given column
######## For example, storms is already sorted chronologically, but lets sort it alphabetically by storm name

# ---------------------------------------------------------
# Section 2c: arrange()
# ---------------------------------------------------------

storms_alphabetical <- storms_renamed %>% 
  dplyr::arrange(storm_name)

######## We can arrange it the opposite way wrapping our column in the 'desc' function
storms_alphabetical <- storms_renamed %>% 
  dplyr::arrange(desc(storm_name))

# ---------------------------------------------------------
# Section 2d: filter()
# ---------------------------------------------------------

######## We can use the Filter function to select Rows we are interested in based on a condition. 
######## For example, here we can narrow down the Storms Dataset to only include Storms which occured after 2010. 

storms_recent <- storms %>%
  dplyr::filter(year > 2010)

######## We can also choose what we DON'T want our rows to include, using the exclamation point!
######## Below, we are filtering our dataset to include all rows that DON'T have an NA value for ts_diameter.

storms_clean <- storms %>%
  dplyr::filter(!is.na(ts_diameter))

######## We can use multiple pipes to apply multiple commands in one step. This can be using the same function or different functions.
######## The pipe always comes at the end of your line, as it introduces the next line.

######## Let's filter our dataset to show us only hurricanes after 2010 in one step using our pipe.

hurricanes_recent <- storms %>%
  dplyr::filter(year > 2010) %>%
  dplyr::filter(status == "hurricane")

# ---------------------------------------------------------
# Section 2e: mutate()
# ---------------------------------------------------------

######## The mutate function allows us to add new columns to our dataset. It's most useful when applying a function to that column which we pre-populate the column for you.
######## For example, we're going to add a column to our storms_clean dataset to tell us whether the storm was at Daytime or Nightime, using our hour value.
######## The first element is the name of our new column. We then add our function to calculate whether the column contains 'Daytime' or 'Nightime' based on the value of the hour.
######## Reminder that '&' is our symbol for AND, and "|" is our symbol for OR

storms_clean <- storms_clean %>%
  dplyr::mutate(time = case_when(
    hour > 6 & hour < 18 ~ "Daytime",
    hour <= 6 | hour >= 18 ~ "Nightime",
  ))

######## The summarise function creates a vector or dataset from a specific function applied to the dataset.
######## For example here, we can get the mean hour which storms occur by applying the mean function within the summarise function.

storms_clean_mean <- storms_clean %>%
  dplyr::summarise(mean(hour))

######## However, this hasn't been that useful as a standalone function, because we could have achieved the same output by simply doing:

storms_clean_mean <-mean(storms_clean$hour)

# ---------------------------------------------------------
# Section 2f: group_by() and ungroup()
# ---------------------------------------------------------

######## Summarise becomes most useful as a function when it is used in conjunction with the group_by and ungroup functions.
######## These functions allow us to separate data into groups depending on a specific variable, and then apply functions to these groups.
######## For example, we can get the mean hour which storms occur, grouped by the different type of storms.

storms_clean_mean2 <- storms_clean %>%
  dplyr::group_by(status)%>%
  dplyr::summarise(mean(hour))

######## This has given us a new dataframe that tells us the mean hour storms occur for each of the different storm types.

######## The ungroup function is the opposite of the group_by function, and simply disbands the groups you've created.
######## This is most useful when you want to group your dataset, mutate it in some way based on these groups, and then get back to the original ungrouped dataset.
######## For example, let's group our dataset by storm type, add a column that tells us the mean hour by storm type, ungroup our data, and add another column that tells us the mean hour overall.

storms_clean <- storms_clean %>%
  dplyr::group_by(status) %>%
  dplyr::mutate(mn_hour_type = mean(hour)) %>%
  dplyr::ungroup() %>%
  dplyr::mutate(mn_hour = mean(hour))

######## For best practice, always ungroup your data after grouping as this will reduce the likelihood of errors.

######## Let's put this all together to make one chunk of code that does all our cleaning:

hurricane_clean <- storms %>% 
  dplyr::select(-c(category, wind, pressure)) %>%  #remove the unnecessary columns
  dplyr::filter(year > 2000) %>% # select storms after 2000 only
  dplyr::filter(status == "hurricane") %>% #select hurricanes only
  dplyr::arrange(name) %>% #sort them alphabetically
  dplyr::mutate(time = case_when(
    hour > 6 & hour < 18 ~ "Daytime",
    hour <= 6 | hour >= 18 ~ "Nightime",)) #add our extra time column

######## I want to know the mean latitude/longitude of each storm 
######## Normally, I would simply to the group_by and summarise process as so

hurricane_summary <- hurricane_clean %>% 
  dplyr::group_by(name) %>% 
  dplyr::summarise(mean(lat), mean(long)) %>% 
  dplyr::ungroup()

######## However, I've spotted that names are often used more than once e.g. Alex 2004 and Alex 2010
######## Our code above was taking the mean for all storms named Alex, even if they were different storms
######## Let's fix this by adding a column to our hurricane_clean dataset to differentiate between these storms

hurricane_clean_fix <- hurricane_clean %>% 
  dplyr::mutate(hurricane_id = paste(name, year))

######## Now let's go back and run our summary code again, this time using the hurricane_id column rather than the name column:

hurricane_summary2 <- hurricane_clean_fix %>% 
  dplyr::group_by(hurricane_id) %>% 
  dplyr::summarise(mean(lat), mean(long)) %>% 
  dplyr::ungroup()

######## You can see the difference this has made because we now have 96 rows insetad of 75! Scroll through and spot which names have been used multiple times

###########################
# -------------------------
#         Session 4        Data Visualisation
# -------------------------
###########################

######## Visualisations can be achieved in multiply ways in R.
######## We can use either base R functions, or use packages.
######## The tidyverse contains a package that is incredibly useful and easy to learn/use.
######## This is ggplot2.

library(tidyverse)

# ---------------------------------------------------------
# Section 1: Scatter Plots
# ---------------------------------------------------------

######## Let's try and understand how the wind and pressure changes in time throughout our data series

######## We need to quickly clean our data.
######## Firstly, we'll add a column for the date, then we can group on the status.

storms_cleaned <- storms %>% 
  mutate(date = as.Date(paste(year, month, day, sep = "-"), format = "%Y-%m-%d"))

######## To use ggplot2, we call the ggplot function which indicates that we are producing a graphic

ggplot(storms_cleaned)

######## We also will come across the aes() function where we define the variables that we will be using in the plot

######## Handily we can use the pipe with this...
########    ... there is one new operator though!

######## Let's begin plotting with a scatter plot

graph_storms_scatter <- storms_cleaned %>% 
  ggplot(aes(x = date, y = pressure)) + 
  geom_point() 

######## This is quite messy but gives us a plot

storms_cleaned <- storms %>% 
  mutate(date = as.Date(paste(year, month, day, sep = "-"), format = "%Y-%m-%d")) %>% 
  filter(!is.na(pressure)) %>% 
  group_by(date) %>% 
  summarise(pressure = mean(pressure)) %>% 
  ungroup()

graph_storms_scatter <- storms_cleaned %>% 
  ggplot(aes(x = date, y = pressure)) + 
  geom_point() 

######## It may be more instructive to reduce the amount of data we have

graph_storms_scatter <- storms_cleaned %>% 
  filter(
    date > as.Date("2021-01-01")
  ) %>% 
  ggplot(aes(x = date, y = pressure)) + 
  geom_point() 

######## So we have a plot that is useful
######## We can also add colour to display another variable

storms_cleaned <- storms %>% 
  mutate(date = as.Date(paste(year, month, day, sep = "-"), format = "%Y-%m-%d")) %>% 
  filter(!is.na(pressure)) %>% 
  group_by(date, status) %>% 
  summarise(pressure = mean(pressure)) %>% 
  ungroup()

graph_storms_scatter <- storms_cleaned %>% 
  filter(
    date > as.Date("2021-01-01")
  ) %>% 
  ggplot(aes(x = date, y = pressure, colour = status)) + 
  geom_point() 

######## Similarly the size of the points can be added.
######## Please note the warning produced by R:
########    "Using size for a discrete variable is not advised"
######## This isn't too surprising, how should you quantify a discrete variable.

graph_storms_scatter <- storms_cleaned %>% 
  filter(
    date > as.Date("2021-01-01")
  ) %>% 
  ggplot(aes(x = date, y = pressure, size = status)) + 
  geom_point() 

######## Let's stick this all together!
######## Let's plot the distribution of the storms by lat / long
########    by category and adding the number of occurrences in our full dataset

storms %>% 
  mutate(date = as.Date(paste(year, month, day, sep = "-"), format = "%Y-%m-%d")) %>% 
  filter(date >= "2021-01-01") %>% 
  group_by(lat, long, status) %>% 
  summarise(frequency = n()) %>% 
  ungroup() %>% 
  group_by(lat, long) %>% 
  mutate(status_mode = ifelse(frequency == max(frequency), status, NA)) %>% 
  ungroup() %>% 
  ggplot(aes(x = long, y = lat, colour = status_mode, size = frequency)) +
  geom_point()

# ---------------------------------------------------------
# Section 2: Bar Charts
# ---------------------------------------------------------

######## Prepare the data we want to use

storms_bar <- storms %>% 
  group_by(year, status) %>% 
  summarise(frequency = n()) %>% 
  ungroup()

######## To produce bar charts, we can use either of:
########    geom_bar, when data is categorical,
########    geom_col, when data is continuous

# ---------------------------------------------------------
# Section 2a: (Discrete) Bar Charts - geom_bar()
# ---------------------------------------------------------

storms %>% 
  ggplot(aes(year)) +
  geom_bar()

storms %>% 
  ggplot(aes(x = year)) +
  geom_bar()

storms %>% 
  ggplot(aes(x = year)) +
  geom_bar(stat = "count")

######## I personally prefer the final one!
######## I like that the coder is left to specify greater detail
########    to reduce the ambiguity

storms %>% 
  group_by(year) %>% 
  summarise(frequency = n()) %>% 
  ungroup() %>% 
  ggplot(aes(x = year)) + 
  geom_bar()

######## There's an error here, can you see the issue?
######## We fix this using 'stat = ""'

storms %>% 
  group_by(year) %>% 
  summarise(frequency = n()) %>% 
  ungroup() %>% 
  ggplot(aes(x = year, y = frequency)) + 
  geom_bar(stat = "identity")

######## If we want a horizontal chart, we have the following options:

storms %>% 
  ggplot(aes(x = year)) + 
  geom_bar() + 
  coord_flip()

storms %>% 
  ggplot(aes(y = year)) + 
  geom_bar()

######## Let's add another variable into the mix

storms %>% 
  ggplot(aes(x = year, fill = factor(month))) + # Note the need for this factor
  geom_bar(stat = "count")

storms %>% 
  ggplot(aes(x = year, fill = factor(month))) + 
  geom_bar(stat = "count", position = "stack")

storms %>% 
  ggplot(aes(x = year, fill = factor(month))) + 
  geom_bar(stat = "count", position = "dodge")

storms %>% 
  ggplot(aes(x = year, fill = factor(month))) + 
  geom_bar(stat = "count", position = "fill")

######## Again, I favour using the final three options,
########    since there is no ambiguity!

######## Finally we produce pie charts through this method

storms %>% 
  filter(year > 2014) %>% 
  ggplot(aes(x = "", fill = factor(year))) +
  geom_bar() +
  coord_polar(theta = "y")

# ---------------------------------------------------------
# Section 2b: (Discrete and Continuous) Bar Charts - geom_col()
# ---------------------------------------------------------

######## geom_col() is the same as geom_bar(stat = "identity")

storms %>% 
  group_by(year) %>% summarise(frequency = n()) %>% ungroup() %>% 
  ggplot(aes(x = year, y = frequency)) +
  geom_col()

storms %>% 
  group_by(year, month) %>% summarise(frequency = n()) %>% ungroup() %>% 
  ggplot(aes(x = year, y = frequency, fill = month)) +
  geom_col(position = "stack")

storms %>% 
  group_by(year, month) %>% summarise(frequency = n()) %>% ungroup() %>% 
  ggplot(aes(x = year, y = frequency, fill = month)) +
  geom_col(position = "dodge")

storms %>% 
  group_by(year, month) %>% summarise(frequency = n()) %>% ungroup() %>% 
  ggplot(aes(x = year, y = frequency, fill = month)) +
  geom_col(position = "fill")

######## Note that fill = month is different to fill = factor(month).
######## These are performing different operations, 
########    and crucially, both are acceptable in geom_col().

# ---------------------------------------------------------
# Section 3: Histograms and Quantile Plots - geom_histogram() and geom_qq()
# ---------------------------------------------------------

######## Often, when using statistics, we need to check normality, 
########    for example if we are about to perform a t-test.

######## These are very similar to geom_bar()

# ---------------------------------------------------------
# Section 3a: Histograms - geom_histogram()
# ---------------------------------------------------------

storms %>% 
  ggplot(aes(x = year)) +
  geom_histogram()

storms %>% 
  ggplot(aes(x = year, fill = factor(month))) +
  geom_histogram(position = "dodge")

######## We can change the size of the "bins"

storms %>% 
  ggplot(aes(x = year)) +
  geom_histogram(binwidth = 10) # ie the bins are for 10 year, a decade

storms %>% 
  ggplot(aes(x = year)) +
  geom_histogram(bins = 20)

# ---------------------------------------------------------
# Section 3b: Quantile Plots - geom_qq()
# ---------------------------------------------------------

storms %>% 
  ggplot(aes(sample = year)) +
  geom_qq()

# ---------------------------------------------------------
# Section 3c: Density Plots - geom_density()
# ---------------------------------------------------------

storms %>% 
  ggplot(aes(x = year)) +
  geom_density()

storms %>% 
  ggplot(aes(x = year, fill = status)) +
  geom_density(alpha = 0.1) # alpha is a measure of the opacity of the colour

# ---------------------------------------------------------
# Section 4: Formatting Graphs
# ---------------------------------------------------------

######## I often find that my graphs end in places I never expected.
######## Consequently, it's really important that charts are labelled properly
######## Not just in the slides you put them into, but also the chart itself!
######## To do this we can use a couple of functions.

plot_example <- mutate(storms, date = as.Date(paste(year, month, day, sep = "-"))) %>% 
  ggplot(aes(x = date, fill = status)) +
  geom_density(alpha = 0.1)

plot_example +
  labs(
    title = "Time series of relative frequency of different storm types",
    subtitle = "Data: United States something or other",
    caption = paste("Chart produced", as.Date(Sys.time())),
    x = "Year",
    y = "Relative Frequency"
  )

######## We also need to be able to change our axes to better show the types of data

plot_example +
  scale_x_date(date_breaks = "5 years", date_labels = "%Y") +
  scale_y_continuous(labels = scales::percent)

######## Let's combine this all together!

full_plot_example <- storms %>% 
  mutate(date = as.Date(paste(year, month, day, sep = "-"))) %>% 
  ggplot(aes(x = date, fill = status)) +
  geom_density(alpha = 0.1) +
  scale_x_date(date_breaks = "5 years", date_labels = "%Y") +
  scale_y_continuous(labels = scales::percent) +
  labs(
    title = "Time series of relative frequency of different storm types",
    subtitle = "Data: United States something or other",
    caption = paste("Chart produced", as.Date(Sys.time())),
    x = "Year",
    y = "Relative Frequency"
  )

# ---------------------------------------------------------
# Section 5: Saving Charts
# ---------------------------------------------------------

######## Uncomment the line below and paste into console, it'll save in the current directory and you need format in file name
######## If you don't specify the plot, it'll just save the last one you produced
######## You can also save using RStudio buttons provided, but code may be more convenient

ggsave(plot = scatter_plot, filename = 'My_great_plot.jpeg', device = 'jpeg')