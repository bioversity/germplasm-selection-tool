#------------------------------------------------------------------------------------------------------------------
#APPLICATION BIOVERSITY                                                                                           #
#AUTHOR: JOHANN OSPINA FOR BIOVERSITY, REVISIONS BY RICHARD BRUSKIEWICH @ CROPINFORMATICS.COM                     #
#VERSION 2.0 - AUGUST-04-2014 
#
# Initialize Explora Environment
#------------------------------------------------------------------------------------------------------------------ 

require(gWidgets) 

## Clean work spaces
rm(list=ls())

## select tools for GUI
options("guiToolkit"="RGtk2")

## Change locale for message in english
Sys.setlocale(category = "LC_ALL", locale = "English")
Sys.setenv(LANG = "en")

# Where am I?
nframe <- sys.nframe()
#print(paste("nframe:",nframe))
if(nframe>0) {
	script_dir <- dirname(c(sys.frame(nframe)$ofile,""))
} else {
	script_dir <- getwd()
}

#print(c("Script Directory: ",script_dir))

image_dir <- paste(script_dir,"../inst/image")
print(c("Image Directory: ",image_dir))

# Global class for application variables

setClass( "ExploraAnalysis", 
          representation(
            dataset_selection = "gCombobox",    # formerly nom_data
            numContVar        = "guiComponent", # formerly ncon
            percentSoln       = "guiComponent", # formerly npercen
            numberSoln        = "guiComponent"  # formerly Nsim
          )
        )

setGeneric("dataset_selection", function(x) standardGeneric("dataset_selection"))
setGeneric("numContVar",        function(x) standardGeneric("numContVar"))
setGeneric("percentSoln",       function(x) standardGeneric("percentSoln"))
setGeneric("numberSoln",        function(x) standardGeneric("numberSoln"))

setMethod("dataset_selection","ExploraAnalysis",function(x) x@dataset_selection )
setMethod("numContVar",       "ExploraAnalysis",function(x) x@numContVar )
setMethod("percentSoln",      "ExploraAnalysis",function(x) x@percentSoln )
setMethod("numberSoln",       "ExploraAnalysis",function(x) x@numberSoln )

setGeneric("dataset_selection<-", function(x,value) standardGeneric("dataset_selection<-"))
setGeneric("numContVar<-",        function(x,value) standardGeneric("numContVar<-"))
setGeneric("percentSoln<-",       function(x,value) standardGeneric("percentSoln<-"))
setGeneric("numberSoln<-",        function(x,value) standardGeneric("numberSoln<-"))

setReplaceMethod(
  "dataset_selection",
  "ExploraAnalysis", 
  function(x,value) { 
    x@dataset_selection <- value
    return(x)
  }
)

setReplaceMethod(
  "numContVar",
  "ExploraAnalysis",
  function(x,value) { 
    x@numContVar <- value
    return(x)
  }
)

setReplaceMethod(
  "percentSoln",
  "ExploraAnalysis",
  function(x,value) { 
    x@percentSoln <- value
    return(x)
  }
)

setReplaceMethod(
  "numberSoln",
  "ExploraAnalysis",
  function(x,value) { 
    x@numberSoln <- value
    return(x)
  }
)

analysis = new("ExploraAnalysis")