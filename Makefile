main.pdf: main.dvi
	dvipdfmx -p a4 -f font.map main.dvi

main.dvi: *.tex
	sed -i -e 's/。/. /g' -e 's/、/, /g' *.tex
	platex main.tex
	pbibtex main.aux
	#mendex main
	platex main.tex
	platex main.tex
	platex main.tex

clean:
	rm -f *.aux *.pdf *.log *.dvi *.bbl *.blg *.ilg *.idx *.toc *.ind tmp.*
