get_stage("deploy") %>%
  add_code_step(withr::with_dir("mlr3", tinytex::latexmk("mlr3cheatsheet.tex"))) %>%
  add_code_step(fs::file_move("mlr3/mlr3cheatsheet.pdf", "mlr3.pdf"))) %>%
  add_code_step(writeLines("cheatsheets.mlr-org.com", "CNAME"))

if (ci_can_push() && !ci_is_tag()) {
  get_stage("before_deploy") %>%
    add_step(step_setup_ssh())

  if (ci_get_branch() == "master") {
    get_stage("deploy") %>%
      add_step(step_setup_push_deploy(path = ".", branch = "gh-pages",
        orphan = TRUE)) %>%
      add_step(step_do_push_deploy(commit_paths = c("mlr3.pdf",
        "CNAME")))
  }
}
