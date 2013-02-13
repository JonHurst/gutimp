all: frank-a5.pdf frank-6.pdf frank.epub frank.mobi

frank-a5.pdf: frank-a5.tex frank.tex
	pdflatex frank-a5.tex
	pdflatex frank-a5.tex

frank-6.pdf: frank-6.tex frank.tex
	pdflatex frank-6.tex
	pdflatex frank-6.tex
	pdftk frank-6.pdf stamp ../common/blankstamp6.pdf output frank.marks.pdf
	mv frank.marks.pdf frank-6.pdf
	ln -sf frank-6.pdf Frankenstein.pdf
	cleantex

frank.epub: frank.xhtml styles.css
	sigil frank.xhtml

frank.mobi: frank.epub
	kindlegen -c2 frank.epub