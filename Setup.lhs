#!/usr/bin/env runhaskell
\begin{code}
import System.Cmd
import Distribution.Simple

main = defaultMainWithHooks $ simpleUserHooks
    { buildHook = myBuild (buildHook simpleUserHooks) }

myBuild doBuild x y z w = do
    rv <- doBuild x y z w
    system "make -f Makefile.pdfdump"
    return rv

\end{code}
