all: 6 a5

a5: sherlock-a5.pdf

6: sherlock-6.pdf

sherlock-a5.pdf: sherlock-a5.tex sherlock.tex
	pdflatex sherlock-a5.tex
	pdflatex sherlock-a5.tex

sherlock-6.pdf: sherlock-6.tex sherlock.tex
	pdflatex sherlock-6.tex
	pdflatex sherlock-6.tex
	pdftk sherlock-6.pdf stamp blankstamp6.pdf output sherlock.marks.pdf
	mv sherlock.marks.pdf sherlock-6.pdf
	ln -sf sherlock-6.pdf "Adventures of Sherlock Holmes.pdf"

