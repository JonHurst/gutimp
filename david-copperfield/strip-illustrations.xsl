<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xhtml="http://www.w3.org/1999/xhtml">

<xsl:output method="xml"
	    doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
	    doctype-public="-//W3C//DTD XHTML 1.1//EN"
	    version="1.0" encoding="utf-8"/>

<xsl:template match="node()|@*">
  <xsl:copy>
    <xsl:apply-templates select="node()|@*"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="xhtml:div[@id='plates']">
  <xsl:comment>Illustrations removed from this version</xsl:comment>
</xsl:template>
<xsl:template match="xhtml:div[contains(@class, 'image')]"/>

</xsl:stylesheet>