% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/local.R
\name{local_create_lockfile}
\alias{local_create_lockfile}
\title{Create a lock file for the dependencies of a package tree}
\usage{
local_create_lockfile(
  root = ".",
  lockfile = "pkg.lock",
  lib = .libPaths()[1],
  upgrade = TRUE,
  dependencies = TRUE
)
}
\arguments{
\item{root}{Path to the package tree.}

\item{lockfile}{Path to the lock file.}

\item{lib}{Library to base the lock file on. In most cases (e.g. on a
CI system, or at deployment), this is an empty library. Supply
\code{tempfile()} to make sure the lock file is based on an empty library.}

\item{upgrade}{When \code{FALSE}, the default, does the minimum amount of work
to give you the latest version of \code{pkg}. It will only upgrade packages if
\code{pkg} or one of its explicitly requires a higher version than what you
currently have.

When \code{upgrade = TRUE}, will do ensure that you have the latest version of
\code{pkg} and all its dependencies.}

\item{dependencies}{Dependency types. See
\code{\link[pkgdepends:as_pkg_dependencies]{pkgdepends::as_pkg_dependencies()}} for possible values. Note that
changing this argument from the default might result an installation
failure, e.g. if you set it to \code{FALSE}, packages might not build if
their dependencies are not already installed.}
}
\description{
The lock file can be used later, possibly in a new R session, to carry
out the installation of the dependencies, with
\code{\link[=local_install_lockfile]{local_install_lockfile()}}.
}
\details{
Note, since the URLs of CRAN and most CRAN-like repositories change
over time, in practice you cannot use the lock file \emph{much} later.
For example, binary packages of older package version
might be deleted from the repository, breaking the URLs in the
lock file.

Currently the intended use case of lock files in on CI systems, to
facilitate caching. The (hash of the) lock file provides a good key
for caching systems.
}
\seealso{
Other lock files: 
\code{\link{local_install_lockfile}()}
}
\concept{lock files}
