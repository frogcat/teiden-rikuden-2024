<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" method="text" indent="no"/>
    <xsl:template match="/">
        <xsl:variable name="t" select="//div[@id='time']/text()"/>
        <xsl:value-of select="substring($t,1,4)"/>
        <xsl:value-of select="substring($t,6,2)"/>
        <xsl:value-of select="substring($t,9,2)"/>
        <xsl:value-of select="substring($t,12,2)"/>
        <xsl:value-of select="substring($t,15,2)"/>
    </xsl:template>
</xsl:stylesheet>