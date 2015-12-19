\name{plspm.formula}
\alias{plspm.formula}
\title{PLS Path Modeling Based on Formula}

\description{
This fonction estimate PLS Path Models specified using formula. The formulas using for the inner models and the outer models must respect the forms describe in the  details section.
}

\usage{
plspm.formula(Formula,Data,modes=NULL,scaling=NULL,scheme="centroid",
              scaled=TRUE,tol=1e-06,maxiter=100,plscomp=NULL,boot.val=FALSE,
              br=NULL,dataset=TRUE,plot.outer=FALSE,plot.inner=TRUE)
}

\arguments{
\item{Formula }{A string describe the the inner and outer model using formulas. The inner models are describe using "=~" and "~~" for the inner model. (see details and exemple) }
\item{Data }{matrix or data frame containing the manifest variables.}
\item{modes }{character vector indicating the type of measurement for each block. Possible values are: "A", "B", "newA", "PLScore", "PLScow". The length of modes must be equal to the length of blocks.}
\item{scaling }{optional argument for runing the non-metric approach; it is a list of string vectors indicating the type of measurement scale for each manifest variable specified in blocks. scaling must be specified when working with non-metric variables. Possible values: "num" (linear transformation, suitable for numerical variables), "raw" (no transformation), "nom" (non-monotonic transformation, suitable for nominal variables), and "ord" (monotonic transformation, suitable for ordinal variables).}
\item{scheme }{string indicating the type of inner weighting scheme. Possible values are "centroid", "factorial", or "path".}
\item{scaled }{whether manifest variables should be standardized. Only used when scaling = NULL. When (TRUE, data is scaled to standardized values (mean=0 and variance=1). The variance is calculated dividing by N instead of N-1).}
\item{tol }{decimal value indicating the tolerance criterion for the iterations (tol=0.000001). Can be specified between 0 and 0.001.}
\item{maxiter }{integer indicating the maximum number of iterations (maxiter=100 by default). The minimum value of maxiter is 100.}
\item{plscomp }{optional vector indicating the number of PLS components (for each block) to be used when handling non-metric data (only used if scaling is provided)}
\item{boot.val }{whether bootstrap validation should be performed. (FALSE by default).}
\item{br }{number bootstrap resamples. Used only when boot.val=TRUE. When boot.val=TRUE, the default number of re-samples is 100.}
\item{dataset }{whether the data matrix used in the computations should be retrieved (TRUE by default).}
\item{plot.outer }{Boolean specify if yes (plot.outer=TRUE) or not (plot.outer=FALSE) the outer plot may be printed. (FALSE by default).  }
\item{plot.inner }{Boolean specify if yes (plot.inner=TRUE) or not (plot.inner=FALSE) the outer plot may be printed. (TRUE by default).}
}

\details{
The function plspm.formula estimates a path model by partial least squares approach providing the full set of results as the \link[plspm]{plspm} function of the 'plspm' package. The algorithm compute itself the path matrix and the blocks list. To do that, the model must be specify using the two rules below:
\describe{
\item{\code{LatVar1 =~ ManVar1+ManVar2+ManVar3 }}{Description of the relation between the latent variable (LatVar1) and its manifests variables (ManVar1, ManVar2 and ManVar3}
\item{\code{LatVar3 ~~ LatVar1+LatVar2 }}{Description of the relation between the latent variable (LatVar3) and the other latents variables (LatVar1 and ManVar2) linked to that variable}
All the formulars must be in a single string with a newline as separator. Phisical new lines are generally used (see example).
}
}

\value{
The result of the 'plspm.formula' is an objet of class 'plspm'. The return values are the same of the \link[plspm]{plspm} fonction in the 'plspm' package.
}

\references{
Gaston Sanchez, Laura Trinchera and Giorgio Russolillo (2015). plspm: Tools for Partial Least Squares Path Modeling (PLS-PM). R package version 0.4.7. \url{http://CRAN.R-project.org/package=plspm}
}

\author{
ACHIEPO Odilon Yapo M. <kingodilon@gmail.com>
}

\note{
The formula approach of the PLS Path Modeling is need for the developement of the resilometric. Resilometrics is a new discipline under development for computational modeling of the resilience processes.
}

\seealso{
\code{\link[plspm.formula]{plspm.params}}
}

\examples{
## Load data (satisfaction data in plspm package)
data("plspmsat")
## Model specification by formulas 
satmodele <- "
            ## measure model specification
              EXPE =~ expe1+expe2+expe3+expe4+expe5
              IMAG =~ imag1+imag2+imag3+imag4+imag5
              LOY =~ loy1+loy2+loy3+loy4
              SAT =~ sat1+sat2+sat3+sat4
              VAL =~ val1+val2+val3+val4 
              QUAL =~ qual1+qual2+qual3+qual4+qual5 
            ## outer model specification 
              EXPE ~~ IMAG
              LOY ~~ IMAG+SAT
              SAT ~~ IMAG+EXPE+QUAL+VAL
              VAL ~~ EXPE+QUAL
              QUAL ~~ EXPE
          "
## estimation modes of latent's blocks
satmodes <- rep("A",6)
## PLSPM model estimation using formula
satres.plspm <- plspm.formula(Formula = satmodele, Data = plspmsat, 
                           modes = satmodes, plot.outer = TRUE, 
                           plot.inner = TRUE, scaled = FALSE)
}

\keyword{plspm.formula} 
