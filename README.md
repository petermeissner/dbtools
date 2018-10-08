
## Tooling Around Database Querying

## Status

*lines of R code:* 164, *lines of test code:* 0

[![Project Status:
WIP.](https://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
<a href="https://travis-ci.org/petermeissner/dbtools">
<img src="https://api.travis-ci.org/petermeissner/dbtools.svg?branch=master">
<a/> <a href="https://cran.r-project.org/package=dbtools">
<img src="http://www.r-pkg.org/badges/version/dbtools"> </a> [![cran
checks](https://cranchecks.info/badges/summary/reshape)](https://cran.r-project.org/web/checks/check_results_reshape.html)
<a href="https://codecov.io/gh/petermeissner/dbtools">
<img src="https://codecov.io/gh/petermeissner/dbtools/branch/master/graph/badge.svg" alt="Codecov" />
</a> <img src="http://cranlogs.r-pkg.org/badges/grand-total/dbtools">
<img src="http://cranlogs.r-pkg.org/badges/dbtools">

## Development version

**0.1.0 - 2018-10-08 / 19:17:08**

## Description

Provides tooling around database querying and using DBI compliant
packages. The aim of the package is to make data base interaction and
SQL code generation more convenient and robust. Thus the package aims to
provide wrappers and helpers that enhance already existing tools from
packages like DBI and glue and to bundle some database interaction
utility functions in one place.

## License

MIT + file LICENSE <br>Peter Meissner \[aut, cre\]

## Citation

``` r
citation("dbtools")
```

``` r
toBibtex(citation("dbtools"))
```

## Contribution - AKA The-Think-Twice-Be-Nice-Rule

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms:

> As contributors and maintainers of this project, we pledge to respect
> all people who contribute through reporting issues, posting feature
> requests, updating documentation, submitting pull requests or patches,
> and other activities.
> 
> We are committed to making participation in this project a
> harassment-free experience for everyone, regardless of level of
> experience, gender, gender identity and expression, sexual
> orientation, disability, personal appearance, body size, race,
> ethnicity, age, or religion.
> 
> Examples of unacceptable behavior by participants include the use of
> sexual language or imagery, derogatory comments or personal attacks,
> trolling, public or private harassment, insults, or other
> unprofessional conduct.
> 
> Project maintainers have the right and responsibility to remove, edit,
> or reject comments, commits, code, wiki edits, issues, and other
> contributions that are not aligned to this Code of Conduct. Project
> maintainers who do not follow the Code of Conduct may be removed from
> the project team.
> 
> Instances of abusive, harassing, or otherwise unacceptable behavior
> may be reported by opening an issue or contacting one or more of the
> project maintainers.
> 
> This Code of Conduct is adapted from the Contributor Covenant
> (<http://contributor-covenant.org>), version 1.0.0, available at
> <http://contributor-covenant.org/version/1/0/0/>

## Package Content

``` r
library(dbtools)
cat(ls(as.environment("package:dbtools")), sep = "\n")
## %>%
## sqlValues
## wpd_get_queries
## wpd_get_query
## wpd_sql
```
