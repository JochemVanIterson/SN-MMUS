# Makefile for thesis

SRC= supportive-narrative.tex supportive-narrative_simple.tex sections/*.tex bibliography.bib assets/*

all: pdf docx count

supportive-narrative.pdf: $(SRC)
	@mkdir -p out
	# pdflatex -output-directory=out supportive-narrative.tex
	# biber --output-directory=out supportive-narrative
	# pdflatex -output-directory=out supportive-narrative.tex
	latexmk
	cp out/supportive-narrative.pdf .

supportive-narrative.docx: $(SRC)
	pandoc supportive-narrative_simple.tex --bibliography=bibliography.bib -o supportive-narrative.docx

pdf: supportive-narrative.pdf

docx: supportive-narrative.docx

clean:
	rm -rf out supportive-narrative.pdf supportive-narrative.docx

count:
	@echo "Word count: "
	@texcount -merge -sum supportive-narrative.tex
