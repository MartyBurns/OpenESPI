<?xml version="1.0" encoding="UTF-8"?>
<?altova_samplexml file:///D:/_project/NIST/NISTGreenButton/Source/GreenButtonTestPlan/ResultsSummaryTemplate.xml?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:atom="http://www.w3.org/2005/Atom" exclude-result-prefixes="atom">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="no"/>
	<xsl:param name="FileName" select="'D:\_project\NIST\NISTGreenButton\Source\GreenButtonTestPlan\TestResults\TEST_D_D1_BAD.xml'"/>
	<xsl:template match="/">
		<xsl:variable name="MainDocRoot" select="anElement"/>
		<xsl:element name="anElement">
			<xsl:for-each select="/anElement/assert">
					<xsl:sort select="@TestID" />
				<!--<xsl:copy-of select="."/>-->
					<xsl:element name="assert">
						<xsl:attribute name="TestID"><xsl:value-of select="@TestID"/></xsl:attribute> 
						
						<xsl:element name="role"><xsl:value-of select="role"/></xsl:element>
						<xsl:element name="TestName"><xsl:value-of select="TestName"/></xsl:element>
						<xsl:element name="Report"><xsl:value-of select="Report"/></xsl:element>
						<xsl:element name="diagnostics"><xsl:value-of select="diagnostics"/></xsl:element>
						
						<xsl:element name="Occurances">	
							<xsl:for-each select="Occurances/Occurance">
								<xsl:if test=". != 'NONE'">
									<xsl:element name="Occurance">
										<xsl:value-of select="."/>
									</xsl:element>
								</xsl:if>
							</xsl:for-each>
							<xsl:if test="document($FileName)/anElement/assert[@TestID = current()/@TestID]">
								<xsl:element name="Occurance">
									<xsl:value-of select="$FileName"/>
								</xsl:element>
							</xsl:if>
						</xsl:element>	
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="document($FileName)/anElement/assert">
				<xsl:if test="count($MainDocRoot/assert[@TestID = current()/@TestID])=0">
					<!--<xsl:copy-of select="current()"/>-->
					<xsl:element name="assert">
						<xsl:attribute name="TestID"><xsl:value-of select="@TestID"/></xsl:attribute> 
						
						<xsl:element name="role"><xsl:value-of select="role"/></xsl:element>
						<xsl:element name="TestName"><xsl:value-of select="TestName"/></xsl:element>
						<xsl:element name="Report"><xsl:value-of select="Report"/></xsl:element>
						<xsl:element name="diagnostics"><xsl:value-of select="diagnostics"/></xsl:element>

						<xsl:element name="Occurances">
							<xsl:element name="Occurance">
								<xsl:value-of select="$FileName"/>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	
	
</xsl:stylesheet>
