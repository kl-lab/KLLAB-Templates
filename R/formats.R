#' Output formats for Monash EBS documents
#'
#' Each function is a wrapper for \code{\link[bookdown]{pdf_document2}} to
#' produce documents in Monash EBS style.
#'
#' @param \dots Arguments passed to \code{\link[bookdown]{pdf_document2}}.
#'
#' @return An R Markdown output format object.
#'
#' @author Rob J Hyndman
#'
#' @export
letter <- function(...) {
  template <- system.file("rmarkdown/templates/Letter/resources/monashletter.tex",
                          package="MonashEBSTemplates")
   bookdown::pdf_document2(...,
     template = template
   )
}

#' @rdname letter
#' @export
exam <- function(...) {
  template <- system.file("rmarkdown/templates/Exam/resources/examtemplate.tex",
                          package="MonashEBSTemplates")
  bookdown::pdf_document2(...,
                          template = template
  )
}

#' @rdname letter
#' @export
workingpaper <- function(...) {
  template <- system.file("rmarkdown/templates/WorkingPaper/resources/monashwp.tex",
                          package="MonashEBSTemplates")
  bookdown::pdf_document2(...,
                          template = template
  )
}


#' @rdname letter
#' @export
report <- function(...) {
  template <- system.file("rmarkdown/templates/Report/resources/report.tex",
                          package="KLLabTemplates")
  bookdown::pdf_document2(...,
                          template = template
  )
}

#' @rdname letter
#' @export
memo <- function(...) {
  template <- system.file("rmarkdown/templates/Memo/resources/monashmemo.tex",
                          package="MonashEBSTemplates")
  bookdown::pdf_document2(...,
                          citation_package = 'biblatex',
                          template = template
  )
}

#' @rdname letter
#' @export
slides <- function(toc = FALSE,
                   slide_level = 2,
                   incremental = FALSE,
                   fig_width = 8,
                   fig_height = 5,
                   fig_crop = TRUE,
                   fig_caption = TRUE,
                   dev = 'pdf',
                   df_print = "default",
                   fonttheme = "default",
                   colortheme = "beihangblue",
                   highlight = "tango",
                   keep_tex = FALSE,
                   latex_engine = "pdflatex",
                   citation_package = c("none", "natbib", "biblatex"),
                   includes = NULL,
                   md_extensions = NULL,
                   pandoc_args = NULL,
                   school="buaa") {

  if (school=="buaa"){
    colortheme = "beihangblue"
    file.copy(system.file("rmarkdown", "templates", "Slides", "skeleton",
                            "titlepage_buaa.png", package = "KLLabTemplates"),
                "./titlepage.png", recursive = TRUE, overwrite = TRUE)
  }
  if (school=="cufe"){
    colortheme = "cufeblue"
    file.copy(system.file("rmarkdown", "templates", "Slides", "skeleton",
                            "titlepage_cufe.png", package = "KLLabTemplates"),
                "./titlepage.png", recursive = TRUE, overwrite = TRUE)
  }
  fcolortheme <- paste0("beamercolortheme",colortheme,".sty")
  for (f in c("beamerfontthemebc.sty",fcolortheme,
              "beamerthemebc.sty", "figs/"))
    if (!file.exists(f))
      file.copy(system.file("rmarkdown", "templates", "Slides", "skeleton",
                            f, package="KLLabTemplates"),
                ".", recursive=TRUE)

  template <- system.file("rmarkdown", "templates", "Slides",
                          "resources", "template.tex",
                          package="KLLabTemplates")

  rmarkdown::beamer_presentation(template = template,
                                 toc = toc,
                                 slide_level = slide_level,
                                 incremental = incremental,
                                 fig_width = fig_width,
                                 fig_height = fig_height,
                                 fig_crop = fig_crop,
                                 fig_caption = fig_caption,
                                 dev = dev,
                                 df_print = df_print,
                                 theme = "bc",
                                 colortheme = colortheme,
                                 fonttheme = fonttheme,
                                 highlight = highlight,
                                 keep_tex = keep_tex,
                                 latex_engine = latex_engine,
                                 citation_package = citation_package,
                                 includes = includes,
                                 md_extensions = md_extensions,
                                 pandoc_args = pandoc_args)

}

