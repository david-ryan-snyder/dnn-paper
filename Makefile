LATEX=pdflatex
LATEXMK=latexmk
LATEXOPT=-file-line-error


MAIN=ASRU_SUP_UBM
SOURCES=$(MAIN).tex Makefile bib/strings.bib bib/refs.bib
FIGURES := $(shell ls fig/*.pdf)

all:    $(MAIN).pdf

.refresh:
	touch .refresh

$(MAIN).pdf: $(MAIN).tex .refresh $(SOURCES) $(FIGURES)
	$(LATEXMK) -pdf $(MAIN).tex

force:
	touch .refresh
	$(MAKE) $(MAIN).pdf

open:
	open $(MAIN).pdf

.PHONY: clean force all

clean:
	$(LATEXMK) -C $(MAIN).tex
	rm -f $(MAIN).pdfsync
	rm -rf *~ *.tmp
	rm -rf *.bbl
