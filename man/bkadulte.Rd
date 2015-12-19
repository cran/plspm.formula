\name{bkadulte}
\alias{bkadulte}
\docType{data}
\title{Adult Resilience Dataset From Bouake (Ivory Coast)}

\description{
This data set contains the variables from a resilience study of 117 adult people in the town of Bouake (Ivory Coast). A data frame with 117 observations on the following 22 variables.
}

\usage{
data("bkadulte")
}

\details{
In the context of the resilometric, the variables are all manifests variables and can be classify into five groups (five resilience dimensions):
\describe{
\item{\code{SDH }}{sens of humor (senshum, creativite)}
\item{\code{APS }}{pro-social attitude (communic, sociabilite, altruiste)}
\item{\code{HRP }}{hability to solving problems (planific, solution, autonome)}
\item{\code{SCI }}{sentiment of internal control (estime, confiance, favenir)}
\item{\code{SPI }}{spirituality (optimisme, persever, religion)}
}
}

\source{
UMI Resilience (CIRES-IRD), observatory of resilience in Bouake (Ivory Coast) 
}

\references{
COULIBALY Kpinna Tiekoura, Odilon Yapo M. ACHIEPO, Brou Konan Marcellin, Michel Babri. (2015). Resilometrical modeling of interactions in social resilience dimensions. International Journal of Computer Science Issues (IJCS ), Volume 12, Issue 4, July 2015. \url{http://www.ijcsi.org/papers/IJCSI-12-4-149-155.pdf}
}

\examples{
## Load data
data(bkadulte)
str(bkadulte) 
bkmodele <- "
             ## modele de mesure 
              SDH =~ senshum+creativite 
              APS =~ communic+sociabilite+altruiste+relation
              HRP =~ planific+solution+autonome
              SCI =~ estime+confiance+favenir
              SPI =~ optimisme+persever+religion 
            ## interactions 
              HRP ~~ SDH+SCI
              SCI ~~ SDH
              APS ~~ SDH
              SPI ~~ APS+SCI
          "
## PLSPM estimation based on formula
bkmodes <- rep("A",5)  
bkres.plspm <- plspm.formula(Formula = bkmodele, Data = bkadulte, modes = bkmodes, 
                        plot.outer = TRUE, plot.inner = TRUE, scaled = FALSE)
## Computation plspm parameters only based on formula
bkres.param <- plspm.params(Formula = bkmodele, Data = bkadulte)
bkres.param$inner.mat
bkres.param$outer.list
}

\keyword{datasets}

