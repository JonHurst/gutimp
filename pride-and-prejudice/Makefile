all: pandp.pdf pandp.epub pandp.mobi

pandp.pdf: pandp.xhtml styles.css
	make-ebook.sh 6 pandp.xhtml
	pdftk pandp.pdf stamp ../common/blankstamp6.pdf output marks.pdf
	mv marks.pdf pandp.pdf
	ln -sf pandp.pdf "Pride and Prejudice.pdf"


pandp.epub: pandp.xhtml styles.css
	sigil pandp.xhtml


pandp.mobi: pandp.epub
	kindlegen -c2 pandp.epub
