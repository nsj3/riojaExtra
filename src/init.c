#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>


/* .C calls */

/* .Call calls */
extern SEXP ReadCornellFile(SEXP , SEXP , SEXP );
extern SEXP WriteCornellFile(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP ReadTiliaFile(SEXP fN);

static const R_CMethodDef CEntries[] = {
    {NULL, NULL, 0}
};

static const R_CallMethodDef CallEntries[] = {
    {"ReadCornellFile",        (DL_FUNC) &ReadCornellFile,        3},
    {"WriteCornellFile",     (DL_FUNC) &WriteCornellFile,     9},
    {"ReadTiliaFile",     (DL_FUNC) &ReadTiliaFile,     1},
    {NULL, NULL, 0}
};

void R_init_rioja(DllInfo *dll)
{
    R_registerRoutines(dll, CEntries, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
