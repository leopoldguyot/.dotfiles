#!/usr/bin/Rscript

args <- commandArgs(trailingOnly = TRUE)

if (any(args %in% c("-h", "--help"))) {
  cat("Usage: installPkgsR.R [package_list_file]\n")
  cat("Default package list file: ~/pkgListR.txt\n")
  quit(save = "no", status = 0)
}

if (length(args) > 1) {
  cat("Usage: installPkgsR.R [package_list_file]\n", file = stderr())
  quit(save = "no", status = 1)
}

# Ensure pak is installed
if (!requireNamespace("pak", quietly = TRUE)) {
  install.packages("pak")
}

# Read package list
pak::pak_update()
pkg_file <- if (length(args) == 1) path.expand(args[[1]]) else path.expand("~/pkgListR.txt")
pkgs <- readLines(pkg_file)
pkgs <- trimws(pkgs)
pkgs <- pkgs[pkgs != ""]        # remove empty lines

failed <- character()

res <- pak::pkg_install(pkgs)

cat("\n=========================================\n")
cat("All packages installed successfully!\n")
cat("=========================================\n")
