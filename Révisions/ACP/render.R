library(rmarkdown)


render(input = "FIFA_PCA.Rmd", 
      output_format = "md_document", output_file = "README.md")