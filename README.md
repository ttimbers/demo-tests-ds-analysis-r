# Demo of tests for functions used in data analysis

This repository serves as a demonstration of how to setup 
unit tests for functions that are used in a data analysis.
This is one step away from making an R package.

The demo data analysis is shown in two files:
- `notebooks/eda.ipynb`
- `notebooks/eda.Rmd`

Those literate code documents call a function, `count_classes`, 
which lives in `R/count_classes.r`
and who calculates the number observations of each class of a data set.

The tests for `count_classes` live in `tests/testthat/test-count_classes.R`,
and the helper data for the tests lives in `tests/testthat/helper-count_classes.R`.

The test suite can be run via: 

```
testthat::test_dir("tests/testthat")
```

`testthat::test_dir("tests/testthat")` first runs any files that begin with `helper*` 
and then any files that begin with `test*`.

Several `usethis` R package functions can be used to setup the file 
and directory structure needed for this:
- `usethis::use_r("FUNCTION_NAME")` can be used to create the R script file the function should live in, inside the R directory
- `usethis::use_testthat()` can be used to create the necessary test directories to use `testthat`'s automated test suite execution function (`testthat::test_dir("tests/testthat")`)
- `usethis::use_test("FUNCTION_NAME")` can be used to create the test file for each function

*Note: `tests/testthat/helper-count_classes.R` was created manually, as there is no `usethis` function to automate this.*

## Dependencies:
R and the `testthat` & `tidyverse` R packages. As well as either Jupyter or
the `Rmarkdown` package.

