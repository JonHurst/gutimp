all: huckfinn.pdf huckfinn.epub huckfinn.mobi

huckfinn.pdf: huckfinn.xhtml styles.css
	make-ebook.sh 6 huckfinn.xhtml
	pdftk huckfinn.pdf stamp ../common/blankstamp6.pdf output huck.marks.pdf
	mv huck.marks.pdf huckfinn.pdf
	ln -sf huckfinn.pdf Huckleberry-Finn.pdf


huckfinn.epub: huckfinn.xhtml styles.css
	sigil huckfinn.xhtml


huckfinn.mobi: huckfinn.epub
	kindlegen -c2 huckfinn.epub
