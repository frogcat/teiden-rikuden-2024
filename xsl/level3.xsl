<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" method="text" indent="no"/>
    <xsl:template match="/">
        <xsl:variable name="pref" select="//div[@id='AreaLocation']/p/a[4]/text()"/>
        <xsl:variable name="city" select="//div[@id='AreaLocation']/p/span[1]/text()"/>
        <xsl:for-each select="//table[@class='mapc-cyo']/tr[td]">
            <xsl:value-of select="td[2]"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="substring-after(@class,' ')"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="$pref"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="$city"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="td[1]"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="td[3]"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="td[4]"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="td[5]"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="td[6]"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>