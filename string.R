# from: ./GTEx/GTEx_Analysis_v8_eQTL_covariates//Adipose_Subcutaneous.v8.covariates.txt
# to: Adipose_Subcutaneous

x <- "./GTEx/GTEx_Analysis_v8_eQTL_covariates//Adipose_Subcutaneous.v8.covariates.txt"

# step1: ./GTEx/GTEx_Analysis_v8_eQTL_covariates//Adipose_Subcutaneous
step1 <- gsub(pattern = "\\.v8.+$", replacement = "", x)

# step2: Adipose_Subcutaneous
step2 <- gsub(pattern = "^.+//", replacement = "", step1)

