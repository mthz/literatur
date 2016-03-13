all: arra-ros-basics.tex
	pdflatex arra-ros-basics.tex --quiet -interaction=batchmode
	bibtex arra-ros-basics
	pdflatex arra-ros-basics.tex --quiet -interaction=batchmode
	pdflatex arra-ros-basics.tex --quiet -interaction=batchmode
	
clean:
	rm -f *.log *.toc *.aux *.nav *.out *.snm *.bbl *.blg *.synctex.gz
	
cleanall:
	rm -f *.log *.toc *.aux *.nav *.out *.snm *.bbl *.blg *.synctex.gz arra-ros-basics.pdf
