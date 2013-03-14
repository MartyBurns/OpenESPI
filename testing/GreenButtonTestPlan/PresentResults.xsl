<?xml version="1.0"?>
<?altova_samplexml file:///D:/_project/NIST/NISTGreenButton/Source/GreenButtonTestPlan/TestResults/Results_BAD_Summary.xml?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<html>
			<table border="1">
				<tr>
					<th>TestID</th>
					<th>Report</th>
					<th>Test Name</th>
					<th>Test Requirement</th>
					<xsl:if test="count(/anElement/assert/Occurances)>0">
						<th>Occurances</th>
					</xsl:if>
				</tr>		
				<xsl:for-each select="anElement/assert">				
					<xsl:variable name="color">
						<xsl:choose>
							<xsl:when test="Occurances and count(Occurances/Occurance)=0">
								<xsl:text>#FF0000</xsl:text>
							</xsl:when>		
							<xsl:otherwise>
								<xsl:text>#FFFFFF</xsl:text>
							</xsl:otherwise>					
						</xsl:choose>
					</xsl:variable>
					<xsl:element name="tr">
						<xsl:attribute name="bgcolor"><xsl:value-of select="$color"/></xsl:attribute>
						<td><xsl:value-of select="@TestID"/></td>
						<td><xsl:text>Failure to </xsl:text><xsl:value-of select="Report"/><xsl:text> for the </xsl:text><xsl:value-of select="TestName"/><xsl:text>.</xsl:text></td>
						<td><xsl:value-of select="TestName"/></td>
						<td><xsl:value-of select="Report"/></td>
						<xsl:if test="count(/anElement/assert/Occurances)>0">
							<td>
								<xsl:choose>
									<xsl:when test="count(Occurances/Occurance)>0">
										<table border="0">
											<xsl:for-each select="Occurances/Occurance">
												<tr>	
													<td>
														<xsl:call-template name="RemoveSlashes">
															<xsl:with-param name="value" select="."/>
														</xsl:call-template>
													</td>
												</tr>					
											</xsl:for-each>
										</table>									
									</xsl:when>
									<xsl:otherwise>
										<xsl:if test="Occurances">
											<table border="0">
												<tr>	
													<td><xsl:text>NO RESULTS: TESTING FAILED</xsl:text></td>
												</tr>				
											</table>
										</xsl:if>				
									</xsl:otherwise>
								</xsl:choose>		
							</td>
							</xsl:if>
					</xsl:element>
				</xsl:for-each>
			</table>
		</html>
	</xsl:template>
	<xsl:template name="RemoveSlashes">
		<xsl:param name="value"/>
		<xsl:choose>
			<xsl:when test="contains($value,'\')">
				<xsl:call-template name="RemoveSlashes">
					<xsl:with-param name="value" select="substring-after($value,'\')"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$value"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
