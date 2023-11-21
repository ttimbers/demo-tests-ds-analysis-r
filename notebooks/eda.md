Demo of sourcing an R function from a script
================

Here we demonstrate how we can use the `source` function to read in a
function stored in another R script contained within this repository.
The function in the file `../R/count_classes.R` is named `count_classes`
(it doesn’t have to have the same name as the file, but it often makes
sense to do this), and sourcing the file allows us to access the
function in this notebook. We will demonstrate using it below to
calculate the number of observations in each class of a data set.

``` r
library(tidyverse)
```

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.2     ✔ readr     2.1.4
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.0
    ## ✔ ggplot2   3.4.3     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
    ## ✔ purrr     1.0.2     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

``` r
source("../R/count_classes.R")
```

Here’s some data (the Wisconsin Breast Cancer data set, originally from
the [UCI machine learning
repository](https://archive-beta.ics.uci.edu/ml/datasets/breast+cancer+wisconsin+diagnostic))
where we would like to calculate the number of observations in each
class:

``` r
cancer <- read_csv("https://raw.githubusercontent.com/UBC-DSCI/introduction-to-datascience/main/data/wdbc.csv")
```

    ## Rows: 569 Columns: 12
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (1): Class
    ## dbl (11): ID, Radius, Texture, Perimeter, Area, Smoothness, Compactness, Con...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
cancer
```

    ## # A tibble: 569 × 12
    ##        ID Class Radius Texture Perimeter   Area Smoothness Compactness Concavity
    ##     <dbl> <chr>  <dbl>   <dbl>     <dbl>  <dbl>      <dbl>       <dbl>     <dbl>
    ##  1 8.42e5 M      1.10   -2.07     1.27    0.984      1.57       3.28      2.65  
    ##  2 8.43e5 M      1.83   -0.353    1.68    1.91      -0.826     -0.487    -0.0238
    ##  3 8.43e7 M      1.58    0.456    1.57    1.56       0.941      1.05      1.36  
    ##  4 8.43e7 M     -0.768   0.254   -0.592  -0.764      3.28       3.40      1.91  
    ##  5 8.44e7 M      1.75   -1.15     1.78    1.82       0.280      0.539     1.37  
    ##  6 8.44e5 M     -0.476  -0.835   -0.387  -0.505      2.24       1.24      0.866 
    ##  7 8.44e5 M      1.17    0.161    1.14    1.09      -0.123      0.0882    0.300 
    ##  8 8.45e7 M     -0.118   0.358   -0.0728 -0.219      1.60       1.14      0.0610
    ##  9 8.45e5 M     -0.320   0.588   -0.184  -0.384      2.20       1.68      1.22  
    ## 10 8.45e7 M     -0.473   1.10    -0.329  -0.509      1.58       2.56      1.74  
    ## # ℹ 559 more rows
    ## # ℹ 3 more variables: Concave_Points <dbl>, Symmetry <dbl>,
    ## #   Fractal_Dimension <dbl>

To calculate the number observations of each class, we will use the
`count_classes` function from the `../R/count_classes.R` file that we
sourced in the first code cell of this notebook:

``` r
count_classes(cancer, Class)
```

    ## # A tibble: 2 × 2
    ##   class count
    ##   <chr> <int>
    ## 1 B       357
    ## 2 M       212

Ta da! Now isn’t that easier to read for a human trying to understand
the analysis, compared to if we included the source code for that
function in this notebook?
