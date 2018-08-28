<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:java="http://xml.apache.org/xalan/java"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:foxml="info:fedora/fedora-system:def/foxml#"
  xmlns:dwc="http://rs.tdwg.org/dwc/xsd/simpledarwincore/"
  exclude-result-prefixes="dwc java">

  

<xsl:template match="foxml:datastream[@ID='DARWIN_CORE']/foxml:datastreamVersion[last()]"
        name="index_DARWING_CORE">
        <xsl:param name="content"/>
        <xsl:param name="prefix">dwc_</xsl:param>
        <xsl:param name="suffix">_ms</xsl:param>
        <xsl:param name="pid">not provided</xsl:param>
    <xsl:param name="datastream">not provided</xsl:param>
    
     <xsl:for-each
            select="$content//dwc:SimpleDarwinRecordSet/dwc:SimpleDarwinRecord/*">
            <xsl:if test="text() [normalize-space(.) ]">
                <field>
                    <xsl:attribute name="name">
                        <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
                    </xsl:attribute>
                    <xsl:value-of select="normalize-space(text())"/>
                </field>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
