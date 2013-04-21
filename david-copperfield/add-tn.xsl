<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:exsl="http://exslt.org/common"
      xmlns:j="http://hursts.eclipse.co.uk"
		xmlns:xhtml="http://www.w3.org/1999/xhtml"
		xmlns="http://www.w3.org/1999/xhtml"
      exclude-result-prefixes="j exsl xsl xhtml">

<xsl:output method="xml"
	    doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
	    doctype-public="-//W3C//DTD XHTML 1.1//EN"
	    version="1.0" encoding="utf-8"/>

<xsl:variable name="note_lookup">
  <xsl:for-each select="document('../../dig/david-copperfield/rtt.xml')/book/pages/page">
    <xsl:variable name="pid" select="@id"/>
    <xsl:for-each select="notes/note">
      <j:entry>
        <xsl:attribute name="ref">
          <xsl:text>p</xsl:text><xsl:value-of select="$pid"/>
          <xsl:text>l</xsl:text><xsl:value-of select="@line"/>
        </xsl:attribute>
        <xsl:value-of select="."/>
      </j:entry>
    </xsl:for-each>
  </xsl:for-each>
</xsl:variable>

<xsl:template match="/">
  <html>
    <head>
      <xsl:copy-of select="xhtml:html/xhtml:head/*"/>
    </head>
    <body>
      <xsl:copy-of select="xhtml:html/xhtml:body/*"/>
      <div class="chapter">
        <h2>Transcriber's notes</h2>

        <p>This ebook is derived from a digitisation of a signed first edition published by Bradbury
        &amp; Evans in 1850.</p>

        <p>There is a fair amount of inconsistent hyphenation in this book. This has been left
        unchanged.</p>

        <p>No change has been made to archaic or dialect spelling.</p>

        <p>The following list details the decisions made regarding correction of typos:</p>

        <dl>
          <xsl:apply-templates select=".//xhtml:div[@class='chapter']"/>
        </dl>
      </div>
    </body>
  </html>
</xsl:template>

<xsl:template match="xhtml:div[@class='chapter']">
  <xsl:if test=".//xhtml:a[@id]">
    <dt>
      <xsl:value-of select="xhtml:h2/text()"/>
    </dt>
    <xsl:apply-templates select=".//xhtml:a[@id]"/>
  </xsl:if>
</xsl:template>

<xsl:template match="xhtml:a[@id]">
  <xsl:variable name="key" select="@id"/>
  <dd><a>
    <xsl:attribute name="href">
      <xsl:value-of select="concat('#', @id)"/>
    </xsl:attribute>
    <xsl:value-of select="@id"/>
  </a>
  <xsl:text>: </xsl:text>
  <xsl:value-of select="exsl:node-set($note_lookup)/j:entry[@ref=$key]"/>
  </dd>
</xsl:template>

</xsl:stylesheet>