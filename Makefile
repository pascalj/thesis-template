svgs := $(patsubst img/svg/%.svg,tmp/svg/%.pdf,$(wildcard img/svg/*.svg))
python := $(patsubst img/python/%.py,tmp/python/%.pdf,$(wildcard img/python/*.py))
dots := $(patsubst img/dot/%.dot,tmp/dot/%.tex,$(wildcard img/dot/*.dot))
Rs := $(patsubst img/R/%.R,tmp/R/%.tex,$(wildcard img/R/*.R))

thesis.pdf: thesis.tex
	latexmk -pdflatex thesis.tex

thesis.tex: src/*.md template.tex thesis.yaml img/**/*.* $(svgs) $(python) $(dots) $(Rs) bibliography.bib
	pandoc \
		-d defaults.yaml \
		src/chapter_*.md \
		| \
	sed -r \
		-e 's/ \\autocite/~\\autocite/g' \
		-e 's/\. /.\n/g' \
		> thesis.tex

tmp/svg/%.pdf: img/svg/%.svg
	inkscape -C --export-latex -o $@ $<

tmp/dot/%.tex: img/dot/%.dot | tmp/dot
	dot2tex --figonly $< > $@

tmp/python/%.pdf: img/python/%.py | tmp/python
	python3 $< > $@

tmp/R/%.tex: img/R/%.R | tmp/R
	Rscript $< > $@

tmp/dot:
	@mkdir -p tmp/dot

tmp/python:
	@mkdir -p tmp/python

tmp/R:
	@mkdir -p tmp/R

.PHONY: clean distclean upload open
clean:
	latexmk -C -quiet thesis.tex
	rm -rf thesis.tex

distclean: clean
	rm -rf tmp/ "$(shell biber --cache)"
