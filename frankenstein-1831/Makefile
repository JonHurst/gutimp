all: frankenstein.pdf frankenstein.epub frankenstein.mobi

frankenstein.pdf: frankenstein.xhtml styles.css
	make-ebook.sh 6 frankenstein.xhtml
	pdftk frankenstein.pdf stamp ../common/blankstamp6.pdf output frank.marks.pdf
	mv frank.marks.pdf frankenstein.pdf
	ln -sf frank-6.pdf Frankenstein-1831.pdf


frankenstein.epub: frankenstein.xhtml styles.css
	sigil frankenstein.xhtml


frankenstein.mobi: frankenstein.epub
	kindlegen -c2 frankenstein.epub