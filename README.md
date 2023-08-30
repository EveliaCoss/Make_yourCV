# Curriculum vitae in r
Make your Curriculum vitae in r | Genera tu Curriculum vitae en R

Notas personales recabadas a partir de los tutoriales y ejemplos 😊. Espero que les funcione 💜

## Materiales informativos

- [datadrivencv](https://github.com/nstrayer/datadrivencv) - Tutorial del creador del paquete (cv.Rmd)
- [Monica Padilla-Rladies](https://github.com/mpadilla905/curso-cv/tree/main/slides) - Presentacion en el encuentro de Rladies Mexico
- [Monica Padilla-CV](https://github.com/mpadilla905/mpadilla905.github.io) - CV de Monica Padilla (cv.rmd)
- [Leonardo Collado-CV](https://github.com/lcolladotor/cv) - CV del Dr. Leonardo Collado (index.Rmd)

💪 Estuve muy intensa viendo su codigo. Muchas gracias por tenerlos publico.

## Paquetes 📕

- [rmarkdown](https://rmarkdown.rstudio.com/articles_intro.html)
- [pagedown](https://github.com/rstudio/pagedown) 
- [devtools](https://www.r-project.org/nosvn/pandoc/devtools.html) - Instalacion de paquetes de Github
- [datadrivencv](https://nickstrayer.me/datadrivencv/)
- [fontawesome](https://github.com/rstudio/fontawesome)

## Instalacion de paquetes

```
install.packages("rmarkdown")
remotes::install_github('rstudio/pagedown')
install.packages("devtools")
devtools::install_github("nstrayer/datadrivencv")
```

## Pasos para crear tu CV

Despues de la instalacion de los paquetes podemos encontrar la explicacion del empleo del paquete datadrivencv en [nstrayer/datadrivencv](https://github.com/nstrayer/datadrivencv). Sin embargo te lo resumo de forma mas sencilla.

### 1. Crea un **Documento en google**

💜 **Nota**: No coloques simbolos raros ni acentos en el archivo.

💜 **Nota**: El archivo de google debes darle acceso de edicion antes de copiar el link.

Puedes basarte en el ejemplo de [Strayer](https://docs.google.com/spreadsheets/d/14MQICF2F8-vf8CKPF1m4lyGKO6_thG-4aSwat1e2TWc/edit#gid=917338460), para lo cual puedes generar un copia en tu archivos de google --> Archivo/Hacer una copia
 - Tambien te dejo el ejemplo de [Monica Padilla](https://docs.google.com/spreadsheets/d/1gy4_VaGXhYMi8TwakQGk80dWoYfrSY3Wkl4BqVxECNY/edit#gid=917338460)
 - Y mi [CV](https://docs.google.com/spreadsheets/d/1gy4_VaGXhYMi8TwakQGk80dWoYfrSY3Wkl4BqVxECNY/edit#gid=917338460)

El archivo tipo Excel se compone de cuatro Hojas o secciones: *entries, language_skills, text_blocks, contact_info*.

- 🌟 *entries*: Contiene toda la informacion sobre tu trayectoria academica (education), estancias academicas o practicas profesionales (research_positions), antecedentes en la industria (industry_positions), experiencia dando clases (teaching_positions), escritura de articulos cientificos (academic_articles), etc. Tu puedes agregar nuevas secciones en esta parte y apareceran en el Rmarkdown cuando mencionemos. Si quieres saber mas de las columnas de entries, puedes localizarlo en [datadrivencv/entries](https://docs.google.com/spreadsheets/d/14MQICF2F8-vf8CKPF1m4lyGKO6_thG-4aSwat1e2TWc/edit#gid=917338460).
- 💋 *language_skills*: Informacion sobre los lenguajes de programacion que manejas.
- 😎 *text_blocks*: Informacion sobre ti. Un preve resumen de tu trayectoria o gustos, puede ser en la industria, desarrollando paquetes o tal vez enseñando. 
- 💅 *contact_info*: Como te pueden contactar. Tus redes sociales.

Adicionalmente usando el ejemplo de [Monica Padilla](https://docs.google.com/spreadsheets/d/1gy4_VaGXhYMi8TwakQGk80dWoYfrSY3Wkl4BqVxECNY/edit#gid=927831363), ella agrego una nueva hoja que se llama *programming_languagues* en la cual podemos mostrar nuestras fortalezas en los lenguajes de programacion clasificandolos como Expertos (expertise) o en los cuales tenemos algunos conocimientos (familiarity). 

### 2. Crear tu script en Rmarkdown (CV.Rmd)

Para la generacion de tu script CV.Rmd, puedes descargar como base cualquiera de los siguientes archivos, elige el que se adapte mejor a tus necesidades y al que le entiendas mejor:

- [Strayer](https://github.com/nstrayer/cv/blob/master/cv.Rmd)
- [Monica Padilla](https://github.com/mpadilla905/mpadilla905.github.io/blob/master/cv.rmd)
- [Leonardo Collado](https://github.com/lcolladotor/cv/blob/gh-pages/index.Rmd)
- [Mio - Evelia Coss](https://github.com/EveliaCoss/Make_yourCV/blob/dbed3e34e87e2013115e550845cd5f32e17e515c/cv_ECoss.rmd)

Una vez que lo cargues en Rstudio, entonces podras observar que en el primer chuck o seccion de codigo, encuentras la siguiente informacion:

```
knitr::opts_chunk$set(
  results='asis', 
  echo = FALSE
)

library(magrittr) # For the pipe
source("cv_printing_functions.r")

# Template https://github.com/nstrayer/datadrivencv/blob/master/inst/templates/cv.Rmd
# Ultima actualizacion https://github.com/nstrayer/cv/blob/master/cv.Rmd

# Read in all data and initialize a CV printer object
#CV <- create_CV_object(
#  data_location = "https://docs.google.com/spreadsheets/d/1NqKZJyykZ1W_qAy8skSY9FH5Vh9ikSiUOuvYSTz_gkc/edit#gid=917338460",  
#  pdf_mode = params$pdf_mode
#)

CV <- create_CV_object(
  data_location = "https://docs.google.com/spreadsheets/d/1NqKZJyykZ1W_qAy8skSY9FH5Vh9ikSiUOuvYSTz_gkc/edit?usp=sharing",  
  pdf_mode = params$pdf_mode
 )
```

Necesitas cargar en el ambiente la funcion contenida en el archivo *cv_printing_functions.r*, lo cual se ejecuta con `source("cv_printing_functions.r")`. Pero primero deberas descargar esta funcion de: [CV_printing_functions.R](https://github.com/nstrayer/cv/blob/master/CV_printing_functions.R), pero **si usas el ejemplo de Monica Padilla** deberas emplear el archivo editado que ella genero, [aqui](https://github.com/mpadilla905/mpadilla905.github.io/blob/master/cv_printing_functions.r). Recuerda que en el archivo de Monica se contempla una nueva hoja en el archivo tipo excel (*programming_languagues*), por lo que la otra funcion no lo reconoce y te marcara error. Como mi ejemplo se basa en el de Monica empleo *cv_printing_functions.r*.

💜 **Nota**: Coloque en esta carpeta la funcion *cv_printing_functions.r* de Monica, por si batallan para encontrarla. 😇

Tambien deberas modificar el link con tu propio archivo generado en Google, la seccion `data_location` en la funcion `create_CV_object`. 

Posteriormente en la seccion *Disclaimer* del codigo, puedes colocar el link de tu Github para que la gente pueda acceder facilmente a tu CV. Recordando colorcar el link de los creadores 💫.

```
The source code is available at [EveliaCoss/CV](https://github.com/EveliaCoss/CV) and is powered by [nstrayer/cv](https://github.com/nstrayer/cv).
```

Hasta este punto tu codigo estaria completo y ejecutable 🌟😎

Sin embargo, si quieres agregar nuevas secciones en tu CV, como por ejemplo "Divulgacion cientifica". En mi ejemplo lo agregue como la seccion *science_communication* en mi [documento](https://docs.google.com/spreadsheets/d/1NqKZJyykZ1W_qAy8skSY9FH5Vh9ikSiUOuvYSTz_gkc/edit?usp=sharing). Luego dentro de mi script coloque el siguiente codigo, para señalar la creaccion de una nueva seccion y de donde debe ser tomada la informacion. 

```
Science Communication {data-icon=atom}
--------------------------------------------------------------------------------
```
```{r}
CV %<>% print_section('course_attendances')
```

Puedes observar mejor el codigo contenido en el archivo [cv_Ecoss.rmd](https://github.com/EveliaCoss/Make_yourCV/blob/9144ab773fe8295208d4a9d0d0572c1085ef73a6/cv_ECoss.rmd).

💜 **Nota**: El icono que se quiere emplear por cada seccion se senala con *data-icon* y pueden visualizarse en la pagina web del paquete [fontawesome](https://fontawesome.com/v5/icons/atom?s=solid).

### 3. Obtener pagina web y pdf (render_cv.r)

El siguiente codigo se editado y ajustado para la ejecución de mi codigo. La informacion contenida en el archivo [render_cv.R](https://github.com/nstrayer/cv/blob/master/render_cv.R) del mismo paquete contiene errores, por lo que sugiero que empleen el que viene en la pagina web de [datadrivencv](https://nickstrayer.me/datadrivencv/#render_cvr).

```
library(tidyverse)
source("cv_printing_functions.R")
cv_data <- create_CV_object(
  data_location = "https://docs.google.com/spreadsheets/d/1NqKZJyykZ1W_qAy8skSY9FH5Vh9ikSiUOuvYSTz_gkc/edit?usp=sharing"
)

readr::write_rds(cv_data, 'cached_positions.rds')
cache_data <- TRUE


# Knit the HTML version
rmarkdown::render("cv_ECoss.Rmd",
                  params = list(pdf_mode = FALSE),
                  output_file = "cv_ECoss.html")

# Knit the PDF version to temporary html location
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("cv_ECoss.Rmd",
                  params = list(pdf_mode = TRUE),
                  output_file = tmp_html_cv_loc)

# Convert to PDF using Pagedown
pagedown::chrome_print(input = tmp_html_cv_loc,
                       output = "EveliaCoss_cv.pdf")

```

Y si llegaste al final 🌟💜 y ahora quieres hacer tu propio Github con tus notas y poner emogis, te dejo esta hermosa pagina que encontre con los [emogis](https://gist.github.com/rxaviers/7360908). Solo copialos y pegalos sin miedo 😏. 








