all: sherlock-a5.pdf sherlock-6.pdf sherlock.epub sherlock.mobi

sherlock-a5.pdf: sherlock-a5.tex sherlock.tex
	pdflatex sherlock-a5.tex
	pdflatex sherlock-a5.tex

sherlock-6.pdf: sherlock-6.tex sherlock.tex
	pdflatex sherlock-6.tex
	pdflatex sherlock-6.tex
	pdftk sherlock-6.pdf stamp ../common/blankstamp6.pdf output sherlock.marks.pdf
	mv sherlock.marks.pdf sherlock-6.pdf
	ln -sf sherlock-6.pdf "The Adventures of Sherlock Holmes.pdf"
	cleantex

sherlock.epub: sherlock.html styles.css
	sigil sherlock.xhtml

sherlock.mobi: sherlock.epub
	kindlegen -c2 sherlock.epub