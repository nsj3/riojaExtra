.onAttach <- function(lib, pkg)  {
    packageStartupMessage("This is riojaExtra ",
    utils::packageDescription("riojaExtra", fields="Version"), appendLF = TRUE)
}

.onUnload <- function(libpath)
    library.dynam.unload("riojaExtra", libpath)


