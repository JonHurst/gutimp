all: pandp-a5.pdf pandp-6.pdf pandp.epub pandp.mobi

pandp-a5.pdf: pandp.tex pandp-a5.tex
	pdflatex pandp-a5.tex
	pdflatex pandp-a5.tex

pandp-6.pdf: pandp.tex pandp-6.tex
	pdflatex pandp-6.tex
	pdflatex pandp-6.tex
	ln -sf pandp-6.pdf "Pride and Prejudice.pdf"

pandp.epub: pandp.xhtml styles.css
	sigil pandp.xhtml


pandp.mobi: pandp.epub
	kindlegen -c2 pandp.epub
