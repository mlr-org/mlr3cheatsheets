get_stage("deploy") %>%
  # mlr3
  add_code_step(withr::with_dir("mlr3", tinytex::latexmk("mlr3cheatsheet.tex"))) %>%
  add_code_step(fs::file_move("mlr3/mlr3cheatsheet.pdf", "mlr3.pdf")) %>%
  # mlr3pipelines
  add_code_step(withr::with_dir("mlr3pipelines", tinytex::latexmk("mlr3pipelinescheatsheet.tex"))) %>%
  add_code_step(fs::file_move("mlr3pipelines/mlr3pipelinescheatsheet.pdf", "mlr3pipelines.pdf")) %>%
  # CNAME
  add_code_step(writeLines("cheatsheets.mlr-org.com", "CNAME"))

if (ci_can_push() && !ci_is_tag()) {
  get_stage("before_deploy") %>%
    add_step(step_setup_ssh()) %>%
    add_step(step_setup_push_deploy(path = ".", branch = "gh-pages",
      orphan = TRUE)) %>%

    # only deploy on master branch
    if (ci_get_branch() == "master") {
      get_stage("deploy") %>%
        add_step(step_do_push_deploy(commit_paths = c(
          "mlr3.pdf",
          "mlr3pipelines.pdf",
          "CNAME"))
        )
    }
}
