#!/bin/bash

rm -f *.log *.aux *.abs *.log *.out *.xmpdata *.xmpi *.bbl *.blg
pdflatex POMS.tex
bibtex POMS
pdflatex POMS.tex
pdflatex POMS.tex

#pdflatex POMS.tex
