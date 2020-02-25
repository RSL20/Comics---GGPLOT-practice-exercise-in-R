# Print the first rows of the data

r1 <- read.csv("/home/sunbeam/R_loveeshbhat_imarticus/programs/Comics_Data.csv")
r1[1,]
names(r1)

# Check Levels of Align Variable

r2 <- r1[ ,c("align")] 
levels(r2)

# Check Levels of Gender

r3 <- r1[ ,c("gender")] 
levels(r3)

# Create a 2 way table using align and gender

table(r1$align, r1$gender)

# Remove ‘Reformed Criminals’ level from align variable using dplyr

library(dplyr)
r4 <- factor(droplevels(r2, "Reformed Criminals"))
head(r4)

# Create a side by side bar chart of gender by align variable using ggplot

library(ggplot2)
ggplot(r1, aes(x = gender, fill = align)) + geom_bar(position = "dodge") 

# Create a side by side bar chart of alignment by gender using ggplot

ggplot(r1, aes(x = align, fill = gender)) + geom_bar(position = "dodge") 

# Write the interpretation of bar charts
# There is an association between Gender and Alignment.
# There are less number of female characters than that of male characters.
# bad alignment is less in female.
# The Characters with Neutral alignment, Males are the most common.

# Create a table of number of comics using align variable

r5 <- table(r1$align)
r5

# Create a propotional table using the above table using prop.table(), what is the proportion of Bad, Good and Neutral

r6 <- table(r1$align)
prop.table(r6)

# Create a propotional table using the above table using prop.table(), what is the proportion of No Dual, Public, Secret and Unknown

r7 <- table(r1$id)
prop.table(r7)

# Plot the proportions using ggplot(use bar plot); x = id, y = proportion, fill = align

ggplot(data = r1, aes(x = id, fill = align)) + geom_bar(position = "fill")

# Plot same as above, swap the id and align variable

ggplot(data = r1, aes(x = align, fill = id)) + geom_bar(position = "fill")

# Using proportions, answer approximately what proportion of all female characters are good

r8 <- table(r1$align, r1$gender)
prop.table(r8, 2)

## Answer = 50%

# Plot the count of gender using align (use ggplot with bar)

ggplot(r1, aes(x = align, fill = gender)) + geom_bar()

# Plot the above plot using proportions

ggplot(r1, aes(x = align, fill = gender)) + geom_bar(position = "fill")

# Plot the distribution of id variable

ggplot(r1, aes(x = id)) + geom_bar()

# Using ggplot show the distribution of id variable, use facets to show the distribution for Bad, Good and Netural (Align Variable)

ggplot(r1, aes(x = id)) + geom_bar() + facet_wrap(~ align)

# Realgin the levels of align to show the plot as Bad, Netural and Good instead of Bad, Good and Neutral

levels(r4)
r9 <- factor(r1, levels = c("Bad", "Good", "Neutral"), labels = c("Bad", "Neutral", "Good"), exclude = NA)
head(r9)

# Make a facet plot of alignment broken down by gender

ggplot(r1, aes(x = align)) + geom_bar() + facet_wrap(~ gender)

