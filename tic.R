# install dependencies
get_stage("install") %>%
  add_step(step_install_deps())

# render cheatsheets
get_stage("script") %>%
  add_code_step({
    files = list.files(".", pattern = "^mlr3.*\\.Rmd$", recursive = TRUE)
    lapply(files, function(file) {
<<<<<<< HEAD
      out_file = gsub(".Rmd", ".pdf", basename(file))
=======
      out_file = file.path("pdf", gsub(".Rmd", ".pdf", basename(file)))
>>>>>>> 27e43795ab6251b945e28544f6400a29458b5bc1
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
<<<<<<< HEAD
    add_step(step_do_push_deploy(commit_paths = c("CNAME", list.files(pattern = "^mlr3.*\\.pdf"))))
=======
    add_step(step_do_push_deploy(commit_paths = c("CNAME", "pdf/")))
>>>>>>> 27e43795ab6251b945e28544f6400a29458b5bc1
}
