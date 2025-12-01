#!/usr/bin/Rscript

# Ensure pak is installed
if (!requireNamespace("pak", quietly = TRUE)) {
  install.packages("pak")
}

# Read package list
pak::pak_update()
pkg_file <- path.expand("~/pkgListR.txt")
pkgs <- readLines(pkg_file)
pkgs <- trimws(pkgs)
pkgs <- pkgs[pkgs != ""]        # remove empty lines

failed <- character()

res <- pak::pkg_install(pkgs)

cat("\n=========================================\n")
cat("All packages installed successfully!\n")
cat("=========================================\n")

