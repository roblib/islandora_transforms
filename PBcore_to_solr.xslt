<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:java="http://xml.apache.org/xalan/java"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:foxml="info:fedora/fedora-system:def/foxml#"
  xmlns:pb="http://www.pbcore.org/PBCore/PBCoreNamespace.html"
  exclude-result-prefixes="pb java">

  

<xsl:template match="foxml:datastream[@ID='PBCORE']/foxml:datastreamVersion[last()]"
        name="index_PBCore">
        <xsl:param name="content"/>
        <xsl:param name="prefix">PBCore_</xsl:param>
        <xsl:param name="suffix">_ms</xsl:param>
        <xsl:param name="pid">not provided</xsl:param>
    <xsl:param name="datastream">not provided</xsl:param>
    <!-- Transformation of pbcore for islandvoices.ca taken from vre2 server     -->
    <xsl:for-each
        select="$content//pb:pbcoreDescription[1]">
        <xsl:if test="text() [normalize-space(.) ]">
            <!--don't bother with empty space-->
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, 'abstract', $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="normalize-space(text())"/>
            </field>
        </xsl:if>
    </xsl:for-each>
    
    <xsl:for-each
        select="$content//pb:pbcoreDescription[2]">
        <xsl:if test="text() [normalize-space(.) ]">
            <!--don't bother with empty space-->
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, 'segments', $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="normalize-space(text())"/>
            </field>
        </xsl:if>
    </xsl:for-each>
    
    <xsl:for-each select="$content//pb:pbcoreTitle">

        <!--<xsl:if test="java:add($single_valued_hashset, 'PBCore_title')">
            <xsl:if test="text() [normalize-space(.) ]">
                <field>
                    <xsl:attribute name="name">
                        <xsl:value-of select="concat($prefix, 'title',  '_s')"/>
                    </xsl:attribute>
                    <xsl:value-of select="normalize-space(text())"/>
                </field>
            </xsl:if>
        </xsl:if>-->
        <xsl:if test="text() [normalize-space(.) ]">
            <!--don't bother with empty space-->
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, 'title', $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="normalize-space(text())"/>
            </field>
        </xsl:if>
    </xsl:for-each>
    
    
    <xsl:for-each
        select="$content//pb:pbcoreSubject">
        <xsl:if test="text() [normalize-space(.) ]">
            <!--don't bother with empty space-->
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, 'subject', $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="normalize-space(text())"/>
            </field>
        </xsl:if>
    </xsl:for-each>
    
    <xsl:for-each
        select="$content//pb:pbcoreCoverage[pb:coverageType='Spatial']/pb:coverage">
        <xsl:if test="text() [normalize-space(.) ]">
            <!--don't bother with empty space-->
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, 'spatial', $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="normalize-space(text())"/>
            </field>
        </xsl:if>
    </xsl:for-each>
    
    <xsl:for-each
        select="$content//pb:pbcoreCoverage[pb:coverageType='Temporal']/pb:coverage">
        <xsl:if test="text() [normalize-space(.) ]">
            <!--don't bother with empty space-->
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, 'temporal', $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="normalize-space(text())"/>
            </field>
        </xsl:if>
    </xsl:for-each>
    
    <xsl:for-each
        select="$content//pb:pbcoreContributor[pb:contributorRole='Interviewee']/pb:contributor">
        <xsl:if test="text() [normalize-space(.) ]">
            <!--don't bother with empty space-->
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, 'interviewee', $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="normalize-space(text())"/>
            </field>
        </xsl:if>
    </xsl:for-each>
    
    <field>
        <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, 'duration', $suffix)"/>
        </xsl:attribute>
        <xsl:value-of
            select="$content//pb:instantiationDuration"
        />
    </field>

    <xsl:variable name="rawTextValue" select="$content//pb:instantiationDate"/>

    <xsl:variable name="textValue">
      <xsl:call-template name="get_ISO8601_date">
        <xsl:with-param name="date" select="$rawTextValue"/>
        <xsl:with-param name="pid" select="$pid"/>
        <xsl:with-param name="datastream" select="$datastream"/>
      </xsl:call-template>
    </xsl:variable>
    
    <field>
        <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, 'date', $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="$rawTextValue"/>
    </field>
    <xsl:if test="textValue != ''">
    <field>
        <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, 'date', '_dt')"/>
        </xsl:attribute>
        <xsl:value-of select="$textValue"
        />
    </field>
    </xsl:if>
    <!-- end of pbcore -->
    </xsl:template>
    
 

</xsl:stylesheet>
