<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" method="text" indent="no"/>
    <xsl:template match="/">
        <xsl:for-each select="//tr[@class='on-color']">
            <xsl:value-of select="concat('https://www.rikuden.co.jp/nw/teiden/f2/now/',@data-href,'&#10;')"/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>