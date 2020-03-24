get_stage("deploy") %>%
  add_code_step(tinytex::latexmk("mlr3/mlr3cheatsheet.tex")) %>%
  add_code_step(writeLines("cheatsheets.mlr-org.com", "docs/CNAME"))

if (ci_can_push() && !ci_is_tag()) {
  get_stage("before_deploy") %>%
    add_step(step_setup_ssh())

  if (ci_get_branch() == "master") {
    get_stage("deploy") %>%
      add_step(step_setup_push_deploy(path = ".", branch = "gh-pages",
        orphan = TRUE)) %>%
      add_step(step_do_push_deploy(commit_paths = "mlr3/mlr3cheatsheet.pdf"))
  }
}
