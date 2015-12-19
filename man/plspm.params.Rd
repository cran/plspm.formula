\name{plspm.params}
\alias{plspm.param}
\alias{plspm.params}
\title{Formula Based PLS Path Modeling Parameters Calculus}

\description{
This fonction compute the inner matrix and the outer list need for specify the PLS Path Models in the package 'plspm' (function 'plspm'). The parameters are compute using a formula specification of the PLSPM model.
}

\usage{
plspm.params(Formula,Data)
}

\arguments{
\item{Formula }{A string describe the the inner and outer model using formulas. The inner models are describe using "=~" and "~~" for the inner model. (see details)}
\item{Data }{matrix or data frame containing the manifest variables.}
}

\details{
The function 'plspm.formula' estimates a path model by partial least squares approach providing the full set of results as the \link[plspm]{plspm} function of the 'plspm' package. The algorithm compute itself the path matrix and the blocks list. To do that, the model must be specify using the two rules below :
\describe{
\item{\code{LatVar1 =~ ManVar1+ManVar2+ManVar3 }}{Description of the relation between the latent variable (LatVar1) and its manifests variables (ManVar1, ManVar2 and ManVar3}
\item{\code{LatVar3 ~~ LatVar1+LatVar2 }}{Description of the relation between the latent variable (LatVar3) and the other latents variables (LatVar1 and ManVar2) linked to that variable}
All the formulars must be in a single string with a newline as separator. Phisical new lines are generally used (see example).
}
}

\value{
A list containing two objects : 
\item{\code{inner.mat }}{inner matrix specify the structural relations between latents variables}
\item{\code{outer.list }}{outer list specify the indexes of the manifests variables in the dataset for each latent variable}
}

\author{
ACHIEPO Odilon Yapo M. <kingodilon@gmail.com>
}

\examples{
# Load data (satisfaction data in plspm package)
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
## computer the PLSPM parameters
sat.param <- plspm.params(Formula = satmodele, Data = plspmsat)
sat.param$inner.mat  ## inner matrix
sat.param$outer.list  ##  outer list
}

\keyword{plspm}

