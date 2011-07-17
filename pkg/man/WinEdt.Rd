\name{RWinEdt - Internals}
\alias{getWinEdt}
\alias{installWinEdt}
\alias{startWinEdt}
\title{Internal functions of the package RWinEdt}
\description{
These internal functions are not intended to be called by the user.
Instead, a simple click into the menu is sufficient.
}
\usage{
getWinEdt()
installWinEdt(InstallRoot, ApplData, WinEdtVersion, force = FALSE)
startWinEdt(InstallRoot, ApplData, WinEdtVersion, args = NULL)
}
\arguments{
  \item{InstallRoot}{The path where WinEdt is installed.}
  \item{ApplData}{The path to the user's Application Data directory of WinEdt.}
  \item{WinEdtVersion}{WinEdt versions < 6 and >= 6 have to be handled very differently.}  
  \item{force}{If \code{FALSE} (default), no files of an already installed version of R-WinEdt are overwritten;
 if \code{TRUE} those files will be overwritten; if \code{NULL}, the user will be asked.}
  \item{args}{Command line arguments to be passed to the WinEdt instance.}
}
\author{
  Uwe Ligges \email{Uwe.Ligges@R-project.org}; \url{http://www.statistik.tu-dortmund.de/~ligges}.
}
\references{
 Ligges, U. (2003): R-WinEdt. 
 In: Hornik, K., Leisch, F. and Zeileis, A. (eds.),
 Proceedings of the 3rd International Workshop on
 Distributed Statistical Computing (DSC 2003), 
 March 20-22, TU Wien, Vienna, Austria. ISSN 1609-395X,
 \url{http://www.ci.tuwien.ac.at/Conferences/DSC-2003/Proceedings/}.
}
\keyword{misc}
