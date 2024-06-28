# R module for beginners

## R/RStudio
Download and install:  
R: https://www.r-project.org/  
RStudio: https://posit.co/download/rstudio-desktop/ 

### Useful RStudio hotkeys
<pre>
<b>ctrl + shift + c</b> -> comment block  
<b>ctrl + enter</b>     -> execute line(s) at console  
<b>ctrl + i</b>         -> auto-indentation  
<b>ctrl + z</b>         -> undo  
<b>ctrl + shift + z</b> -> redo  
<b>ctrl + +</b>         -> zoom in  
<b>ctrl + -</b>         -> zoom out
</pre>

## Lesson 1 - Data Types
https://www.datacamp.com/community/tutorials/data-types-in-r  
**class()** -> exact data type (see object oriented programming)  
**typeof()** -> type of object from R’s viewpoint

**Basic:** Numeric, Integer, as.integer(casting), Character (=String), Logical and Factor  
**Structures:** vector, list, matrix, dataframe  
**Subsetting:** https://www.datacamp.com/community/tutorials/subsets-in-r  

## Lesson 2 - Scripts
Execute R scripts with the command: **Rscript script_name.R param_1 param_2 ...**

## Lesson 3 - Operations
### Searching
**grep/grepl** -> match string pattern in character vector (l = logical)  
**match** -> returns first match  
**which** -> returns all matches (slower)  
https://www.r-bloggers.com/2011/11/match-vs-in

### Benchmarking
Time code (proc.time())  
user -> code execution time  
system -> system processes time  
elapsed -> time since program started running, usually = user + system  
https://stats.idre.ucla.edu/r/faq/how-can-i-time-my-code/  
**avoid for loops**, where possible

### Input/Output
**read.table()** -> read file data into a dataframe  
**readLines()** -> read open file connection by line(s)  
**write.table()** -> write dataframe to outfile  
**cat(sprint(), file = con)** -> write formatted lines to open w/a connection  
**saveRDS()**, **readRDS()** -> R binary format

#### Examples
read.table vs readRDS  
match vs which vs grep  
rbind vs i/o

### Parsing
sub: replace first  
gsub: replace all

## Lesson 4 - Plots
Plotly library: https://plotly.com/r/  
Interactive web-based graphs via plotly.js (JavaScript library)  
Pre-build functionality in plots: 
- download
- zoom
- pan
- reset

### Basics
https://plotly.com/r/plotly-fundamentals/  
%>% pipe operator  
hover: https://plotly.com/r/hover-text-and-formatting/

### Plots
Pie Chart: https://plotly.com/r/pie-charts/  
Violin: https://plotly.com/r/violin/  
https://plotly.github.io/plotly.py-docs/generated/plotly.graph_objects.Violin.html  
Heatmap https://plotly.com/r/heatmaps/  
Sankey https://plotly.com/r/sankey-diagram/

### 3D
Scatter https://plotly.com/r/3d-scatter-plots/  
Surface https://plotly.com/r/3d-surface-plots/  
Line https://plotly.com/r/3d-line-plots/
