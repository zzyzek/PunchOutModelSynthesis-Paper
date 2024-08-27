#!/bin/bash

rm -f *.log *.aux *.abs *.log *.out *.xmpdata *.xmpi
pdflatex POMS.tex
bibtex POMS
pdflatex POMS.tex
pdflatex POMS.tex

#pdflatex POMS.tex
