all: text pdf zip epub

zip: david-copperfield.zip
pdf: david-copperfield-5.pdf david-copperfield-6.pdf \
	david-copperfield-a5.pdf David\ Copperfield.pdf
text: david-copperfield_utf8.txt david-copperfield_lat1.txt
epub: david-copperfield.epub david-copperfield.mobi

david-copperfield-5.pdf: david-copperfield.xhtml styles.css prince-5in.css prince-common.css
	prince -s prince-5in.css david-copperfield.xhtml -o david-copperfield-5.pdf

david-copperfield-6.pdf: david-copperfield.xhtml styles.css prince-6in.css prince-common.css
	prince -s prince-6in.css david-copperfield.xhtml -o david-copperfield-6.pdf

david-copperfield-a5.pdf: david-copperfield.xhtml styles.css prince-a5.css prince-common.css
	prince -s prince-a5.css david-copperfield.xhtml -o david-copperfield-a5.pdf

David\ Copperfield.pdf: david-copperfield-6.pdf
	ln -sf david-copperfield-6.pdf David\ Copperfield.pdf

david-copperfield_pg.html: david-copperfield.xhtml styles.css add-tn.xsl inline-css.py dp_mods.patch
	xsltproc --nodtdattr add-tn.xsl david-copperfield.xhtml | \
	python3 inline-css.py  | \
   sed 's/<title>[^>]*>/<title>The Project Gutenberg eBook of David Copperfield, by Charles Dickens<\/title>/' >david-copperfield_pg.html
	patch -b david-copperfield_pg.html dp_mods.patch

david-copperfield.zip: david-copperfield_utf8.txt david-copperfield_lat1.txt david-copperfield_pg.html images/*
	bash build_zip.sh

david-copperfield_utf8.txt: david-copperfield.txt
	wrap-text.py <david-copperfield.txt >david-copperfield_utf8.txt

david-copperfield_lat1.txt: david-copperfield_utf8.txt
	sed "s/〞/\" /g" david-copperfield_utf8.txt | iconv -f utf8 -t l1//TRANSLIT >david-copperfield_lat1.txt

david-copperfield_noillos.xhtml: david-copperfield.xhtml
	xsltproc --nodtdattr strip-illustrations.xsl david-copperfield.xhtml > david-copperfield_noillos.xhtml

david-copperfield.epub: david-copperfield.xhtml styles.css images/*
	sigil david-copperfield.xhtml

david-copperfield.mobi: david-copperfield.epub
	kindlegen -C2 david-copperfield.epub


clean:
	rm -f david-copperfield.zip david-copperfield_pg.html *.pdf
	rm -f david-copperfield_utf8.txt david-copperfield_lat1.txt
	rm -f david-copperfield_noillos.xhtml david-copperfield.mobi
