# mlr3 Cheatsheet Code Audit

Generated: 2026-03-18 09:58:37 CET
Source file: `mlr3/mlr3.Rmd`

## Summary

- Total R chunks: 53
- Chunks executed by render (`eval != FALSE`): 30
- Executed chunks that ran successfully: 30/30
- Documentation chunks (`eval = FALSE`): 23
- `eval = FALSE` chunks parse successfully: 22/23
- `eval = FALSE` chunks run unchanged in context: 2/23
- cheatdown installed locally: no (workflow-equivalent print_pdf cannot run here without installing it)

## Per-Chunk Results

| chunk | line | eval_false | status | first_line | message |
|---:|---:|:---:|:---|:---|:---|
| 1 | 12 | no | run_ok | `library(mlr3)` |  |
| 2 | 36 | yes | run_fail | `Dictionary$keys(pattern = NULL)` | object 'Dictionary' not found |
| 3 | 43 | yes | run_fail | `Dictionary$get(key, ...)` | object 'Dictionary' not found |
| 4 | 49 | yes | run_fail | `Dictionary$mget(keys, ...)` | object 'Dictionary' not found |
| 5 | 55 | yes | run_fail | `as.data.table(Dictionary)` | object 'Dictionary' not found |
| 6 | 66 | yes | run_fail | `task = as_task_regr(backend, target)` | object 'backend' not found |
| 7 | 72 | yes | run_fail | `task = tsk(.key)` | object '.key' not found |
| 8 | 84 | yes | run_fail | `task$positive = "<positive_class>"` | Assertion on 'rhs' failed: Must be element of set {'M','R'}, but is '<positive_class>'. |
| 9 | 107 | yes | run_fail | `task$select(cols)` | object 'cols' not found |
| 10 | 113 | yes | run_fail | `task$filter(rows)` | object 'rows' not found |
| 11 | 119 | yes | run_fail | `task$cbind(data) / task$rbind(data)` | Assertion on 'data' failed: Must inherit from class 'DataBackend', but has class 'function'. |
| 12 | 125 | yes | run_fail | `task$rename(from, to)` | object 'from' not found |
| 13 | 135 | yes | run_fail | `learner = lrn(.key, ...)` | '...' used in an incorrect context |
| 14 | 144 | yes | run_ok | `learner$param_set` |  |
| 15 | 150 | yes | run_fail | `learner$param_set$values = list(id = value)` | Assertion on 'xs' failed: Parameter 'id' not available. Did you mean 'cp' / 'keep_model' / 'maxcompete'?. |
| 16 | 157 | yes | parse_fail | `learner$param_set$values$<id> = <value>` | <text>:1:26: unexpected '<' \| 1: learner$param_set$values$< \|                              ^ |
| 17 | 163 | yes | run_fail | `learner$predict_type = "<type>"` | object 'type' not found |
| 18 | 170 | no | run_ok | `task = tsk("sonar")` |  |
| 19 | 187 | no | run_ok | `row_ids = 1:50` |  |
| 20 | 191 | no | run_ok | `learner$train(task, row_ids)` |  |
| 21 | 197 | no | run_ok | `learner$model` |  |
| 22 | 203 | no | run_ok | `prediction = learner$predict(task, row_ids)` |  |
| 23 | 211 | yes | run_fail | `measure = msr(.key)` | object '.key' not found |
| 24 | 223 | no | run_ok | `measures = msrs(c("classif.ce", "classif.acc"))` |  |
| 25 | 227 | no | run_ok | `prediction$score(measures)` |  |
| 26 | 246 | no | run_ok | `resampling = rsmp("custom")` |  |
| 27 | 253 | no | run_ok | `resampling = rsmp("cv")` |  |
| 28 | 257 | no | run_ok | `resampling$param_set` |  |
| 29 | 263 | no | run_ok | `resampling$param_set$values = list(folds = 10)` |  |
| 30 | 269 | yes | run_fail | `task$col_roles$stratum = "<column_names>"` | Assertion on 'elements of col_roles' failed: Must be a subset of {'Class','V1','V10','V11','V12','V13','V14','V15','V16','V17','V18','V19','V2','V20','V21','V22','V23','V24','V25','V26','V27','V28','V29','V3','V30','V31','V32','V33','V34','V35','V36','V37','V38','V39','V4','V40','V41','V42','V43','V44','V45','V46','V47','V48','V49','V5','V50','V51','V52','V53','V54','V55','V56','V57','V58','V59','V6','V60','V7','V8','V9'}, but has additional elements {'<column_names>'}. |
| 31 | 275 | yes | run_fail | `task$col_roles$group = "<column_name>"` | Assertion on 'elements of col_roles' failed: Must be a subset of {'Class','V1','V10','V11','V12','V13','V14','V15','V16','V17','V18','V19','V2','V20','V21','V22','V23','V24','V25','V26','V27','V28','V29','V3','V30','V31','V32','V33','V34','V35','V36','V37','V38','V39','V4','V40','V41','V42','V43','V44','V45','V46','V47','V48','V49','V5','V50','V51','V52','V53','V54','V55','V56','V57','V58','V59','V6','V60','V7','V8','V9'}, but has additional elements {'<column_name>'}. |
| 32 | 281 | no | run_ok | `resampling$instantiate(task)` |  |
| 33 | 291 | no | run_ok | `rr = resample(task, learner, resampling)` |  |
| 34 | 296 | no | run_ok | `rr$score(measures)` |  |
| 35 | 301 | no | run_ok | `rr$aggregate(measures)` |  |
| 36 | 306 | no | run_ok | `iters = 1` |  |
| 37 | 310 | no | run_ok | `rr$filter(iters)` |  |
| 38 | 315 | yes | run_ok | `library(mlr3learners)` |  |
| 39 | 355 | no | run_ok | `tasks = tsk("pima")` |  |
| 40 | 361 | no | run_ok | `design = benchmark_grid(` |  |
| 41 | 367 | no | run_ok | `bmr = benchmark(design)` |  |
| 42 | 372 | no | run_ok | `bmr$aggregate(measures)` |  |
| 43 | 377 | no | run_ok | `bmr$score(measures)` |  |
| 44 | 382 | no | run_ok | `task_ids = "pima"` |  |
| 45 | 388 | no | run_ok | `bmr$filter(` |  |
| 46 | 396 | no | run_ok | `bmr1 = bmr` |  |
| 47 | 400 | no | run_ok | `bmr$combine(bmr1)` |  |
| 48 | 410 | yes | run_fail | `future::plan(backend)` | object 'backend' not found |
| 49 | 421 | no | run_ok | `getOption("lgr.log_levels")` |  |
| 50 | 428 | yes | run_fail | `lgr::get_logger("mlr3")$set_threshold("<level>")` | 'level' must either the numeric or character representation of one of the following log levels: fatal (100), error (200), warn (300), info (400), debug (500), trace (600), all (NA), off (0) |
| 51 | 451 | no | run_ok | `learner$encapsulate("evaluate", fallback = lrn("classif.featureless"))` |  |
| 52 | 455 | no | run_ok | `learner$errors` |  |
| 53 | 460 | yes | run_fail | `learner$encapsulate("evaluate", fallback = lrn(.key))` | object '.key' not found |

## Notes

- `eval = FALSE` snippets are mostly template examples; many are intentionally not directly executable until placeholders are replaced.
- This report tests chunks in one R session where executable chunks are run first, then `eval = FALSE` chunks are tested literally.
