# Makefile for thesis

SRC= supportive-narrative.tex sections/*.tex bibliography.bib

all: pdf docx

supportive-narrative.pdf: $(SRC)
	@mkdir -p out
	pdflatex -output-directory=out supportive-narrative.tex
	biber --output-directory=out supportive-narrative
	pdflatex -output-directory=out supportive-narrative.tex
	cp out/supportive-narrative.pdf .

supportive-narrative.docx: $(SRC)
	pandoc supportive-narrative.tex --bibliography=bibliography.bib -o supportive-narrative.docx

pdf: supportive-narrative.pdf

docx: supportive-narrative.docx

clean:
	rm -rf out supportive-narrative.pdf supportive-narrative.docx