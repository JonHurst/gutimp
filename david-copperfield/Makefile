all: text pdf zip epub

zip: david-copperfield.zip
pdf: david-copperfield-5.pdf david-copperfield-6.pdf David\ Copperfield.pdf
text: david-copperfield_utf8.txt david-copperfield_lat1.txt
epub: david-copperfield.epub david-copperfield.mobi

david-copperfield-5.pdf: david-copperfield.xhtml styles.css prince-5in.css prince-common.css
	prince -s prince-5in.css david-copperfield.xhtml -o david-copperfield-5.pdf

david-copperfield-6.pdf: david-copperfield.xhtml styles.css prince-6in.css prince-common.css
	prince -s prince-6in.css david-copperfield.xhtml -o david-copperfield-6.pdf

david-copperfield-a5.pdf: david-copperfield.xhtml styles.css prince-a5.css prince-common.css
	prince -s prince-a5.css david-copperfield.xhtml -o david-copperfield-a5.pdf

David\ Copperfield.pdf: david-copperfield-6.pdf
	pdftk david-copperfield-6.pdf stamp ../common/blankstamp6.pdf output David\ Copperfield.pdf

david-copperfield_pg.html: david-copperfield_illostrip.xhtml styles.css
	python3 inline-css.py < david-copperfield_illostrip.xhtml >david-copperfield_pg.html

david-copperfield.zip: david-copperfield_pg.html images/cover.jpg
	rm -f david-copperfield.zip
	zip -r david-copperfield.zip david-copperfield_pg.html images/cover.jpg

david-copperfield_utf8.txt: david-copperfield.txt
	wrap-text.py <david-copperfield.txt >david-copperfield_utf8.txt

david-copperfield_lat1.txt: david-copperfield_utf8.txt
	iconv -f utf8 -t l1//TRANSLIT david-copperfield_utf8.txt >david-copperfield_lat1.txt

david-copperfield_illostrip.xhtml: david-copperfield.xhtml
	xsltproc strip-illustrations.xsl david-copperfield.xhtml > david-copperfield_illostrip.xhtml

david-copperfield.epub: david-copperfield_illostrip.xhtml styles.css images/cover.jpg
	sigil david-copperfield_illostrip.xhtml

david-copperfield.mobi: david-copperfield.epub
	kindlegen -C2 david-copperfield.epub


clean:
	rm -f david-copperfield.zip david-copperfield_pg.html *.pdf
	rm -f david-copperfield_utf8.txt david-copperfield_lat1.txt
	rm -f david-copperfield_illostrip.xhtml david-copperfield.mobi
