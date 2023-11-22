library(testthat)
source("../../R/count_classes.R")

test_that("`count_classes` should return a tibble", {
  expect_s3_class(count_classes(two_classes_3_obs, class_lables), "data.frame")
})

test_that("`count_classes` should return a data frame, or data frame extension, 
with the number of rows that corresponds to the number of unique classes 
in the column passed to `class_col`", {
  expect_equivalent(count_classes(five_classes_3_obs, class_lables), five_classes_3_obs_output)
  expect_equivalent(count_classes(two_classes_3_obs, class_lables), two_classes_3_obs_output)
  expect_equivalent(count_classes(one_class_3_obs, class_lables), one_class_3_obs_output)
  expect_equivalent(count_classes(empty_df, class_lables), empty_df_output)
})

test_that("`count_classes` should return a data frame, or data frame extension, 
whose values in the `count` column correspond to the number of observations 
for the group in the `class` column from the original data frame", {
  expect_equivalent(count_classes(two_classes_3_and_2_obs, class_lables), two_classes_3_and_2_obs_output)
  expect_equivalent(count_classes(two_classes_3_and_1_obs, class_lables), two_classes_3_and_1_obs_output)
})

test_that("`count_classes` should throw an error when incorrect types 
are passed to `data_frame` and `class_col` arguments", {
  expect_error(count_classes(two_classes_3_obs, vector_class_labels))
  expect_error(count_classes(two_classes_3_obs_as_list, class_lables))
})
