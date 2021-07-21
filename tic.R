# install dependencies
get_stage("install") %>%
  add_step(step_install_deps())

# render cheatsheets
get_stage("script") %>%
  add_code_step({
    files = list.files(".", pattern = "^mlr3.*\\.Rmd$", recursive = TRUE)
    lapply(files, function(file) {
      out_file = gsub(".Rmd", ".pdf", basename(file))
      cheatdown::print_pdf(file, out_file)
    })
  })

# deploy
if (ci_get_branch() == "main") {
  get_stage("before_deploy") %>%
    add_step(step_setup_ssh()) %>%
    add_step(step_setup_push_deploy(branch = "gh-pages", orphan = TRUE))

  get_stage("deploy") %>%
    add_code_step(writeLines("cheatsheets.mlr-org.com", "CNAME")) %>%
    add_step(step_do_push_deploy(commit_paths = c("CNAME", "mlr3tuning.pdf", "mlr3.pdf", "mlr3pipelines.pdf", "mlrcheatsheet.pdf")))
}
