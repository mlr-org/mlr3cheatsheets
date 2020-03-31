get_stage("deploy") %>%
  add_code_step(fs::dir_create("docs/")) %>%
  add_code_step(fs::file_copy("README.md", "docs/")) %>%
  # mlr
  add_code_step(fs::file_move("mlr3/mlrcheatsheet.pdf", "docs/mlr.pdf")) %>%
  # mlr3
  add_code_step(withr::with_dir("mlr3", tinytex::latexmk("mlr3cheatsheet.tex"))) %>%
  add_code_step(fs::file_move("mlr3/mlr3cheatsheet.pdf", "docs/mlr3.pdf")) %>%
  # mlr3pipelines
  add_code_step(withr::with_dir("mlr3pipelines", tinytex::latexmk("mlr3pipelinescheatsheet.tex"))) %>%
  add_code_step(fs::file_move("mlr3pipelines/mlr3pipelinescheatsheet.pdf", "docs/mlr3pipelines.pdf")) %>%
  # mlr3tuning
  add_code_step(withr::with_dir("mlr3tuning", tinytex::latexmk("mlr3tuningcheatsheet.tex"))) %>%
  add_code_step(fs::file_move("mlr3tuning/mlr3tuningcheatsheet.pdf", "docs/mlr3tuning.pdf")) %>%
  # CNAME
  add_code_step(writeLines("cheatsheets.mlr-org.com", "docs/CNAME"))

if (ci_can_push() && !ci_is_tag()) {
  get_stage("before_deploy") %>%
    add_step(step_setup_ssh()) %>%
    add_step(step_setup_push_deploy(path = "docs", branch = "gh-pages",
      orphan = TRUE))

  # only deploy on master branch
  if (ci_get_branch() == "master") {
    get_stage("deploy") %>%
      add_step(step_do_push_deploy(path = "docs", commit_paths = c(
        "mlr.pdf",
        "mlr3.pdf",
        "mlr3pipelines.pdf",
        "mlr3tuning.pdf",
        "CNAME",
        "README.md"))
      )
  }
}
