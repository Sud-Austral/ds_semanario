
```{r}
##############
#1
pdsi_semanario <- readxl::read_xlsx("C:/Users/chris/Desktop/GitHub/ds_semanario/xlsx_variables_areas_protegidas_a_imputar/pdsi_semanario.xlsx")
pdsi_semanario
```

```{r}
nas <- pdsi_semanario
los_codigos_subsubcuencales <- nas[,c(256)]

nas <- nas[,c(1:252)]

for (i in 1:252) {
  nas[,i][nas[,i] == 0] <- NA
}

nas <- as.data.frame(nas)

tabla_nas <- nas

library(mice)

imputed_Data <- mice(tabla_nas, m = 3, maxit = 3, method = 'cart', seed = 500)

completeData <- complete(imputed_Data,3)

TERRACLIMATE_MEDIA_sub_sub_cuenca_pdsi_imp = cbind(completeData, los_codigos_subsubcuencales)

writexl::write_xlsx(TERRACLIMATE_MEDIA_sub_sub_cuenca_pdsi_imp,"imp/TERRACLIMATE_MEDIA_sub_sub_cuenca_pdsi_imp.xlsx")

saveRDS(TERRACLIMATE_MEDIA_sub_sub_cuenca_aet_imp,"imp/TERRACLIMATE_MEDIA_sub_sub_cuenca_pdsi_imp.rds")
```