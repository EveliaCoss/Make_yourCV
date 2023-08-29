# This script builds both the HTML and PDF versions of your CV

# If you want to speed up rendering for googlesheets driven CVs you can cache a
# version of your data This avoids having to fetch from google sheets twice and
# will speed up rendering. It will also make things nicer if you have a
# non-public sheet and want to take care of the authentication in an interactive
# mode.
# To use, simply uncomment the following lines and run them once.
# If you need to update your data delete the "ddcv_cache.rds" file and re-run

library(tidyverse)
source("cv_printing_functions.R")
cv_data <- create_CV_object(
  data_location = "https://docs.google.com/spreadsheets/d/1NqKZJyykZ1W_qAy8skSY9FH5Vh9ikSiUOuvYSTz_gkc/edit?usp=sharing"
)

readr::write_rds(cv_data, 'cached_positions.rds')
cache_data <- TRUE

# Codigo version anterios https://github.com/mpadilla905/mpadilla905.github.io/blob/master/cv_printing_functions.r
# Knit the HTML version
#rmarkdown::render("cv.rmd",
#                  params = list(pdf_mode = FALSE, cache_data = cache_data),
#                  output_file = "index.html")

# Codigo actualizado https://nickstrayer.me/datadrivencv/
rmarkdown::render("cv_ECoss.Rmd",
                  params = list(pdf_mode = FALSE),
                  output_file = "cv_ECoss.html")

# Codigo version anterios https://github.com/mpadilla905/mpadilla905.github.io/blob/master/cv_printing_functions.r
# Knit the PDF version to temporary html location
#tmp_html_cv_loc <- fs::file_temp(ext = ".html")
#rmarkdown::render("cv.rmd",
#                  params = list(pdf_mode = TRUE, cache_data = cache_data),
#                  output_file = tmp_html_cv_loc)

# # Codigo actualizado https://nickstrayer.me/datadrivencv/
# Knit the PDF version to temporary html location
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("cv_ECoss.Rmd",
                  params = list(pdf_mode = TRUE),
                  output_file = tmp_html_cv_loc)

# Convert to PDF using Pagedown
pagedown::chrome_print(input = tmp_html_cv_loc,
                       output = "EveliaCoss_cv.pdf")
