svgs := $(patsubst img/svg/%.svg,tmp/svg/%.pdf,$(wildcard img/svg/*.svg))
python := $(patsubst img/python/%.py,tmp/python/%.pdf,$(wildcard img/python/*.py))
dots := $(patsubst img/dot/%.dot,tmp/dot/%.pdf,$(wildcard img/dot/*.dot))

thesis.pdf: thesis.tex
	latexmk -pdflatex thesis.tex

thesis.tex: src/*.md template.tex thesis.yaml img/**/*.* $(svgs) $(python) $(dots) bibliography.bib
	pandoc \
		-d defaults.yaml \
		src/chapter_*.md \
		| \
	sed -r \
		-e 's/ \\autocite/~\\autocite/g' \
		-e 's/i\.e\.(\s)/i.e.\\\1/g' \
		-e 's/\. /.\n/g' \
		> thesis.tex

tmp/svg/%.pdf: img/svg/%.svg
	inkscape -C --export-latex -o $@ $<

tmp/dot/%.pdf: img/dot/%.dot | tmp/dot
	dot -Tpdf $< > $@

tmp/python/%.pdf: img/python/%.py | tmp/python
	python3 $< | inkscape --pipe -C --export-latex -o $@

tmp/dot:
	@mkdir -p tmp/dot

tmp/python:
	@mkdir -p tmp/python

.PHONY: clean distclean upload open
clean:
	latexmk -C -quiet thesis.tex
	rm -rf thesis.tex

distclean: clean
	rm -rf tmp/ "$(shell biber --cache)"
