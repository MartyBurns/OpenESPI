<?xml version="1.0" encoding="UTF-8"?>
<!--
==========================================================================
 Stylesheet: GreenButtonDataStyleSheet.xsl
    Version: 0.7.20130104
     Author: Ron Pasquarelli, Marty Burns (Hypertek for EnerNex)
     Notice: This is draft prototype developed for SGIP by the Administrator Technical Team (EnerNex)
========================================================================== 
Copyright (c) 2011, 2012 EnergyOS.Org
 
Licensed by EnergyOS.Org under one or more contributor license agreements.
 
See the NOTICE file distributed with this work for additional information regarding copyright ownership.  The EnergyOS.org licenses this file to you under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.  You may obtain a copy of the License at:
    http://www.apache.org/licenses/LICENSE-2.0
  
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the specific language governing permissions and limitations under the License.

-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:espi="http://naesb.org/espi" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:variable name="XML" select="/"/>
	<xsl:variable name="gl_PresentationMultiplierElectricy" select="3"/>
	<xsl:variable name="gl_PresentationMultiplierGas" select="5"/>
	<xsl:variable name="gl_PresentationMultiplierTherms" select="0"/>
	<xsl:variable name="gl_PresentationMultiplierWater" select="3"/>
	<xsl:variable name="GL_DEBUG_TIME" select="0"/>
	<xsl:template match="/">
		<html>
			<head>
				<!-- Styles used in this template -->
				<style type="text/css">
				
				table.GBDataTable {
					color:black;
					background:white;
					border:1px;
					border-color: rgb(6,134,34); 
					border-style: solid; 
					background-color: #ffffff;
					float: none;
				}

				table.GBDataTable th {
					font-family: Verdana, Arial, Helvetica, sans-serif;
					font-size:14pt;
					color:#078723;
					clear:both;
					border:1px solid rgb(6,134,34) rgb(6,134,34) rgb(6,134,34) rgb(6,134,34); 
				}
					
				table.GBDataTable td {
					color: black;
					font-family:Georgia, "Times New Roman", Times, serif;
					font-size: 16px;
					font-style:normal;
				}	 
					 
				table.GBInnerDataTable th {
					color:black;
					background:white;
					border:1px;
					border-color: rgb(6,134,34) rgb(6,134,34) rgb(6,134,34) rgb(6,134,34); 
					border-style: solid; 
					background-color: #ffffff;
					font-size:10pt;
				}			
			
			
			</style>
			</head>
			<body>
				<xsl:for-each select="$XML">
					<xsl:for-each select="atom:feed/atom:entry/atom:content/espi:UsagePoint">
						<xsl:variable name="MeterReadingLink">
							<xsl:for-each select="../../atom:link[@rel='related']/@href">
								<xsl:if test="count($XML/atom:feed/atom:entry[atom:link[@rel='up' and @href=current()]]/atom:content/espi:MeterReading) > 0">
									<xsl:value-of select="."/>
								</xsl:if>
							</xsl:for-each>
						</xsl:variable>

						<xsl:variable name="LocalTimeParamsLink">
							<xsl:for-each select="../../atom:link[@rel='related']/@href">
								<xsl:if test="count($XML/atom:feed/atom:entry[atom:link[@rel='self' and @href=current()]]/atom:content/espi:LocalTimeParameters) > 0">
									<xsl:value-of select="."/>
								</xsl:if>
							</xsl:for-each>
						</xsl:variable>
						
						<xsl:variable name="UsageSummaryLink">
							<xsl:for-each select="../../atom:link[@rel='related']/@href">
								<xsl:if test="count($XML/atom:feed/atom:entry[atom:link[@rel='up' and @href=current()]]/atom:content/espi:ElectricPowerUsageSummary) > 0">
									<xsl:value-of select="."/>
								</xsl:if>
							</xsl:for-each>
						</xsl:variable>
												
						<xsl:variable name="ServiceKind" select="espi:ServiceCategory/espi:kind"/>

					<p>
					<xsl:variable name="UnitsAxisName">
						<xsl:for-each select="$XML/atom:feed/atom:entry[atom:link[@rel='up' and @href=$MeterReadingLink]]/atom:content/espi:MeterReading">
							<xsl:for-each select="$XML/atom:feed/atom:entry[atom:link[@rel='self' and @href=current()/../../atom:link[@rel='related']/@href]]/atom:content/espi:ReadingType/espi:uom">
								<xsl:call-template name="UOMForPlot"/>	
							</xsl:for-each>
						</xsl:for-each>
					</xsl:variable>
					<xsl:variable name="CostAxisName">
						<xsl:for-each select="$XML/atom:feed/atom:entry[atom:link[@rel='up' and @href=$MeterReadingLink]]/atom:content/espi:MeterReading">
							<xsl:for-each select="$XML/atom:feed/atom:entry[atom:link[@rel='self' and @href=current()/../../atom:link[@rel='related']/@href]]/atom:content/espi:ReadingType/espi:currency">
								<xsl:choose>
									<xsl:when test=". = 840">
										<xsl:text>$</xsl:text>
									</xsl:when>
									<xsl:when test=". = 978">
										<xsl:text>Euro</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>unknown</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:variable>
					
					<!-- The following javascript is used when plotting -->
					<!-- <script type="text/javascript">initComp('<xsl:value-of select="$CostAxisName"/>','<xsl:value-of select="$UnitsAxisName"/>');</script> -->
	
						</p>
						<br/>
						<table class="GBDataTable" width="100%">
							<thead>
								<tr>
									<th>
										<xsl:text>Usage Information</xsl:text>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<span>
											<xsl:call-template name="UsagePoint"/>
										</span>
									</td>
								</tr>
							</tbody>
						</table>
						<xsl:call-template name="ElectricPowerUsage">
							<xsl:with-param name="MeterReadingLink" select="$MeterReadingLink"/>
							<xsl:with-param name="LocalTimeParamsLink" select="$LocalTimeParamsLink"/>
							<xsl:with-param name="UsageSummaryLink" select="$UsageSummaryLink"/>
							<xsl:with-param name="ServiceKind" select="$ServiceKind"/>
						</xsl:call-template>
						<xsl:for-each select="$XML/atom:feed/atom:entry[atom:link[@rel='up' and @href=$MeterReadingLink]]/atom:content/espi:MeterReading">
							<xsl:variable name="IntervalBlockLink">
								<xsl:for-each select="../../atom:link[@rel='related']/@href">
									<xsl:if test="count($XML/atom:feed/atom:entry[atom:link/@href=current()]/atom:content/espi:IntervalBlock)>0">
										<xsl:value-of select="."/>
									</xsl:if>
								</xsl:for-each>
							</xsl:variable>
							<table class="GBDataTable" width="100%">
								<thead>
									<tr>
										<th>
											<xsl:text>Meter Reading Information</xsl:text>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<span>
												<xsl:call-template name="MeterReading">
													<xsl:with-param name="ServiceKind" select="$ServiceKind"/>
												</xsl:call-template>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table class="GBDataTable" width="100%">
								<thead>
									<tr>
										<th>
											<xsl:text>Detailed Usage</xsl:text>
											<br/>
											<br/>
											<!-- find start date -->
											<xsl:variable name="StartDateTime">
												<xsl:for-each select="$XML/atom:feed/atom:entry[atom:link/@href=$IntervalBlockLink]/atom:content/espi:IntervalBlock[*]/espi:interval/espi:start">
													<xsl:sort select="." data-type="number" order="ascending"/>
													<xsl:if test="position() = 1">
														<xsl:value-of select="."/>
													</xsl:if>
												</xsl:for-each>
											</xsl:variable>
											<!-- find end date -->
											<xsl:variable name="EndDateTime">
												<xsl:for-each select="$XML/atom:feed/atom:entry[atom:link/@href=$IntervalBlockLink]/atom:content/espi:IntervalBlock[*]/espi:interval/espi:start">
													<xsl:sort select="." data-type="number" order="descending"/>
													<xsl:if test="position() = 1">
														<xsl:value-of select="."/>
													</xsl:if>
												</xsl:for-each>
											</xsl:variable>
											<!-- find end duration -->
											<xsl:variable name="EndDuration">
												<xsl:for-each select="$XML/atom:feed/atom:entry[atom:link/@href=$IntervalBlockLink]/atom:content/espi:IntervalBlock[*]/espi:interval/espi:start">
													<xsl:sort select="." data-type="number" order="descending"/>
													<xsl:if test="position() = 1">
														<xsl:value-of select="../espi:duration"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:variable>
											<span>
												<xsl:text>Start date: </xsl:text>
											</span>
											<xsl:variable name="DSTStartUnix">
												<xsl:call-template name="GetDSTEventDateUnixTime">
													<xsl:with-param name="unixCurrDate" select="$StartDateTime"/>
													<xsl:with-param name="HexDSTRule" select="$XML/atom:feed/atom:entry[atom:link/@rel='self' and atom:link/@href=$LocalTimeParamsLink]/atom:content/espi:LocalTimeParameters/espi:dstStartRule"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="DSTEndUnix">
												<xsl:call-template name="GetDSTEventDateUnixTime">
													<xsl:with-param name="unixCurrDate" select="$StartDateTime"/>
													<xsl:with-param name="HexDSTRule" select="$XML/atom:feed/atom:entry[atom:link/@rel='self' and atom:link/@href=$LocalTimeParamsLink]/atom:content/espi:LocalTimeParameters/espi:dstEndRule"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="TZ" select="$XML/atom:feed/atom:entry[atom:link/@rel='self' and atom:link/@href=$LocalTimeParamsLink]/atom:content/espi:LocalTimeParameters/espi:tzOffset"/>
											<xsl:variable name="dstOffset" select="$XML/atom:feed/atom:entry[atom:link/@rel='self' and atom:link/@href=$LocalTimeParamsLink]/atom:content/espi:LocalTimeParameters/espi:dstOffset"/>
											<xsl:call-template name="Date2">
												<xsl:with-param name="pdtTmp" select="$StartDateTime"/>
												<xsl:with-param name="TZ" select="$TZ"/>
												<xsl:with-param name="dateDSTStartUnix" select="$DSTStartUnix"/>
												<xsl:with-param name="dateDSTEndUnix" select="$DSTEndUnix"/>
												<xsl:with-param name="dstOffset" select="$dstOffset"/>
											</xsl:call-template>
											<span>
												<xsl:text> for </xsl:text>
											</span>
											<span>
												<xsl:value-of select="format-number((($EndDateTime + $EndDuration) - $StartDateTime) div(86400),&apos;##&apos;)"/>
											</span>
											<span>
												<xsl:if test="format-number((($EndDateTime + $EndDuration) - $StartDateTime) div(86400),&apos;##&apos;)>1">
													<xsl:text> days</xsl:text>
												</xsl:if>
												<xsl:if test="format-number((($EndDateTime + $EndDuration) - $StartDateTime) div(86400),&apos;##&apos;)=1">
													<xsl:text> day</xsl:text>
												</xsl:if>
											</span>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<xsl:call-template name="IntervalBlock">
												<xsl:with-param name="IntervalBlockLink" select="$IntervalBlockLink"/>
												<xsl:with-param name="LocalTimeParamsLink" select="$LocalTimeParamsLink"/>
												<xsl:with-param name="ServiceKind" select="$ServiceKind"/>
											</xsl:call-template>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
				<span>
					<xsl:text>&#160;</xsl:text>
				</span>
				<br/>
			</body>
		</html>
	</xsl:template>
	<!--
==========================================================================
 Template: UsagePoint
 Description: Present UsagePoint attributes
========================================================================== -->
	<xsl:template name="UsagePoint">
		<xsl:text>For location: </xsl:text>
		<xsl:value-of select="../../atom:title"/>
		<!-- The following javascript is used when plotting -->
		<!-- <script type="text/javascript">initLocation('<xsl:value-of select="../../atom:title"/>');</script> -->
	</xsl:template>
	<!--
==========================================================================
 Template: MeterReading
 Description: Present MeterReading attributes
========================================================================== -->
	<xsl:template name="MeterReading">
		<xsl:param name="ServiceKind"/>
		<xsl:text>Type of readings: </xsl:text>
		<xsl:choose>
			<xsl:when test="$ServiceKind = 0">
				<xsl:text>Electricity</xsl:text>
			</xsl:when>
			<xsl:when test="$ServiceKind = 1">
				<xsl:text>Gas</xsl:text>
			</xsl:when>
			<xsl:when test="$ServiceKind = 2">
				<xsl:text>Water</xsl:text>
			</xsl:when>
		</xsl:choose>	

		<xsl:if test="../../atom:title">
			<span>
				<xsl:text>, </xsl:text>
			</span>
			<xsl:value-of select="../../atom:title"/>		
		</xsl:if>

		<xsl:for-each select="$XML/atom:feed/atom:entry[atom:link[@rel='self' and @href=current()/../../atom:link[@rel='related']/@href]]/atom:content/espi:ReadingType">
			<span>
				<xsl:text>, </xsl:text>
			</span>
			<xsl:for-each select="espi:uom">
				<xsl:call-template name="UOM"/>
			</xsl:for-each>
			<xsl:for-each select="espi:phase">
				<xsl:text>&#160;</xsl:text>
				<xsl:choose>
					<xsl:when test=". = 769">
						<xsl:text>,</xsl:text>
						<xsl:text>Two-Phase Residential Service</xsl:text>
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
	
	<!--
==========================================================================
 Template: IntervalBlock
 Description: Present IntervalBlock attributes
========================================================================== -->
	<xsl:template name="IntervalBlock">
		<xsl:param name="IntervalBlockLink"/>
		<xsl:param name="LocalTimeParamsLink"/>
		<xsl:param name="ServiceKind"/>

		<xsl:variable name="ReadingTypeLink" select="$XML/atom:feed/atom:entry[atom:link[@rel='self' and @href=current()/../../atom:link[@rel='related']/@href]]/atom:content/espi:ReadingType/../../atom:link[@rel='self']/@href"/>
		
		<xsl:for-each select="$XML/atom:feed/atom:entry[atom:link/@href=$IntervalBlockLink]/atom:content/espi:IntervalBlock">
			<xsl:sort select="./espi:interval/espi:start" data-type="number" order="ascending"/>
			<xsl:variable name="DSTStartUnix">
				<xsl:call-template name="GetDSTEventDateUnixTime">
					<xsl:with-param name="unixCurrDate" select="espi:interval/espi:start[1]"/>
					<xsl:with-param name="HexDSTRule" select="$XML/atom:feed/atom:entry[atom:link/@rel='self' and atom:link/@href=$LocalTimeParamsLink]/atom:content/espi:LocalTimeParameters/espi:dstStartRule"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="DSTEndUnix">
				<xsl:call-template name="GetDSTEventDateUnixTime">
					<xsl:with-param name="unixCurrDate" select="espi:interval/espi:start[1]"/>
					<xsl:with-param name="HexDSTRule" select="$XML/atom:feed/atom:entry[atom:link/@rel='self' and atom:link/@href=$LocalTimeParamsLink]/atom:content/espi:LocalTimeParameters/espi:dstEndRule"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="TZ" select="$XML/atom:feed/atom:entry[atom:link/@rel='self' and atom:link/@href=$LocalTimeParamsLink]/atom:content/espi:LocalTimeParameters/espi:tzOffset"/>
			<xsl:variable name="dstOffset" select="$XML/atom:feed/atom:entry[atom:link/@rel='self' and atom:link/@href=$LocalTimeParamsLink]/atom:content/espi:LocalTimeParameters/espi:dstOffset"/>
			<xsl:if test="$GL_DEBUG_TIME=1">
				<xsl:text> DST:START: 
					</xsl:text>
				<xsl:value-of select="$DSTStartUnix"/>
				<xsl:text> DST:End: 
					</xsl:text>
				<xsl:value-of select="$DSTEndUnix"/>
				<xsl:text> Tz: </xsl:text>
				<xsl:value-of select="$TZ"/>
			</xsl:if>
			<br/>
			<table class="GBDataTable" width="100%">
				<thead>
					<tr>
						<th>
							<xsl:for-each select="espi:interval">
								<xsl:text>Data for period starting: </xsl:text>
								<xsl:for-each select="espi:start">
									<!-- The following javascript is used when plotting -->
									<!-- <script type="text/javascript">
													compStartDay('<xsl:call-template name="Date">
										<xsl:with-param name="TZ" select="$TZ"/>
										<xsl:with-param name="dateDSTStartUnix" select="$DSTStartUnix"/>
										<xsl:with-param name="dateDSTEndUnix" select="$DSTEndUnix"/>
										<xsl:with-param name="dstOffset" select="$dstOffset"/>										
									</xsl:call-template>');
									</script> -->
									<xsl:call-template name="Date">
										<xsl:with-param name="TZ" select="$TZ"/>
										<xsl:with-param name="dateDSTStartUnix" select="$DSTStartUnix"/>
										<xsl:with-param name="dateDSTEndUnix" select="$DSTEndUnix"/>
										<xsl:with-param name="dstOffset" select="$dstOffset"/>
									</xsl:call-template>
								</xsl:for-each>
								<xsl:for-each select="espi:duration">
									<xsl:text> for </xsl:text>
									<span>
										<xsl:if test="round((. div(3600)) div(24)) = ((. div(3600)) div(24))">
											<xsl:value-of select="((. div(3600)) div(24))"/>
											<xsl:if test="((. div(3600)) div(24))>1">
												<xsl:text> days</xsl:text>
											</xsl:if>
											<xsl:if test="((. div(3600)) div(24))=1">
												<xsl:text> day</xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="round((. div(3600)) div(24)) != ((. div(3600)) div(24))">
											<xsl:value-of select=". div(3600)"/>
											<xsl:if test=". div(3600)>1">
												<xsl:text> hours</xsl:text>
											</xsl:if>
											<xsl:if test=". div(3600)=1">
												<xsl:text> hour</xsl:text>
											</xsl:if>
										</xsl:if>
										<!--<xsl:value-of select=". div(3600)"/>-->
									</span>
									<!--<xsl:text> hours</xsl:text>-->
								</xsl:for-each>
							</xsl:for-each>
							<br/>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<table class="GBInnerDataTable" width="100%">
								<thead>
									<tr>
										<th>
											<xsl:text>Energy consumption time period</xsl:text>
										</th>
										<th>
											<xsl:text>Usage</xsl:text>
											<br/>
											<xsl:for-each select="$XML/atom:feed/atom:entry[atom:link[@rel='self' and @href=$ReadingTypeLink]]/atom:content/espi:ReadingType">
												<span>
													<xsl:text>(</xsl:text>
												</span>
												<xsl:for-each select="espi:uom">
													<xsl:call-template name="UOM"/>
												</xsl:for-each>
												<span>
													<xsl:text>)</xsl:text>
												</span>
											</xsl:for-each>
										</th>
										<!-- see if cost exists -->
										<xsl:if test="count(espi:IntervalReading/espi:cost)>0">
											<th>
												<xsl:text>Cost</xsl:text>
												<br/>
												<xsl:for-each select="$XML/atom:feed/atom:entry[atom:link[@rel='self' and @href=$ReadingTypeLink]]/atom:content/espi:ReadingType/espi:currency">
													<span>
														<xsl:text>(</xsl:text>
													</span>
													<xsl:call-template name="Currency"/>
													<span>
														<xsl:text>)</xsl:text>
													</span>
												</xsl:for-each>
											</th>
										</xsl:if>
										<th>
											<xsl:text>Events occurred</xsl:text>
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:variable name="valuePoTM" select="$XML/atom:feed/atom:entry[atom:link[@rel='self' and @href=$ReadingTypeLink]]/atom:content/espi:ReadingType/espi:powerOfTenMultiplier"/>
									<xsl:variable name="valueMultiplier">
										<xsl:choose>
											<xsl:when test="$valuePoTM=0">1</xsl:when>
											<!--  0 = None -->
											<xsl:when test="$valuePoTM=1">10</xsl:when>
											<!--  1 = deca=x10 -->
											<xsl:when test="$valuePoTM=2">100</xsl:when>
											<!--  2 = hecto=x100 -->
											<xsl:when test="$valuePoTM=3">1000</xsl:when>
											<!--  3 = kilo=x1000 -->
											<xsl:when test="$valuePoTM=6">1000000</xsl:when>
											<!--  6 = Mega=x106 -->
											<xsl:when test="$valuePoTM=9">1000000000</xsl:when>
											<!--  9 = Giga=x109 -->
											<xsl:when test="$valuePoTM=-3">0.001</xsl:when>
											<!--  -3 = mili=x10-3 -->
											<xsl:when test="$valuePoTM=-6">0.000001</xsl:when>
											<!--  -6 = micro=x10-3 -->
											<xsl:otherwise>1</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<!-- always display graph in kWh -->
									<xsl:for-each select="espi:IntervalReading">
										<xsl:sort select="./espi:timePeriod/espi:start" data-type="number" order="ascending"/>
										<xsl:variable name="PlotYVal" select="espi:value * $valueMultiplier"/>
										<!-- The following javascript is used when plotting -->
										<!-- <script type="text/javascript">compAddValueAndDate('<xsl:value-of select="$PlotYVal"/>','<xsl:for-each select="espi:timePeriod">
												<xsl:for-each select="espi:start">
													<xsl:call-template name="Date">
															<xsl:with-param name="TZ" select="$TZ"/>
															<xsl:with-param name="dateDSTStartUnix" select="$DSTStartUnix"/>
															<xsl:with-param name="dateDSTEndUnix" select="$DSTEndUnix"/>
															<xsl:with-param name="dstOffset" select="$dstOffset"/>
															
														</xsl:call-template>
												</xsl:for-each>
											</xsl:for-each>','<xsl:for-each select="espi:cost">
												<xsl:value-of select="format-number( . div(100000),&quot;0.00&quot;)"/>
											</xsl:for-each>');</script> -->
										<tr>
											<td>
												<xsl:for-each select="espi:timePeriod">
													<xsl:for-each select="espi:start">
														<!--<xsl:call-template name="Date"/>-->
														<xsl:call-template name="Date">
															<xsl:with-param name="TZ" select="$TZ"/>
															<xsl:with-param name="dateDSTStartUnix" select="$DSTStartUnix"/>
															<xsl:with-param name="dateDSTEndUnix" select="$DSTEndUnix"/>
															<xsl:with-param name="dstOffset" select="$dstOffset"/>
														</xsl:call-template>
													</xsl:for-each>
													<span>
														<xsl:text>to </xsl:text>
													</span>
													<xsl:call-template name="ConvStartPlusDuration">
														<xsl:with-param name="vStart" select="espi:start"/>
														<xsl:with-param name="vDuration" select="espi:duration"/>
														<xsl:with-param name="TZ" select="$TZ"/>
														<xsl:with-param name="dateDSTStartUnix" select="$DSTStartUnix"/>
														<xsl:with-param name="dateDSTEndUnix" select="$DSTEndUnix"/>
														<xsl:with-param name="dstOffset" select="$dstOffset"/>
													</xsl:call-template>
												</xsl:for-each>
												<xsl:text>&#160;</xsl:text>
											</td>
											<td align="right">
												<xsl:call-template name="ScaleValue">
													<xsl:with-param name="Value" select="espi:value"/>
													<xsl:with-param name="valuePoTM" select="$XML/atom:feed/atom:entry[atom:link[@rel='self' and @href=$ReadingTypeLink]]/atom:content/espi:ReadingType/espi:powerOfTenMultiplier"/>
													<xsl:with-param name="ServiceKind" select="$ServiceKind"/>
												</xsl:call-template>
											</td>
											<xsl:if test="count(espi:cost)>0">
												<td align="right">
													<xsl:for-each select="espi:cost">
														<xsl:value-of select="format-number( . div(100000),&quot;#,###,##0.00&quot;)"/>
													</xsl:for-each>
												</td>
											</xsl:if>
											<td>
												<span>
													<xsl:text>&#160; </xsl:text>
												</span>
												<xsl:for-each select="espi:ReadingQuality">
													<xsl:for-each select="espi:quality">
														<xsl:choose>
															<xsl:when test=". = &quot;&quot;">
																<span>
																	<xsl:text>None </xsl:text>
																</span>
															</xsl:when>
															<xsl:when test=". != &quot;&quot;">
																<xsl:apply-templates/>
															</xsl:when>
														</xsl:choose>
													</xsl:for-each>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</xsl:for-each>
	</xsl:template>
	<!--
==========================================================================
 Template: ReadingType
 Description: Present ReadingType attributes
========================================================================== -->
	<!--<xsl:template name="ReadingType">
		<xsl:for-each select="$XML/atom:feed/atom:entry/atom:content/espi:ReadingType">
			<br/>
			<xsl:value-of select="../../atom:title"/>
			<br/>
			<br/>
			<xsl:for-each select="espi:accumulationBehaviour">
				<xsl:text>Accumulation behaviour: </xsl:text>
				<xsl:apply-templates/>
			</xsl:for-each>
			<br/>
			<xsl:for-each select="espi:commodity">
				<xsl:text>Commodity: </xsl:text>
				<xsl:apply-templates/>
			</xsl:for-each>
			<br/>
			<xsl:for-each select="espi:dataQualifier">
				<xsl:text>Data qualifier: </xsl:text>
				<xsl:apply-templates/>
			</xsl:for-each>
			<br/>
			<xsl:for-each select="espi:flowDirection">
				<xsl:text>Flow direction: </xsl:text>
				<xsl:apply-templates/>
			</xsl:for-each>
			<br/>
			<xsl:for-each select="espi:intervalLength">
				<xsl:text>Interval length: </xsl:text>
				<xsl:apply-templates/>
			</xsl:for-each>
			<br/>
			<xsl:for-each select="espi:kind">
				<xsl:text>Kind: </xsl:text>
				<xsl:apply-templates/>
			</xsl:for-each>
			<br/>
			<xsl:for-each select="espi:phase">
				<xsl:text>Phase: </xsl:text>
				<xsl:apply-templates/>
			</xsl:for-each>
			<br/>
			<xsl:for-each select="espi:powerOfTenMultiplier">
				<xsl:text>Power of ten multiplier: </xsl:text>
				<xsl:apply-templates/>
			</xsl:for-each>
			<br/>
			<xsl:for-each select="espi:timeAttribute">
				<xsl:text>Time attribute: </xsl:text>
				<xsl:apply-templates/>
			</xsl:for-each>
			<br/>
			<xsl:text>UOM: </xsl:text>
			<xsl:for-each select="espi:uom">
				<xsl:call-template name="UOM"/>
			</xsl:for-each>
			<br/>
		</xsl:for-each>
	</xsl:template>-->
	<!--
==========================================================================
 Template: ElectricPowerUsage
 Description: Present ElectricPowerUsage attributes
========================================================================== -->
	<xsl:template name="ElectricPowerUsage">
		<xsl:param name="LocalTimeParamsLink"/>
		<xsl:param name="MeterReadingLink"/>
		<xsl:param name="UsageSummaryLink"/>
		<xsl:param name="ServiceKind"/>

		<xsl:for-each select="../../atom:link[@rel='related']/@href">
			<xsl:for-each select="$XML/atom:feed/atom:entry[atom:link[@rel='up' and @href=current()]]/atom:content/espi:ElectricPowerUsageSummary">
				<br/>
				<table class="GBDataTable" width="100%">
					<thead>
						<tr>
							<th>
								<xsl:text>Summary of Usage Information*</xsl:text>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<span>
									<span>
										<xsl:text>* Note: Quality of this summary and information is &quot;</xsl:text>
									</span>
									<xsl:if test="espi:qualityOfReading">
										<xsl:for-each select="espi:qualityOfReading">
											<xsl:choose>
												<xsl:when test=". = 14">
													<span>
														<xsl:text>raw: data that has not gone through the validation, editing and estimation process</xsl:text>
													</span>
												</xsl:when>
												<xsl:when test=". != 14">
													<span>
														<xsl:text>unknown</xsl:text>
													</span>
												</xsl:when>
											</xsl:choose>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="not(espi:qualityOfReading)">
										<xsl:text>not specified</xsl:text>
									</xsl:if>
									<span>
										<xsl:text>&quot;</xsl:text>
									</span>
									<br/>
									<br/>
									<xsl:text>Current billing period as of: </xsl:text>
									<xsl:for-each select="espi:statusTimeStamp">
										<xsl:variable name="DSTStartUnix">
											<xsl:call-template name="GetDSTEventDateUnixTime">
												<xsl:with-param name="unixCurrDate" select="."/>
												<xsl:with-param name="HexDSTRule" select="$XML/atom:feed/atom:entry[atom:link/@rel='self' and atom:link/@href=$LocalTimeParamsLink]/atom:content/espi:LocalTimeParameters/espi:dstStartRule"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:variable name="DSTEndUnix">
											<xsl:call-template name="GetDSTEventDateUnixTime">
												<xsl:with-param name="unixCurrDate" select="."/>
												<xsl:with-param name="HexDSTRule" select="$XML/atom:feed/atom:entry[atom:link/@rel='self' and atom:link/@href=$LocalTimeParamsLink]/atom:content/espi:LocalTimeParameters/espi:dstEndRule"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:variable name="TZ" select="$XML/atom:feed/atom:entry[atom:link/@rel='self' and atom:link/@href=$LocalTimeParamsLink]/atom:content/espi:LocalTimeParameters/espi:tzOffset"/>
										<xsl:variable name="dstOffset" select="$XML/atom:feed/atom:entry[atom:link/@rel='self' and atom:link/@href=$LocalTimeParamsLink]/atom:content/espi:LocalTimeParameters/espi:dstOffset"/>
										<xsl:call-template name="Date">
											<xsl:with-param name="TZ" select="$TZ"/>
											<xsl:with-param name="dateDSTStartUnix" select="$DSTStartUnix"/>
											<xsl:with-param name="dateDSTEndUnix" select="$DSTEndUnix"/>
											<xsl:with-param name="dstOffset" select="$dstOffset"/>
										</xsl:call-template>
									</xsl:for-each>
									<br/>
									<xsl:for-each select="espi:currency">
										<xsl:text>Currency: </xsl:text>
										<xsl:call-template name="Currency"/>
										<xsl:text> (note: all costs presented are rounded to the nearest penny)</xsl:text>
										<br/>
									</xsl:for-each>
									<xsl:for-each select="espi:billToDate">
										<xsl:text>Cost of usage(</xsl:text>
										<xsl:for-each select="../espi:currency">
											<xsl:call-template name="Currency"/>
										</xsl:for-each>
										<xsl:text>): </xsl:text>
										<xsl:value-of select="format-number( . div(100000),&apos;#,###,##0.00&apos;)"/>
										<br/>
									</xsl:for-each>
									<xsl:text>Consumption</xsl:text>
									<xsl:for-each select="espi:currentBillingPeriodOverAllConsumption">
										<xsl:text>(</xsl:text>
										<xsl:for-each select="espi:uom">
											<xsl:call-template name="UOM"/>
										</xsl:for-each>
										<xsl:text>) </xsl:text>
										<span>
											<xsl:text>:</xsl:text>
										</span>
										<xsl:call-template name="ScaleValue">
											<xsl:with-param name="Value" select="espi:value"/>
											<xsl:with-param name="valuePoTM" select="espi:powerOfTenMultiplier"/>
											<xsl:with-param name="ServiceKind" select="$ServiceKind"/>
										</xsl:call-template>
									</xsl:for-each>
									<xsl:for-each select="espi:currentBillingPeriodOverAllConsumption"/>
									<br/>
									<br/>
									<xsl:for-each select="espi:billingPeriod">
										<xsl:variable name="vStart" select="round(espi:start)"/>
										<xsl:text>Last billing period:</xsl:text>
										<span>
											<xsl:text>&#160;</xsl:text>
										</span>
										<xsl:for-each select="espi:start">
											<xsl:variable name="DSTStartUnix">
												<xsl:call-template name="GetDSTEventDateUnixTime">
													<xsl:with-param name="unixCurrDate" select="."/>
													<xsl:with-param name="HexDSTRule" select="$XML/atom:feed/atom:entry[atom:link/@rel='self' and atom:link/@href=$LocalTimeParamsLink]/atom:content/espi:LocalTimeParameters/espi:dstStartRule"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="DSTEndUnix">
												<xsl:call-template name="GetDSTEventDateUnixTime">
													<xsl:with-param name="unixCurrDate" select="."/>
													<xsl:with-param name="HexDSTRule" select="$XML/atom:feed/atom:entry[atom:link/@rel='self' and atom:link/@href=$LocalTimeParamsLink]/atom:content/espi:LocalTimeParameters/espi:dstEndRule"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="TZ" select="$XML/atom:feed/atom:entry[atom:link/@rel='self' and atom:link/@href=$LocalTimeParamsLink]/atom:content/espi:LocalTimeParameters/espi:tzOffset"/>
											<xsl:variable name="dstOffset" select="$XML/atom:feed/atom:entry[atom:link/@rel='self' and atom:link/@href=$LocalTimeParamsLink]/atom:content/espi:LocalTimeParameters/espi:dstOffset"/>
											<xsl:call-template name="Date">
												<xsl:with-param name="TZ" select="$TZ"/>
												<xsl:with-param name="dateDSTStartUnix" select="$DSTStartUnix"/>
												<xsl:with-param name="dateDSTEndUnix" select="$DSTEndUnix"/>
												<xsl:with-param name="dstOffset" select="$dstOffset"/>
											</xsl:call-template>
										</xsl:for-each>
										<span>
											<xsl:text>&#160;</xsl:text>
										</span>
										<xsl:text>to </xsl:text>
									</xsl:for-each>
									<xsl:for-each select="espi:billingPeriod">
										<xsl:variable name="DSTStartUnix">
											<xsl:call-template name="GetDSTEventDateUnixTime">
												<xsl:with-param name="unixCurrDate" select="espi:start"/>
												<xsl:with-param name="HexDSTRule" select="$XML/atom:feed/atom:entry[atom:link/@rel='self' and atom:link/@href=$LocalTimeParamsLink]/atom:content/espi:LocalTimeParameters/espi:dstStartRule"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:variable name="DSTEndUnix">
											<xsl:call-template name="GetDSTEventDateUnixTime">
												<xsl:with-param name="unixCurrDate" select="espi:start"/>
												<xsl:with-param name="HexDSTRule" select="$XML/atom:feed/atom:entry[atom:link/@rel='self' and atom:link/@href=$LocalTimeParamsLink]/atom:content/espi:LocalTimeParameters/espi:dstEndRule"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:variable name="TZ" select="$XML/atom:feed/atom:entry[atom:link/@rel='self' and atom:link/@href=$LocalTimeParamsLink]/atom:content/espi:LocalTimeParameters/espi:tzOffset"/>
										<xsl:variable name="dstOffset" select="$XML/atom:feed/atom:entry[atom:link/@rel='self' and atom:link/@href=$LocalTimeParamsLink]/atom:content/espi:LocalTimeParameters/espi:dstOffset"/>
										<xsl:call-template name="ConvStartPlusDuration">
											<xsl:with-param name="vStart" select="espi:start"/>
											<xsl:with-param name="vDuration" select="espi:duration"/>
											<xsl:with-param name="TZ" select="$TZ"/>
											<xsl:with-param name="dateDSTStartUnix" select="$DSTStartUnix"/>
											<xsl:with-param name="dateDSTEndUnix" select="$DSTEndUnix"/>
											<xsl:with-param name="dstOffset" select="$dstOffset"/>
										</xsl:call-template>
									</xsl:for-each>
									<br/>
									<xsl:for-each select="espi:billLastPeriod">
										<xsl:text>Bill last period(</xsl:text>
										<xsl:for-each select="$XML/atom:feed/atom:entry[atom:link[@rel='up' and @href=$UsageSummaryLink]]/atom:content/espi:ElectricPowerUsageSummary/espi:currency">
											<xsl:call-template name="Currency"/>
										</xsl:for-each>
										<xsl:text>): </xsl:text>
										<xsl:value-of select="format-number( . div(100000),&quot;#,###,##0.00&quot;)"/>
										<br/>
									</xsl:for-each>
									<xsl:for-each select="espi:billLastPeriod">
										<xsl:for-each select="$XML/atom:feed/atom:entry[atom:link[@rel='up' and @href=$UsageSummaryLink]]/atom:content/espi:ElectricPowerUsageSummary/espi:currency">
											<xsl:text>Cost of usage last billing period (</xsl:text>
											<xsl:call-template name="Currency"/>
											<xsl:text>):&#160; </xsl:text>
										</xsl:for-each>
										<xsl:value-of select="format-number((../espi:billLastPeriod - ../espi:costAdditionalLastPeriod)div(100000),&quot;#,###,##0.00&quot;)"/>
										<br/>
									</xsl:for-each>
									<xsl:for-each select="espi:costAdditionalLastPeriod">
										<xsl:text>Cost additional last period (taxes and other fixed charges) (</xsl:text>
										<xsl:for-each select="$XML/atom:feed/atom:entry[atom:link[@rel='up' and @href=$UsageSummaryLink]]/atom:content/espi:ElectricPowerUsageSummary/espi:currency">
											<xsl:call-template name="Currency"/>
										</xsl:for-each>
										<xsl:text>): </xsl:text>
										<xsl:value-of select="format-number( . div(100000),&apos;#,###,##0.00&apos;)"/>
										<br/>
									</xsl:for-each>
									
									<xsl:for-each select="espi:overallConsumptionLastPeriod">
										<xsl:text>Consumption last period</xsl:text>
										<xsl:text>(</xsl:text>
										<xsl:for-each select="espi:uom">
											<xsl:call-template name="UOM"/>
										</xsl:for-each>
										<xsl:text>) </xsl:text>
										<span>
											<xsl:text>:</xsl:text>
										</span>
										<xsl:call-template name="ScaleValue">
											<xsl:with-param name="Value" select="espi:value"/>
											<xsl:with-param name="valuePoTM" select="espi:powerOfTenMultiplier"/>
											<xsl:with-param name="ServiceKind" select="$ServiceKind"/>
										</xsl:call-template>
									</xsl:for-each>	
								</span>
							</td>
						</tr>
					</tbody>
				</table>		
				<br/>
			</xsl:for-each>
		</xsl:for-each>
		<br/>
	</xsl:template>
	
<!--
==========================================================================
 Template: HexToDecimal
 Description: convert hex string to decimal number
========================================================================== -->
	<xsl:template name="HexToDecimal">
		<xsl:param name="hexNumber"/>
		<xsl:param name="decimalNumber">0</xsl:param>
		<!-- If there is zero hex digits left, output -->
		<xsl:choose>
			<xsl:when test="$hexNumber">
				<xsl:call-template name="HexToDecimal">
					<xsl:with-param name="decimalNumber" select="($decimalNumber*16)+number(substring-before(substring-after('00/11/22/33/44/55/66/77/88/99/A10/B11/C12/D13/E14/F15/a10/b11/c12/d13/e14/f15/',substring($hexNumber,1,1)),'/'))"/>
					<xsl:with-param name="hexNumber" select="substring($hexNumber,2)"/>
				</xsl:call-template>
			</xsl:when>
			<!-- otherwise multiply, and add the next digit, and recurse -->
			<xsl:otherwise>
				<xsl:value-of select="$decimalNumber"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- If it begins with 0x then parse it for sure, else return it -->
	<xsl:template name="asDecimal">
		<xsl:param name="number"/>
		<xsl:choose>
			<xsl:when test="substring($number,1,2)='0x'">
				<xsl:call-template name="HexToDecimal">
					<xsl:with-param name="hexNumber" select="substring($number,3)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$number"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--
==========================================================================
 Template: GetDSTEventDate
 Description: find date of DST event given current year and DST rule
========================================================================== -->
	<xsl:template name="GetDSTEventDateUnixTime">
		<xsl:param name="unixCurrDate"/>
		<xsl:param name="HexDSTRule"/>
		<xsl:variable name="strCurrDate">
			<xsl:call-template name="Date2">
				<xsl:with-param name="pdtTmp" select="$unixCurrDate"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="strCurrYear">
			<xsl:call-template name="working-year">
				<xsl:with-param name="date" select="$strCurrDate"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="iDSTRule">
			<xsl:call-template name="HexToDecimal">
				<xsl:with-param name="hexNumber" select="$HexDSTRule"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="DSTSeconds" select="floor($iDSTRule div 1)-floor(floor($iDSTRule div 1) div 4096) * 4096"/>
		<xsl:variable name="DSTHours" select="floor($iDSTRule div 4096)-floor(floor($iDSTRule div 4096) div 32) * 32"/>
		<xsl:variable name="DSTDoW" select="floor($iDSTRule div 131072)-floor(floor($iDSTRule div 131072) div 8) * 8"/>
		<xsl:variable name="DSTDoM" select="floor($iDSTRule div 1048576)-floor(floor($iDSTRule div 1048576) div 32) * 32"/>
		<xsl:variable name="DSTOp" select="floor($iDSTRule div 33554432)-floor(floor($iDSTRule div 33554432) div 8) * 8"/>
		<xsl:variable name="DSTMonth" select="floor($iDSTRule div 268435456)-floor(floor($iDSTRule div 268435456) div 16) * 16"/>
		<xsl:variable name="Occurance">
			<xsl:choose>
				<xsl:when test="$DSTOp = 2">
					<!-- 2: DST starts/ends on the first occurrence of the Day of the Week in a month -->
					<xsl:value-of select="1"/>
				</xsl:when>
				<xsl:when test="$DSTOp = 3">
					<!-- 3: DST starts/ends on the second occurrence of the Day of the Week in a month -->
					<xsl:value-of select="2"/>
				</xsl:when>
				<xsl:when test="$DSTOp = 4">
					<!-- 4: DST starts/ends on the third occurrence of the Day of the Week in a month -->
					<xsl:value-of select="3"/>
				</xsl:when>
				<xsl:when test="$DSTOp = 5">
					<!-- 5: DST starts/ends on the forth occurrence of the Day of the Week in a month -->
					<xsl:value-of select="4"/>
				</xsl:when>
				<xsl:when test="$DSTOp = 6">
					<!-- 6: DST starts/ends on the fifth occurrence of the Day of the Week in a mont -->
					<xsl:value-of select="5"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="($DSTOp = 2) or ($DSTOp = 3) or ($DSTOp = 4) or ($DSTOp = 5) or ($DSTOp = 6)">
				<!-- 2: DST starts/ends on the first occurrence of the Day of the Week in a month -->
				<!-- 3: DST starts/ends on the second occurrence of the Day of the Week in a month -->
				<!-- 4: DST starts/ends on the third occurrence of the Day of the Week in a month -->
				<!-- 5: DST starts/ends on the forth occurrence of the Day of the Week in a month -->
				<!-- 6: DST starts/ends on the fifth occurrence of the Day of the Week in a mont -->
				<xsl:variable name="StartOfMonthDoW">
					<xsl:call-template name="day-of-week">
						<xsl:with-param name="year" select="$strCurrYear"/>
						<xsl:with-param name="month" select="$DSTMonth"/>
						<xsl:with-param name="day" select="1"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="DoWDiff">
					<xsl:choose>
						<xsl:when test="$DSTDoW >= $StartOfMonthDoW">
							<xsl:value-of select="$DSTDoW - $StartOfMonthDoW"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$DSTDoW - $StartOfMonthDoW + 7"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="NoDaysToDSTTarget" select="($Occurance - 1) * 7"/>
				<xsl:variable name="DstActualDayOfMonth" select="1 + $DoWDiff + $NoDaysToDSTTarget"/>
				<xsl:variable name="dateActualDSTDateA">
					<xsl:value-of select="$strCurrYear"/>-<xsl:value-of select="format-number($DSTMonth,&apos;00&apos;)"/>-<xsl:value-of select="format-number($DstActualDayOfMonth,&apos;00&apos;)"/>T<xsl:value-of select="format-number($DSTHours,&apos;00&apos;)"/>:<xsl:value-of select="format-number(floor($DSTSeconds div 60),&apos;00&apos;)"/>:<xsl:value-of select="format-number($DSTSeconds - floor($DSTSeconds div 60),&apos;00&apos;)"/>Z
			</xsl:variable>
				<!-- <xsl:text> The dateActualDSTDateA:</xsl:text>
			<xsl:value-of select="$dateActualDSTDateA"/>	-->
				<xsl:variable name="dateActualDSTDateAUnix">
					<xsl:call-template name="convert-date-time-to-unix">
						<xsl:with-param name="dtTmp" select="$dateActualDSTDateA"/>
					</xsl:call-template>
				</xsl:variable>
				<!-- <xsl:text> The dateActualDSTDateAUnix:</xsl:text> -->
				<xsl:value-of select="$dateActualDSTDateAUnix"/>
			</xsl:when>
			<xsl:otherwise>
				<!-- 
	TBD: the following cases have not yet been implemented
	0: DST starts/ends on the Day of the Month
	1: DST starts/ends on the Day of the Week that is on or after the Day of the Month
	7: DST starts/ends on the last occurrence of the Day of the Week in a month
	-->
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--
==========================================================================
 Template: ScaleValue
 Description: apply PoTM and presentation multipliers
========================================================================== -->
	<xsl:template name="ScaleValue">
		<xsl:param name="Value"/>
		<xsl:param name="valuePoTM"/>
		<xsl:param name="ServiceKind"/>
		

		<xsl:variable name="valueMultiplier">
			<xsl:choose>
				<xsl:when test="$valuePoTM=0">1</xsl:when>
				<!--  0 = None -->
				<xsl:when test="$valuePoTM=1">10</xsl:when>
				<!--  1 = deca=x10 -->
				<xsl:when test="$valuePoTM=2">100</xsl:when>
				<!--  2 = hecto=x100 -->
				<xsl:when test="$valuePoTM=3">1000</xsl:when>
				<!--  3 = kilo=x1000 -->
				<xsl:when test="$valuePoTM=6">1000000</xsl:when>
				<!--  6 = Mega=x106 -->
				<xsl:when test="$valuePoTM=9">1000000000</xsl:when>
				<!--  9 = Giga=x109 -->
				<xsl:when test="$valuePoTM=-3">0.001</xsl:when>
				<!--  -3 = mili=x10-3 -->
				<xsl:when test="$valuePoTM=-6">0.000001</xsl:when>
				<!--  -6 = micro=x10-3 -->
				<xsl:otherwise>1</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="currentPresentationMultiplierKind">
			<xsl:choose>
				<xsl:when test="$ServiceKind=0">
					<xsl:value-of select="$gl_PresentationMultiplierElectricy"/>
				</xsl:when>
				<xsl:when test="$ServiceKind=1">
					<xsl:value-of select="$gl_PresentationMultiplierTherms"/>
				</xsl:when>
				<xsl:when test="$ServiceKind=2">
					<xsl:value-of select="$gl_PresentationMultiplierWater"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="presentationMultiplier">
			<xsl:choose>
				<xsl:when test="$currentPresentationMultiplierKind=0">1</xsl:when>
				<!--  0 = None -->
				<xsl:when test="$currentPresentationMultiplierKind=1">0.1</xsl:when>
				<!--  1 = deca=x10 -->
				<xsl:when test="$currentPresentationMultiplierKind=2">0.01</xsl:when>
				<!--  2 = hecto=x100 -->
				<xsl:when test="$currentPresentationMultiplierKind=3">0.001</xsl:when>
				<!--  3 = kilo=x1000 -->
				<xsl:when test="$currentPresentationMultiplierKind=6">0.00001</xsl:when>
				<!--  6 = Mega=x106 -->
				<xsl:when test="$currentPresentationMultiplierKind=9">0.00000001</xsl:when>
				<!--  9 = Giga=x109 -->
				<xsl:when test="$currentPresentationMultiplierKind=-3">1000</xsl:when>
				<!--  -3 = mili=x10-3 -->
				<xsl:when test="$currentPresentationMultiplierKind=-6">1000000</xsl:when>
				<!--  -6 = micro=x10-3 -->
				<xsl:otherwise>1</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="format-number($Value * $valueMultiplier * $presentationMultiplier,&quot;#,###,##0.000&quot;)"/>
	</xsl:template>
	<!--
==========================================================================
 Template (s): UOM, Currency, Date, ConvStartPlusDuration, GetPowerOf10String
 Description: Present Units of Measure (UOM), kind of readings, currency, dates, and dates plus duration
========================================================================== -->
	<xsl:template name="GetPowerOf10String">
		<xsl:param name="po10" select="0"/>
		<xsl:choose>
			<xsl:when test="$po10=0"/>
			<!--  0 = None -->
			<xsl:when test="$po10=1">deca</xsl:when>
			<!--  1 = deca=x10 -->
			<xsl:when test="$po10=2">hecto</xsl:when>
			<!--  2 = hecto=x100 -->
			<xsl:when test="$po10=3">kilo</xsl:when>
			<!--  3 = kilo=x1000 -->
			<xsl:when test="$po10=6">mega</xsl:when>
			<!--  6 = Mega=x106 -->
			<xsl:when test="$po10=9">giga</xsl:when>
			<!--  9 = Giga=x109 -->
			<xsl:when test="$po10=-3">milli</xsl:when>
			<!--  -3 = mili=x10-3 -->
			<xsl:when test="$po10=-6">micro</xsl:when>
			<!--  -6 = micro=x10-3 -->
			<xsl:otherwise> </xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="UOM">
		<xsl:choose>
			<xsl:when test=". = 72">
				<xsl:variable name="DisplayUnits">
					<xsl:call-template name="GetPowerOf10String">
						<xsl:with-param name="po10" select="$gl_PresentationMultiplierElectricy"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:text>Real energy in </xsl:text>
				<xsl:value-of select="$DisplayUnits"/>
				<xsl:text>watt-hours</xsl:text>
			</xsl:when>
			<xsl:when test=". = 132">
				<xsl:variable name="DisplayUnits">
					<xsl:call-template name="GetPowerOf10String">
						<xsl:with-param name="po10" select="gl_PresentationMultiplierGas"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:text>Real energy in </xsl:text>
				<xsl:value-of select="$DisplayUnits"/>
				<xsl:text>BTU</xsl:text>
			</xsl:when>
			<xsl:when test=". = 128">
				<xsl:variable name="DisplayUnits">
					<xsl:call-template name="GetPowerOf10String">
						<xsl:with-param name="po10" select="gl_PresentationMultiplierWater"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:text>Volume in </xsl:text>
				<xsl:value-of select="$DisplayUnits"/>
				<xsl:text>USG</xsl:text>
			</xsl:when>
			<!-- Therms -->
			<xsl:when test=". = 169">
				<xsl:variable name="DisplayUnits">
					<xsl:call-template name="GetPowerOf10String">
						<xsl:with-param name="po10" select="gl_PresentationMultiplierTherms"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:text>Consumption in </xsl:text>
				<xsl:value-of select="$DisplayUnits"/>
				<xsl:text>Therms</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>Unknown</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="UOMForPlot">
		<xsl:choose>
			<xsl:when test=". = 72">
				<xsl:variable name="DisplayUnits">
					<xsl:call-template name="GetPowerOf10String">
						<xsl:with-param name="po10" select="$gl_PresentationMultiplierElectricy"/>
					</xsl:call-template>
				</xsl:variable>
				
				<xsl:value-of select="$DisplayUnits"/>
				<xsl:text>watt-hours</xsl:text>
			</xsl:when>
			<xsl:when test=". = 132">
				<xsl:variable name="DisplayUnits">
					<xsl:call-template name="GetPowerOf10String">
						<xsl:with-param name="po10" select="gl_PresentationMultiplierGas"/>
					</xsl:call-template>
				</xsl:variable>
				
				<xsl:value-of select="$DisplayUnits"/>
				<xsl:text>BTU</xsl:text>
			</xsl:when>
			<xsl:when test=". = 128">
				<xsl:variable name="DisplayUnits">
					<xsl:call-template name="GetPowerOf10String">
						<xsl:with-param name="po10" select="gl_PresentationMultiplierWater"/>
					</xsl:call-template>
				</xsl:variable>
				
				<xsl:value-of select="$DisplayUnits"/>
				<xsl:text>USG</xsl:text>
			</xsl:when>
			<!-- Therms -->
			<xsl:when test=". = 169">
				<xsl:variable name="DisplayUnits">
					<xsl:call-template name="GetPowerOf10String">
						<xsl:with-param name="po10" select="gl_PresentationMultiplierTherms"/>
					</xsl:call-template>
				</xsl:variable>
				
				<xsl:value-of select="$DisplayUnits"/>
				<xsl:text>Therms</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>Unknown</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="Currency">
		<xsl:choose>
			<xsl:when test=". = 840">
				<xsl:text>US Dollar</xsl:text>
			</xsl:when>
			<xsl:when test=". = 978">
				<xsl:text>Euro</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>unknown</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--
==========================================================================
 Template (s): Date
 Description: Converts unix-time to time string and if necessary from UTC to local
========================================================================== -->
	<xsl:template name="Date">
		<xsl:param name="TZ" select="0"/>
		<xsl:param name="dateDSTStartUnix" select="0"/>
		<xsl:param name="dateDSTEndUnix" select="0"/>
		<xsl:param name="dstOffset" select="0"/>
		<xsl:variable name="TimeCompA">
			<xsl:choose>
				<xsl:when test="$TZ != 0">
					<xsl:value-of select=". + $TZ"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="TimeCompB">
			<xsl:choose>
				<xsl:when test="($dateDSTStartUnix != 0) and ($dateDSTEndUnix != 0)">
					<xsl:choose>
						<xsl:when test="($TimeCompA >= $dateDSTStartUnix) and($TimeCompA &lt; $dateDSTEndUnix) ">
							<xsl:value-of select="$TimeCompA + $dstOffset"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$TimeCompA"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$TimeCompA"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="$GL_DEBUG_TIME=1">
			UT:
			<xsl:variable name="strTemp1">
				<xsl:call-template name="convert-unix-to-date-time">
					<xsl:with-param name="dtTmp" select="."/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:value-of select="concat(substring-before($strTemp1 , 'T'), ' ', substring-after( $strTemp1 , 'T'))"/>		
			LT: 
		</xsl:if>
		<xsl:variable name="strTemp">
			<xsl:call-template name="convert-unix-to-date-time">
				<xsl:with-param name="dtTmp" select="$TimeCompB"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="concat(substring-before($strTemp , 'T'), ' ', substring-after( $strTemp , 'T'))"/>
		<xsl:if test="$GL_DEBUG_TIME=1">
			<xsl:choose>
				<xsl:when test="($dateDSTStartUnix != 0) and ($dateDSTEndUnix != 0)">
					<xsl:choose>
						<xsl:when test="($TimeCompA >= $dateDSTStartUnix) and($TimeCompA &lt; $dateDSTEndUnix) ">
							<xsl:text> DST </xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text> ST </xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text> ST </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<span>
			<xsl:text>&#160;</xsl:text>
		</span>
	</xsl:template>
	<!--
==========================================================================
 Template (s): Date2
 Description: Converts unix-time to time string and if necessary from UTC to local
========================================================================== -->
	<xsl:template name="Date2">
		<xsl:param name="pdtTmp"/>
		<xsl:param name="TZ" select="0"/>
		<xsl:param name="dateDSTStartUnix" select="0"/>
		<xsl:param name="dateDSTEndUnix" select="0"/>
		<xsl:param name="dstOffset" select="0"/>
		<xsl:variable name="TimeCompA">
			<xsl:choose>
				<xsl:when test="$TZ != 0">
					<xsl:value-of select="$pdtTmp + $TZ"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$pdtTmp"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="TimeCompB">
			<xsl:choose>
				<xsl:when test="($dateDSTStartUnix != 0) and ($dateDSTEndUnix != 0)">
					<xsl:choose>
						<xsl:when test="($TimeCompA >= $dateDSTStartUnix) and($TimeCompA &lt; $dateDSTEndUnix) ">
							<xsl:value-of select="$TimeCompA + $dstOffset"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$TimeCompA"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$TimeCompA"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="strTemp">
			<xsl:call-template name="convert-unix-to-date-time">
				<xsl:with-param name="dtTmp" select="$TimeCompB"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="concat(substring-before($strTemp , 'T'), ' ', substring-after( $strTemp , 'T'))"/>
		<span>
			<xsl:text>&#160;</xsl:text>
		</span>
	</xsl:template>
	<!--
==========================================================================
 Template (s): ConvStartPlusDuration
 Description: Converts unix-time to time string and if necessary from UTC to local
========================================================================== -->
	<xsl:template name="ConvStartPlusDuration">
		<xsl:param name="vStart" select="&apos;&apos;"/>
		<xsl:param name="vDuration" select="&apos;&apos;"/>
		<xsl:param name="TZ" select="0"/>
		<xsl:param name="dateDSTStartUnix" select="0"/>
		<xsl:param name="dateDSTEndUnix" select="0"/>
		<xsl:param name="dstOffset" select="0"/>
		<xsl:variable name="TimeCompA">
			<xsl:choose>
				<xsl:when test="$TZ != 0">
					<xsl:value-of select="$vStart + $TZ + $vDuration"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$vStart + $vDuration"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="TimeCompB">
			<xsl:choose>
				<xsl:when test="($dateDSTStartUnix != 0) and ($dateDSTEndUnix != 0)">
					<xsl:choose>
						<xsl:when test="($TimeCompA >= $dateDSTStartUnix) and($TimeCompA &lt; $dateDSTEndUnix) ">
							<xsl:value-of select="$TimeCompA + $dstOffset"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$TimeCompA"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$TimeCompA"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="strTemp">
			<xsl:call-template name="convert-unix-to-date-time">
				<xsl:with-param name="dtTmp" select="$TimeCompB"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="concat(substring-before($strTemp , 'T'), ' ', substring-after( $strTemp , 'T'))"/>
	</xsl:template>
	<!--
==========================================================================
 Stylesheet: datetime_lib.xsl
    Version: 1.1 (2002-01-21)
     Author: Martin "Marrow" Rowlinson
     Notice: (c)2001,2002 MarrowSoft Limited.  ALL RIGHTS RESERVED.
             No limitation on use - except this code may not be published,
             in whole or in part, without prior written consent of copyright
             owner.
========================================================================== -->
	<!-- ========================================================================== -->
	<!-- these are 'string arrays' - change for language requirements               -->
	<xsl:variable name="default-week-day-names" select="'[1]Monday[2]Tuesday[3]Wednesday[4]Thursday[5]Friday[6]Saturday[7]Sunday[end]'"/>
	<xsl:variable name="default-month-names" select="'[01]January[02]February[03]March[04]April[05]May[06]June[07]July[08]August[09]September[10]October[11]November[12]December[end]'"/>
	<xsl:variable name="default-am-pm-names" select="'[0]am[1]pm[end]'"/>
	<!-- ========================================================================== -->
	<!--
==========================================================================
    Template: date-to-julian-day
 Description: Convert a date to julian day
 Parameters:-
    <year> <month> <day>
   or
    <date> (format: yyyymmdd or yyyy-mm-dd)
========================================================================== -->
	<xsl:template name="date-to-julian-day">
		<xsl:param name="year"/>
		<xsl:param name="month"/>
		<xsl:param name="day"/>
		<!-- or -->
		<xsl:param name="date" select="''"/>
		<!-- trim down date -->
		<xsl:variable name="tdate" select="translate($date,'-','')"/>
		<!-- decide which params were passed -->
		<xsl:variable name="yyyy">
			<xsl:choose>
				<xsl:when test="string-length($date) &gt; 0">
					<xsl:value-of select="substring($tdate,1,4)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$year"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="mm">
			<xsl:choose>
				<xsl:when test="string-length($date) &gt; 0">
					<xsl:value-of select="substring($tdate,5,2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$month"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="dd">
			<xsl:choose>
				<xsl:when test="string-length($date) &gt; 0">
					<xsl:value-of select="substring($tdate,7,2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$day"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!-- pre-calcs -->
		<xsl:variable name="j0" select="ceiling(($mm - 14) div 12)"/>
		<xsl:variable name="j1" select="floor((1461 * ($yyyy + 4800 + $j0)) div 4)"/>
		<xsl:variable name="j2" select="floor((367 * ($mm - 2 - (12 * $j0))) div 12)"/>
		<xsl:variable name="j3" select="floor((3 * floor(($yyyy + 4900 + $j0) div 100)) div 4)"/>
		<!-- final calc -->
		<xsl:value-of select="$j1 + $j2 - $j3 + $dd - 32075"/>
	</xsl:template>
	<!--
==========================================================================
    Template: julian-day-to-date
 Description: Convert a julian day to date
 Parameters:-
    <julian-day>
========================================================================== -->
	<xsl:template name="julian-day-to-date">
		<xsl:param name="julian-day" select="number(0)"/>
		<!-- pre-calcs -->
		<xsl:variable name="la" select="$julian-day + 68569"/>
		<xsl:variable name="n" select="floor((4 * $la) div 146097)"/>
		<xsl:variable name="lb" select="$la - floor((146097 * $n + 3) div 4)"/>
		<xsl:variable name="i" select="floor((4000 * ($lb + 1)) div 1461001)"/>
		<xsl:variable name="lc" select="$lb - floor((1461 * $i) div 4) + 31"/>
		<xsl:variable name="j" select="floor((80 * $lc) div 2447)"/>
		<xsl:variable name="day" select="$lc - floor((2447 * $j) div 80)"/>
		<xsl:variable name="ld" select="floor($j div 11)"/>
		<xsl:variable name="month" select="$j + 2 - (12 * $ld)"/>
		<xsl:variable name="year" select="100 * ($n - 49) + $i + $ld"/>
		<!-- pad final result -->
		<xsl:variable name="sday" select="concat(substring('00',1,2 - string-length(string($day))),string($day))"/>
		<xsl:variable name="smonth" select="concat(substring('00',1,2 - string-length(string($month))),string($month))"/>
		<xsl:variable name="syear" select="concat(substring('00',1,4 - string-length(string($year))),string($year))"/>
		<!-- final output -->
		<xsl:value-of select="concat($syear,'-',$smonth,'-',$sday)"/>
	</xsl:template>
	<!--
==========================================================================
    Template: date-diff
 Description: Calculate the difference (in days) between two dates
 Parameters:-
    <year1> <month1> <day1>
   or
    <date1>

   and
    <year2> <month2> <day2>
   or
    <date2>
========================================================================== -->
	<xsl:template name="date-diff">
		<xsl:param name="year1"/>
		<xsl:param name="month1"/>
		<xsl:param name="day1"/>
		<xsl:param name="year2"/>
		<xsl:param name="month2"/>
		<xsl:param name="day2"/>
		<!-- or -->
		<xsl:param name="date1" select="''"/>
		<!-- format: yyyymmdd or yyyy-mm-dd -->
		<xsl:param name="date2" select="''"/>
		<!-- format: yyyymmdd or yyyy-mm-dd -->
		<!-- calc the two julian day numbers -->
		<xsl:variable name="jd1">
			<xsl:call-template name="date-to-julian-day">
				<xsl:with-param name="year" select="$year1"/>
				<xsl:with-param name="month" select="$month1"/>
				<xsl:with-param name="day" select="$day1"/>
				<xsl:with-param name="date" select="$date1"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="jd2">
			<xsl:call-template name="date-to-julian-day">
				<xsl:with-param name="year" select="$year2"/>
				<xsl:with-param name="month" select="$month2"/>
				<xsl:with-param name="day" select="$day2"/>
				<xsl:with-param name="date" select="$date2"/>
			</xsl:call-template>
		</xsl:variable>
		<!-- perform calc -->
		<xsl:value-of select="$jd1 - $jd2"/>
	</xsl:template>
	<!--
==========================================================================
    Template: date-add
 Description: Adds/subtracts a specified number of days to a date
 Parameters:-
    <year> <month> <day>
   or
    <date>

   and
    <add> (+ve or -ve)
========================================================================== -->
	<xsl:template name="date-add">
		<xsl:param name="year"/>
		<xsl:param name="month"/>
		<xsl:param name="day"/>
		<!-- or -->
		<xsl:param name="date" select="''"/>
		<!-- format: yyyymmdd or yyyy-mm-dd -->
		<!-- and add/subtract days -->
		<xsl:param name="add" select="number(0)"/>
		<!-- get the julian day for the date -->
		<xsl:variable name="jd">
			<xsl:call-template name="date-to-julian-day">
				<xsl:with-param name="year" select="$year"/>
				<xsl:with-param name="month" select="$month"/>
				<xsl:with-param name="day" select="$day"/>
				<xsl:with-param name="date" select="$date"/>
			</xsl:call-template>
		</xsl:variable>
		<!-- add/subtract the modifier to the julian day -->
		<xsl:variable name="output-date">
			<xsl:call-template name="julian-day-to-date">
				<xsl:with-param name="julian-day" select="$jd + $add"/>
			</xsl:call-template>
		</xsl:variable>
		<!-- output resultant -->
		<xsl:value-of select="$output-date"/>
	</xsl:template>
	<!--
==========================================================================
    Template: date-time-to-float
 Description: Convert a date/time to a floating point.  The date portion is
              returned as the integer part of the number (as julian day)
              and the time portion is represent as fractional of a day.
              (This number is useful for adding times to dates)
 Parameters:-
    <year> <month> <day> <hour> <minute> <second>
   or
    <datetime>
========================================================================== -->
	<xsl:template name="date-time-to-float">
		<xsl:param name="year"/>
		<xsl:param name="month"/>
		<xsl:param name="day"/>
		<xsl:param name="hour"/>
		<xsl:param name="minute"/>
		<xsl:param name="second"/>
		<!-- or -->
		<xsl:param name="datetime" select="''"/>
		<!-- format: yyyymmddThhmmss or yyyy-mm-ddThh:mm:ss -->
		<!-- trim down date and pad with midnight -->
		<xsl:variable name="tdatetime" select="concat(translate($datetime,'-T:',''),'000000')"/>
		<!-- decide which params were passed -->
		<xsl:variable name="yyyy">
			<xsl:choose>
				<xsl:when test="string-length($datetime) &gt; 0">
					<xsl:value-of select="substring($tdatetime,1,4)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$year"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="mm">
			<xsl:choose>
				<xsl:when test="string-length($datetime) &gt; 0">
					<xsl:value-of select="substring($tdatetime,5,2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$month"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="dd">
			<xsl:choose>
				<xsl:when test="string-length($datetime) &gt; 0">
					<xsl:value-of select="substring($tdatetime,7,2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$day"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="hh">
			<xsl:choose>
				<xsl:when test="string-length($datetime) &gt; 0">
					<xsl:value-of select="substring($tdatetime,9,2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$hour"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="nn">
			<xsl:choose>
				<xsl:when test="string-length($datetime) &gt; 0">
					<xsl:value-of select="substring($tdatetime,11,2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$minute"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="ss">
			<xsl:choose>
				<xsl:when test="string-length($datetime) &gt; 0">
					<xsl:value-of select="substring($tdatetime,13,2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$second"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!-- calculate integer part (date) as julian day -->
		<xsl:variable name="jd">
			<xsl:call-template name="date-to-julian-day">
				<xsl:with-param name="year" select="$yyyy"/>
				<xsl:with-param name="month" select="$mm"/>
				<xsl:with-param name="day" select="$dd"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="number($jd) + ($hh * (1 div 24)) + ($nn * (1 div 1440)) + ($ss * (1 div 86400))"/>
	</xsl:template>
	<!--
==========================================================================
    Template: time-to-float
 Description: Convert a time to a floating point.  The time is returned
              as a fractional part of a day (e.g. 12 noon = 0.5).
              This is useful for adding specified hour differentials
              (such as time zones) to floating point representations of
              date/times.
 Parameters:-
    <hour> <minute> <second>
   or
    <time>
========================================================================== -->
	<xsl:template name="time-to-float">
		<xsl:param name="hour"/>
		<xsl:param name="minute"/>
		<xsl:param name="second"/>
		<!-- or -->
		<xsl:param name="time" select="''"/>
		<!-- format: hhmmss or hh:mm:ss -->
		<!-- trim down time by removing ':' chars -->
		<xsl:variable name="ttime" select="translate($time,':','')"/>
		<!-- decide which params were passed -->
		<xsl:variable name="hh">
			<xsl:choose>
				<xsl:when test="string-length($time) &gt; 0">
					<xsl:value-of select="substring($ttime,1,2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$hour"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="nn">
			<xsl:choose>
				<xsl:when test="string-length($time) &gt; 0">
					<xsl:value-of select="concat('0',substring($ttime,3,2))"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat('0',$minute)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="ss">
			<xsl:choose>
				<xsl:when test="string-length($time) &gt; 0">
					<xsl:value-of select="concat('0',substring($ttime,5,2))"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat('0',$second)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!-- final resultant -->
		<xsl:value-of select="($hh * (1 div 24)) + ($nn * (1 div 1440)) + ($ss * (1 div 86400))"/>
	</xsl:template>
	<!-- 
==========================================================================
    Template: float-to-date-time
 Description: Convert a floating point value representing a date/time to
              a date/time string.
 Parameters:-
    <value>  the value to be converted
    <round-seconds>  if true then the seconds are not quoted on the output
                     and, if the seconds are 59 then hour/minute is rounded
                     (this is useful because some processors have limited
                      floating point precision to cope with the seconds)
========================================================================== -->
	<xsl:template name="float-to-date-time">
		<xsl:param name="value" select="number(0)"/>
		<xsl:param name="round-seconds" select="false()"/>
		<xsl:variable name="date">
			<xsl:call-template name="julian-day-to-date">
				<xsl:with-param name="julian-day" select="floor($value)"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="t1" select="$value - floor($value)"/>
		<xsl:variable name="h" select="floor($t1 div (1 div 24))"/>
		<xsl:variable name="t2" select="$t1 - ($h * (1 div 24))"/>
		<xsl:variable name="m" select="floor($t2 div (1 div 1440))"/>
		<xsl:variable name="t3" select="$t2 - ($m * (1 div 1440))"/>
		<xsl:choose>
			<xsl:when test="$round-seconds">
				<xsl:variable name="s" select="$t3 div (1 div 86400)"/>
				<xsl:variable name="h2">
					<xsl:choose>
						<xsl:when test="($s &gt;= 59) and ($m = 59)">
							<xsl:value-of select="$h + 1"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$h"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="m2">
					<xsl:choose>
						<xsl:when test="($s &gt;= 59) and ($m = 59)">0</xsl:when>
						<xsl:when test="($s &gt;= 59)">
							<xsl:value-of select="$m + 1"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$m"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<!-- pad final time result -->
				<xsl:variable name="hh" select="concat(substring('00',1,2 - string-length(string($h2))),string($h2))"/>
				<xsl:variable name="mm" select="concat(substring('00',1,2 - string-length(string($m2))),string($m2))"/>
				<!-- final output resultant -->
				<xsl:value-of select="concat($date,'T',$hh,':',$mm)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="s" select="floor($t3 div (1 div 86400))"/>
				<!-- pad final time result -->
				<xsl:variable name="hh" select="concat(substring('00',1,2 - string-length(string($h))),string($h))"/>
				<xsl:variable name="mm" select="concat(substring('00',1,2 - string-length(string($m))),string($m))"/>
				<xsl:variable name="ss" select="concat(substring('00',1,2 - string-length(string($s))),string($s))"/>
				<!-- final output resultant -->
				<xsl:value-of select="concat($date,'T',$hh,':',$mm,':',$ss)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--
==========================================================================
    Template: week-number
 Description: Calculates the week number of a date.
              Week numbers are calculated according to ISO8601 - where week
              number 1 is the week that contains the 4th Jan.
              A week, according to ISO8601, starts on a Monday.
 Parameters:-
    <year> <month> <day>
   or
    <date>
   or
    <julian-day>
========================================================================== -->
	<xsl:template name="week-number">
		<xsl:param name="year"/>
		<xsl:param name="month"/>
		<xsl:param name="day"/>
		<!-- or -->
		<xsl:param name="date" select="''"/>
		<!-- format: yyyymmdd or yyyy-mm-dd -->
		<!-- or -->
		<xsl:param name="julian-day" select="''"/>
		<!-- trim down date -->
		<xsl:variable name="tdate" select="translate($date,'-','')"/>
		<!-- decide which params were passed -->
		<xsl:variable name="yyyy">
			<xsl:choose>
				<xsl:when test="string-length($date) &gt; 0">
					<xsl:value-of select="substring($tdate,1,4)"/>
				</xsl:when>
				<xsl:when test="string-length($julian-day) &gt; 0">
					<xsl:variable name="jdate">
						<xsl:call-template name="julian-day-to-date">
							<xsl:with-param name="julian-day" select="$julian-day"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:value-of select="substring($jdate,1,4)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$year"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!-- get the julian day number -->
		<xsl:variable name="jd">
			<xsl:choose>
				<xsl:when test="string-length($julian-day) &gt; 0">
					<xsl:value-of select="$julian-day"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="date-to-julian-day">
						<xsl:with-param name="year" select="$year"/>
						<xsl:with-param name="month" select="$month"/>
						<xsl:with-param name="day" select="$day"/>
						<xsl:with-param name="date" select="$date"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!-- get the julian day number for the first working day of next year -->
		<xsl:variable name="fyjd">
			<xsl:call-template name="first-day-of-year">
				<xsl:with-param name="year" select="$yyyy+1"/>
				<xsl:with-param name="as-julian-day" select="true()"/>
			</xsl:call-template>
		</xsl:variable>
		<!-- decide which the 'working' year for this date is -->
		<xsl:variable name="start-jd">
			<xsl:choose>
				<xsl:when test="$jd &gt;= $fyjd">
					<xsl:value-of select="$fyjd"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="date-to-julian-day">
						<xsl:with-param name="date">
							<xsl:call-template name="first-day-of-year">
								<xsl:with-param name="year" select="$yyyy"/>
							</xsl:call-template>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!-- final calc output -->
		<xsl:value-of select="floor(($jd - $start-jd) div 7) + 1"/>
	</xsl:template>
	<!--
==========================================================================
    Template: week-number-to-date
 Description: Calculates the date of the Monday of the given week number in
              the specified year.
              Week numbers are calculated according to ISO8601 - where week
              number 1 is the week that contains the 4th Jan.
              A week, according to ISO8601, starts on a Monday.
 Parameters:-
    <week> <year>
    [<as-julian-day>]
========================================================================== -->
	<xsl:template name="week-number-to-date">
		<xsl:param name="week" select="number(1)"/>
		<xsl:param name="year" select="number(1)"/>
		<!-- return date as julian day -->
		<xsl:param name="as-julian-day" select="false()"/>
		<!-- calc first working day of year -->
		<xsl:variable name="fwdy">
			<xsl:call-template name="first-day-of-year">
				<xsl:with-param name="year" select="$year"/>
				<xsl:with-param name="as-julian-day" select="true()"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="wntd" select="$fwdy + (($week - 1) * 7)"/>
		<xsl:choose>
			<xsl:when test="$as-julian-day">
				<xsl:value-of select="$wntd"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="julian-day-to-date">
					<xsl:with-param name="julian-day" select="$wntd"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--
==========================================================================
    Template: working-year
 Description: Calculates the working year of a given date.
              A date may actually appear as a working day of the previous
              year - as specified by the week calculations according to
              ISO8601 (where week number 1 begins the week containing the
              4th Jan).
 Parameters:-
    <year> <month> <day>
   or
    <date>
   or
    <julian-day>
========================================================================== -->
	<xsl:template name="working-year">
		<xsl:param name="year"/>
		<xsl:param name="month"/>
		<xsl:param name="day"/>
		<!-- or -->
		<xsl:param name="date" select="''"/>
		<!-- format: yyyymmdd or yyyy-mm-dd -->
		<!-- or -->
		<xsl:param name="julian-day" select="''"/>
		<!-- trim down date -->
		<xsl:variable name="tdate" select="translate($date,'-','')"/>
		<!-- decide which params were passed -->
		<xsl:variable name="yyyy">
			<xsl:choose>
				<xsl:when test="string-length($date) &gt; 0">
					<xsl:value-of select="substring($tdate,1,4)"/>
				</xsl:when>
				<xsl:when test="string-length($julian-day) &gt; 0">
					<xsl:variable name="jdate">
						<xsl:call-template name="julian-day-to-date">
							<xsl:with-param name="julian-day" select="$julian-day"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:value-of select="substring($jdate,1,4)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$year"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!-- get the julian day number -->
		<xsl:variable name="jd">
			<xsl:choose>
				<xsl:when test="string-length($julian-day) &gt; 0">
					<xsl:value-of select="$julian-day"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="date-to-julian-day">
						<xsl:with-param name="year" select="$year"/>
						<xsl:with-param name="month" select="$month"/>
						<xsl:with-param name="day" select="$day"/>
						<xsl:with-param name="date" select="$date"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!-- get the julian day number for the first working day of next year -->
		<xsl:variable name="fyjd">
			<xsl:call-template name="first-day-of-year">
				<xsl:with-param name="year" select="$yyyy+1"/>
				<xsl:with-param name="as-julian-day" select="true()"/>
			</xsl:call-template>
		</xsl:variable>
		<!-- decide which the 'working' year for this date is -->
		<xsl:choose>
			<xsl:when test="$jd &gt;= $fyjd">
				<xsl:value-of select="$yyyy+1"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$yyyy"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--
==========================================================================
    Template: weeks-in-year
 Description: Calculates the number of weeks in a year according to the
              ISO8601 standard for weeks.
 Parameters:-
    <year>
========================================================================== -->
	<xsl:template name="weeks-in-year">
		<xsl:param name="year" select="number(0)"/>
		<xsl:variable name="syear" select="concat(substring('0000',1,4 - string-length($year)),$year)"/>
		<!-- last week in year is always the week that contains 28th December -->
		<xsl:call-template name="week-number">
			<xsl:with-param name="date" select="concat($syear,'1228')"/>
		</xsl:call-template>
	</xsl:template>
	<!--
==========================================================================
    Template: first-day-of-year
 Description: Calculates the first working day of the year (Monday)
              according to ISO8601 where week 1 of a year is the week that
              contains the 4th Jan.
 Parameters:-
    <year>
    [<as-julian-day>]
========================================================================== -->
	<xsl:template name="first-day-of-year">
		<xsl:param name="year"/>
		<xsl:param name="as-julian-day" select="false()"/>
		<xsl:variable name="syear" select="concat(substring('0000',1,4 - string-length($year)),$year)"/>
		<!-- week 1 is the week containing 4th Jan -->
		<xsl:variable name="jan4-jd">
			<xsl:call-template name="date-to-julian-day">
				<xsl:with-param name="date" select="concat($syear,'0104')"/>
			</xsl:call-template>
		</xsl:variable>
		<!-- get the week day for the 4th Jan -->
		<xsl:variable name="jan4-wd">
			<xsl:call-template name="day-of-week">
				<xsl:with-param name="date" select="concat($syear,'0104')"/>
			</xsl:call-template>
		</xsl:variable>
		<!-- first day is the prev monday -->
		<xsl:choose>
			<xsl:when test="$as-julian-day">
				<xsl:value-of select="$jan4-jd - ($jan4-wd - 1)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="julian-day-to-date">
					<xsl:with-param name="julian-day" select="$jan4-jd - ($jan4-wd - 1)"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--
==========================================================================
    Template: day-of-week
 Description: Calculates the day of the week for a date - where the first
              day of the week is Monday (1) and the last day of the week is
              is Sunday (7) - according to ISO8601.
 Parameters:-
    <year> <month> <day>
   or
    <date>
   or
    <julian-day>
========================================================================== -->
	<xsl:template name="day-of-week">
		<xsl:param name="year"/>
		<xsl:param name="month"/>
		<xsl:param name="day"/>
		<!-- or -->
		<xsl:param name="date" select="''"/>
		<!-- format: yyyymmdd or yyyy-mm-dd -->
		<!-- or -->
		<xsl:param name="julian-day" select="''"/>
		<!-- get julian day -->
		<xsl:variable name="jd">
			<xsl:choose>
				<xsl:when test="string-length($julian-day) &gt; 0">
					<xsl:value-of select="$julian-day"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="date-to-julian-day">
						<xsl:with-param name="year" select="$year"/>
						<xsl:with-param name="month" select="$month"/>
						<xsl:with-param name="day" select="$day"/>
						<xsl:with-param name="date" select="$date"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!-- pre-calcs -->
		<xsl:variable name="dw0" select="$jd mod 10227"/>
		<xsl:value-of select="($dw0 mod 7) + 1"/>
	</xsl:template>
	<!--
==========================================================================
    Template: named-day-of-week
 Description: Calculates the day of the week for a date - where the first
              day of the week is Monday (1) and the last day of the week is
              is Sunday (7) - according to ISO8601.
              The day of week is returned as its name.
 Parameters:-
    <year> <month> <day>
   or
    <date>
   or
    <julian-day>
   optional override parameter:-
   [<week-day-names>]
========================================================================== -->
	<xsl:template name="named-day-of-week">
		<xsl:param name="year"/>
		<xsl:param name="month"/>
		<xsl:param name="day"/>
		<!-- or -->
		<xsl:param name="date" select="''"/>
		<!-- format: yyyymmdd or yyyy-mm-dd -->
		<!-- or -->
		<xsl:param name="julian-day" select="''"/>
		<!-- override week day names parameter -->
		<xsl:param name="week-day-names" select="$default-week-day-names"/>
		<!-- get numeric day of week -->
		<xsl:variable name="dwn">
			<xsl:text>[</xsl:text>
			<xsl:call-template name="day-of-week">
				<xsl:with-param name="year" select="$year"/>
				<xsl:with-param name="month" select="$month"/>
				<xsl:with-param name="day" select="$day"/>
				<xsl:with-param name="date" select="$date"/>
				<xsl:with-param name="julian-day" select="$julian-day"/>
			</xsl:call-template>
			<xsl:text>]</xsl:text>
		</xsl:variable>
		<xsl:value-of select="substring-before(substring($week-day-names,string-length(substring-before($week-day-names,$dwn)) + 4),'[')"/>
	</xsl:template>
	<!--
==========================================================================
    Template: format-date-time
 Description: Formats a given date/time according to a format string.
 Parameters:-
   <format-string>

    <year> <month> <day> <hour> <minute> <second>
   or
    <datetime>
   or
    <julian-day>
   optional override parameters:-
   [<week-day-names>]
   [<month-names>]
   [<am-pm-names>]

 Format string tokens:-
   yyyy    : Year (4-digit)
   yy      : Year (2-digit)
   mmmm    : Month name (full)
   mmm     : Month name (abbreviated to 3 chars)
   mm      : Month (padded with zero to two digits)
   m       : Month (1 ro 2 digits)
   dd      : Day (padded with zero to teo digits)
   d       : Day (1 or 2 digits)
   th      : nth day modifier (e.g. st, nd, rd, th)
   dowwww  : Day of week (full - e.g Monday, Tuesday etc.)
   dowww   : Day of week (abbreviated to 3 chars - e.g. Mon, Tue etc.)
   dow     : Day of week (numeric: 1=Monday)
   wyyyy   : Working year (4-digit)
   wyy     : Working year (2-digit)
   wnn     : Week number (padded with zero to two digits)
   wn      : Week number (1 or 2 digits)
   hm      : Hour (reduced to 12-hour clock - 1 or 2 digits)
   hh      : Hour (24-hour clock - padded with zero to two digits)
   h       : Hour (1 or 2 digits)
   nn      : Minute (padded with zero to two digits)
   n       : Minute (1 or 2 digits)
   ss      : Second (padded with zero to two digits)
   s       : Second (1 or 2 digits)
   apm     : am/pm marker
   'x...x' : Literal string
   "x...x" : Literal string
========================================================================== -->
	<xsl:template name="format-date-time">
		<!-- required format -->
		<xsl:param name="format-string">yyyy-mm-dd&apos;T&apos;hh:nn:ss</xsl:param>
		<!-- passed date/time -->
		<xsl:param name="year"/>
		<xsl:param name="month"/>
		<xsl:param name="day"/>
		<xsl:param name="hour"/>
		<xsl:param name="minute"/>
		<xsl:param name="second"/>
		<!-- or -->
		<xsl:param name="datetime" select="''"/>
		<!-- format: yyyymmddThhmmss or yyyy-mm-ddThh:mm:ss -->
		<!-- or -->
		<xsl:param name="julian-day" select="''"/>
		<!-- this can be float type to include times -->
		<!-- default week day, month and am/pm names overrides -->
		<xsl:param name="week-day-names" select="$default-week-day-names"/>
		<xsl:param name="month-names" select="$default-month-names"/>
		<xsl:param name="am-pm-names" select="$default-am-pm-names"/>
		<!-- convert date passed to common format -->
		<xsl:variable name="use-datetime">
			<xsl:choose>
				<xsl:when test="string-length($datetime) &gt; 0">
					<xsl:variable name="tdate" select="translate($datetime,'-:T','')"/>
					<xsl:value-of select="concat($tdate,substring('00000000000000',1,14 - string-length($tdate)))"/>
				</xsl:when>
				<xsl:when test="string-length($julian-day) &gt; 0">
					<xsl:variable name="tdate">
						<xsl:call-template name="float-to-date-time">
							<xsl:with-param name="value" select="$julian-day"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:value-of select="translate($tdate,'-:T','')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat(substring('0000',1,4 - string-length($year)),$year)"/>
					<xsl:value-of select="concat(substring('00',1,2 - string-length($month)),$month)"/>
					<xsl:value-of select="concat(substring('00',1,2 - string-length($day)),$day)"/>
					<xsl:value-of select="concat(substring('00',1,2 - string-length($hour)),$hour)"/>
					<xsl:value-of select="concat(substring('00',1,2 - string-length($minute)),$minute)"/>
					<xsl:value-of select="concat(substring('00',1,2 - string-length($second)),$second)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:call-template name="format-date-time-tokenizer">
			<xsl:with-param name="fmt" select="$format-string"/>
			<xsl:with-param name="datetime" select="$use-datetime"/>
			<xsl:with-param name="week-day-names" select="$week-day-names"/>
			<xsl:with-param name="month-names" select="$month-names"/>
			<xsl:with-param name="am-pm-names" select="$am-pm-names"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="format-date-time-tokenizer">
		<xsl:param name="fmt">yyyy-mm-dd&apos;T&apos;hh:nn:ss</xsl:param>
		<xsl:param name="datetime"/>
		<xsl:param name="week-day-names" select="$default-week-day-names"/>
		<xsl:param name="month-names" select="$default-month-names"/>
		<xsl:param name="am-pm-names" select="$default-am-pm-names"/>
		<xsl:if test="string-length($fmt) &gt; 0">
			<xsl:variable name="token">
				<xsl:choose>
					<xsl:when test="substring($fmt,1,4) = 'yyyy'">
						<xsl:text>yyyy</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,2) = 'yy'">
						<xsl:text>yy</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,4) = 'mmmm'">
						<xsl:text>mmmm</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,3) = 'mmm'">
						<xsl:text>mmm</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,2) = 'mm'">
						<xsl:text>mm</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,1) = 'm'">
						<xsl:text>m</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,2) = 'th'">
						<xsl:text>th</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,6) = 'dowwww'">
						<xsl:text>dowwww</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,5) = 'dowww'">
						<xsl:text>dowww</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,3) = 'dow'">
						<xsl:text>dow</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,2) = 'dd'">
						<xsl:text>dd</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,1) = 'd'">
						<xsl:text>d</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,5) = 'wyyyy'">
						<xsl:text>wyyyy</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,3) = 'wyy'">
						<xsl:text>wyy</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,3) = 'wnn'">
						<xsl:text>wnn</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,2) = 'wn'">
						<xsl:text>wn</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,2) = 'hm'">
						<xsl:text>hm</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,2) = 'hh'">
						<xsl:text>hh</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,1) = 'h'">
						<xsl:text>h</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,2) = 'nn'">
						<xsl:text>nn</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,1) = 'n'">
						<xsl:text>n</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,2) = 'ss'">
						<xsl:text>ss</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,1) = 's'">
						<xsl:text>s</xsl:text>
					</xsl:when>
					<xsl:when test="substring($fmt,1,3) = 'apm'">
						<xsl:text>apm</xsl:text>
					</xsl:when>
					<xsl:when test='string-length(translate(substring($fmt,1,1),"&apos;","")) = 0'>
						<xsl:variable name="rn" select='string-length(substring-before(substring($fmt,2),"&apos;"))'/>
						<xsl:value-of select="substring($fmt,1,$rn+2)"/>
					</xsl:when>
					<xsl:when test="string-length(translate(substring($fmt,1,1),'&quot;','')) = 0">
						<xsl:variable name="rn" select="string-length(substring-before(substring($fmt,2),'&quot;'))"/>
						<xsl:value-of select="substring($fmt,1,$rn+2)"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="substring($fmt,1,1)"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<!-- handle the token -->
			<xsl:call-template name="format-date-time-tokens">
				<xsl:with-param name="token" select="$token"/>
				<xsl:with-param name="datetime" select="$datetime"/>
				<xsl:with-param name="week-day-names" select="$week-day-names"/>
				<xsl:with-param name="month-names" select="$month-names"/>
				<xsl:with-param name="am-pm-names" select="$am-pm-names"/>
			</xsl:call-template>
			<!-- recurse into self to handle rest of format string -->
			<xsl:call-template name="format-date-time-tokenizer">
				<xsl:with-param name="fmt" select="substring($fmt,string-length($token) + 1)"/>
				<xsl:with-param name="datetime" select="$datetime"/>
				<xsl:with-param name="week-day-names" select="$week-day-names"/>
				<xsl:with-param name="month-names" select="$month-names"/>
				<xsl:with-param name="am-pm-names" select="$am-pm-names"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="format-date-time-tokens">
		<xsl:param name="token"/>
		<xsl:param name="datetime"/>
		<xsl:param name="week-day-names"/>
		<xsl:param name="month-names"/>
		<xsl:param name="am-pm-names"/>
		<xsl:choose>
			<xsl:when test="$token = 'yyyy'">
				<xsl:value-of select="substring($datetime,1,4)"/>
			</xsl:when>
			<xsl:when test="$token = 'yy'">
				<xsl:value-of select="substring($datetime,3,2)"/>
			</xsl:when>
			<xsl:when test="$token = 'mmmm'">
				<xsl:variable name="mn" select="concat('[',substring($datetime,5,2),']')"/>
				<xsl:value-of select="substring-before(substring($month-names,string-length(substring-before($month-names,$mn)) + 5),'[')"/>
			</xsl:when>
			<xsl:when test="$token = 'mmm'">
				<xsl:variable name="mn" select="concat('[',substring($datetime,5,2),']')"/>
				<xsl:value-of select="substring(substring-before(substring($month-names,string-length(substring-before($month-names,$mn)) + 5),'['),1,3)"/>
			</xsl:when>
			<xsl:when test="$token = 'mm'">
				<xsl:value-of select="substring($datetime,5,2)"/>
			</xsl:when>
			<xsl:when test="$token = 'm'">
				<xsl:value-of select="number(substring($datetime,5,2))"/>
			</xsl:when>
			<xsl:when test="$token = 'th'">
				<xsl:choose>
					<xsl:when test="substring($datetime,8,1) = '0' or substring($datetime,7,1) = '1'">
						<xsl:text>th</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="substring($datetime,8,1) = '1'">
								<xsl:text>st</xsl:text>
							</xsl:when>
							<xsl:when test="substring($datetime,8,1) = '2'">
								<xsl:text>nd</xsl:text>
							</xsl:when>
							<xsl:when test="substring($datetime,8,1) = '3'">
								<xsl:text>rd</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>th</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$token = 'dd'">
				<xsl:value-of select="substring($datetime,7,2)"/>
			</xsl:when>
			<xsl:when test="$token = 'd'">
				<xsl:value-of select="number(substring($datetime,7,2))"/>
			</xsl:when>
			<xsl:when test="$token = 'dowwww'">
				<xsl:call-template name="named-day-of-week">
					<xsl:with-param name="date" select="substring($datetime,1,8)"/>
					<xsl:with-param name="week-day-names" select="$week-day-names"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$token = 'dowww'">
				<xsl:variable name="dow">
					<xsl:call-template name="named-day-of-week">
						<xsl:with-param name="date" select="substring($datetime,1,8)"/>
						<xsl:with-param name="week-day-names" select="$week-day-names"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="substring($dow,1,3)"/>
			</xsl:when>
			<xsl:when test="$token = 'dow'">
				<xsl:call-template name="day-of-week">
					<xsl:with-param name="date" select="substring($datetime,1,8)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$token = 'wyyyy'">
				<xsl:call-template name="working-year">
					<xsl:with-param name="date" select="substring($datetime,1,8)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$token = 'wyy'">
				<xsl:variable name="wyy">
					<xsl:call-template name="working-year">
						<xsl:with-param name="date" select="substring($datetime,1,8)"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="substring($wyy,3,2)"/>
			</xsl:when>
			<xsl:when test="$token = 'wnn'">
				<xsl:variable name="wn">
					<xsl:call-template name="week-number">
						<xsl:with-param name="date" select="substring($datetime,1,8)"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="concat(substring('00',1,2 - string-length($wn)),$wn)"/>
			</xsl:when>
			<xsl:when test="$token = 'wn'">
				<xsl:call-template name="week-number">
					<xsl:with-param name="date" select="substring($datetime,1,8)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$token = 'hm'">
				<xsl:variable name="hm" select="number(substring($datetime,9,2))"/>
				<xsl:choose>
					<xsl:when test="$hm &gt; 12">
						<xsl:value-of select="$hm - 12"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$hm"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$token = 'hh'">
				<xsl:value-of select="substring($datetime,9,2)"/>
			</xsl:when>
			<xsl:when test="$token = 'h'">
				<xsl:value-of select="number(substring($datetime,9,2))"/>
			</xsl:when>
			<xsl:when test="$token = 'nn'">
				<xsl:value-of select="substring($datetime,11,2)"/>
			</xsl:when>
			<xsl:when test="$token = 'n'">
				<xsl:value-of select="number(substring($datetime,11,2))"/>
			</xsl:when>
			<xsl:when test="$token = 'ss'">
				<xsl:value-of select="substring($datetime,13,2)"/>
			</xsl:when>
			<xsl:when test="$token = 's'">
				<xsl:value-of select="number(substring($datetime,13,2))"/>
			</xsl:when>
			<xsl:when test="$token = 'apm'">
				<xsl:variable name="apm" select="concat('[',number(substring($datetime,9,2)) mod 12,']')"/>
				<xsl:value-of select="substring-before(substring($am-pm-names,string-length(substring-before($am-pm-names,$apm)) + 4),'[')"/>
			</xsl:when>
			<xsl:when test='string-length(translate(substring($token,1,1),"&apos;","")) = 0'>
				<xsl:value-of select="substring($token,2,string-length($token) - 2)"/>
			</xsl:when>
			<xsl:when test="string-length(translate(substring($token,1,1),'&quot;','')) = 0">
				<xsl:value-of select="substring($token,2,string-length($token) - 2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$token"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--
==========================================================================
    Template: local-to-UTC
 Description: Converts a local date/time (in the format yyyymmddThhmmssZ+-hhmm
              or yyyy-mm-ddThh:mm:ssZ+-hh:mm) to a UTC date/time.
 Parameters:-
   <datetime> the local date/time to be converted.
-->
	<xsl:template name="local-to-UTC">
		<xsl:param name="datetime"/>
		<!-- get the time zone offset part of the date/time -->
		<xsl:variable name="local-offset">
			<xsl:choose>
				<xsl:when test="contains($datetime,'Z')">
					<!-- get the local offset portion (and strip out '+' and ':' chars) -->
					<xsl:variable name="offset-portion" select="translate(substring-after($datetime,'Z'),'+:','')"/>
					<xsl:choose>
						<xsl:when test="string-length($offset-portion) = 0">0</xsl:when>
						<xsl:otherwise>
							<!-- convert hours/mins to a numeric value -->
							<xsl:variable name="offset-val">
								<xsl:call-template name="time-to-float">
									<xsl:with-param name="time" select="translate($offset-portion,'-','')"/>
								</xsl:call-template>
							</xsl:variable>
							<!-- adjust value + or - -->
							<xsl:choose>
								<xsl:when test="substring($offset-portion,1,1) = '-'">
									<xsl:value-of select="$offset-val"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="0 - $offset-val"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$local-offset != 0">
				<xsl:variable name="dt2" select="translate(substring-before($datetime,'Z'),'-T:','')"/>
				<xsl:variable name="date-value">
					<xsl:call-template name="date-time-to-float">
						<xsl:with-param name="datetime" select="$dt2"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="output-datetime">
					<xsl:call-template name="float-to-date-time">
						<xsl:with-param name="value" select="$date-value + $local-offset"/>
						<xsl:with-param name="round-seconds" select="true()"/>
					</xsl:call-template>
				</xsl:variable>
				<!-- if seconds specified on the original time then add these back on -->
				<xsl:choose>
					<xsl:when test="string-length($dt2) &gt; 12">
						<xsl:value-of select="concat($output-datetime,':',substring($dt2,13,2))"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$output-datetime"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat($datetime,'Z')"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--
==========================================================================
    Template: UTC-to-local
 Description: Converts a UTC date/time (in the format yyyymmddThhmmss
              or yyyy-mm-ddThh:mm:ss) to a local date/time.
 Parameters:-
   <datetime>     the UTC date/time to be converted.
   <local-offset> the local time offset (in the format +hh:mm or
                  -hh:mm)
-->
	<xsl:template name="UTC-to-local">
		<xsl:param name="datetime"/>
		<xsl:param name="local-offset" select="'0000'"/>
		<xsl:variable name="raw-offset" select="concat(substring('0000',1,4 - string-length(translate($local-offset,'+-:',''))),translate($local-offset,'+-:',''))"/>
		<!-- calc the offset as a value -->
		<xsl:variable name="offset">
			<xsl:choose>
				<xsl:when test="$raw-offset = '0000'">0</xsl:when>
				<xsl:otherwise>
					<!-- convert hours/mins to a numeric value -->
					<xsl:variable name="offset-val">
						<xsl:call-template name="time-to-float">
							<xsl:with-param name="time" select="$raw-offset"/>
						</xsl:call-template>
					</xsl:variable>
					<!-- adjust value + or - -->
					<xsl:choose>
						<xsl:when test="contains($local-offset,'-')">
							<xsl:value-of select="0 - $offset-val"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$offset-val"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$offset != 0">
				<xsl:variable name="dt2" select="translate($datetime,'-T:','')"/>
				<xsl:variable name="date-value">
					<xsl:call-template name="date-time-to-float">
						<xsl:with-param name="datetime" select="$dt2"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="output-datetime">
					<xsl:call-template name="float-to-date-time">
						<xsl:with-param name="value" select="$date-value + $offset"/>
						<xsl:with-param name="round-seconds" select="true()"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="plusminus">
					<xsl:choose>
						<xsl:when test="contains($local-offset,'-')">-</xsl:when>
						<xsl:otherwise>+</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<!-- if seconds specified on the original time then add these back on -->
				<xsl:choose>
					<xsl:when test="string-length($dt2) &gt; 12">
						<xsl:value-of select="concat($output-datetime,':',substring($dt2,13,2),'Z',$plusminus,substring($raw-offset,1,2),':',substring($raw-offset,3,2))"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($output-datetime,'Z',$plusminus,substring($raw-offset,1,2),':',substring($raw-offset,3,2))"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat($datetime,'Z')"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--
==========================================================================
    Template: local-to-local
 Description: Converts one local date/time (in the format yyyymmddThhmmssZ+-hhmm
              or yyyy-mm-ddThh:mm:ssZ+-hh:mm) to another local date/time based
              upon a given new local time offset.
 Parameters:-
   <datetime>     the local date/time to be converted.
   <local-offset> the new local time offset (in the format +hh:mm or
                  -hh:mm)
-->
	<xsl:template name="local-to-local">
		<xsl:param name="datetime"/>
		<xsl:param name="local-offset" select="'0000'"/>
		<!-- get the time zone offset part of the date/time -->
		<xsl:variable name="offset">
			<xsl:choose>
				<xsl:when test="contains($datetime,'Z')">
					<!-- get the local offset portion (and strip out '+' and ':' chars) -->
					<xsl:variable name="offset-portion" select="translate(substring-after($datetime,'Z'),'+:','')"/>
					<xsl:choose>
						<xsl:when test="string-length($offset-portion) = 0">0</xsl:when>
						<xsl:otherwise>
							<!-- convert hours/mins to a numeric value -->
							<xsl:variable name="offset-val">
								<xsl:call-template name="time-to-float">
									<xsl:with-param name="time" select="translate($offset-portion,'-','')"/>
								</xsl:call-template>
							</xsl:variable>
							<!-- adjust value + or - -->
							<xsl:choose>
								<xsl:when test="substring($offset-portion,1,1) = '-'">
									<xsl:value-of select="0 - $offset-val"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$offset-val"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!-- calc the new offset -->
		<xsl:variable name="raw-offset" select="concat(substring('0000',1,4 - string-length(translate($local-offset,'+-:',''))),translate($local-offset,'+-:',''))"/>
		<xsl:variable name="new-offset">
			<xsl:choose>
				<xsl:when test="$raw-offset = '0000'">0</xsl:when>
				<xsl:otherwise>
					<!-- convert hours/mins to a numeric value -->
					<xsl:variable name="offset-val">
						<xsl:call-template name="time-to-float">
							<xsl:with-param name="time" select="$raw-offset"/>
						</xsl:call-template>
					</xsl:variable>
					<!-- adjust value + or - -->
					<xsl:choose>
						<xsl:when test="contains($local-offset,'-')">
							<xsl:value-of select="0 - $offset-val"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$offset-val"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!-- perform the final time differential -->
		<xsl:choose>
			<xsl:when test="($offset != 0) and ($new-offset != 0)">
				<xsl:variable name="diff-offset" select="$new-offset - $offset"/>
				<xsl:variable name="dt2" select="translate(substring-before($datetime,'Z'),'-T:','')"/>
				<xsl:variable name="date-value">
					<xsl:call-template name="date-time-to-float">
						<xsl:with-param name="datetime" select="$dt2"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="output-datetime">
					<xsl:call-template name="float-to-date-time">
						<xsl:with-param name="value" select="$date-value + $diff-offset"/>
						<xsl:with-param name="round-seconds" select="true()"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="plusminus">
					<xsl:choose>
						<xsl:when test="contains($local-offset,'-')">-</xsl:when>
						<xsl:otherwise>+</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<!-- if seconds specified on the original time then add these back on -->
				<xsl:choose>
					<xsl:when test="string-length($dt2) &gt; 12">
						<xsl:value-of select="concat($output-datetime,':',substring($dt2,13,2),'Z',$plusminus,substring($raw-offset,1,2),':',substring($raw-offset,3,2))"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($output-datetime,'Z',$plusminus,substring($raw-offset,1,2),':',substring($raw-offset,3,2))"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat($datetime,'Z')"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="convert-unix-to-date-time">
		<xsl:param name="dtTmp"/>
		<xsl:variable name="dtJulian" select="($dtTmp div 86400)+2440588"/>
		<xsl:call-template name="float-to-date-time">
			<xsl:with-param name="value" select="$dtJulian"/>
			<!--			<xsl:with-param name="round-seconds" select="false()"/>-->
			<xsl:with-param name="round-seconds" select="true()"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="convert-date-time-to-unix">
		<xsl:param name="dtTmp"/>
		<xsl:variable name="dtFloat">
			<xsl:call-template name="date-time-to-float">
				<xsl:with-param name="datetime" select="$dtTmp"/>
			</xsl:call-template>
		</xsl:variable>
		<!-- TBD check math here -handling of remainder is uncertain -->
		<xsl:value-of select="round(($dtFloat - 2440588)*86400)"/>
	</xsl:template>
</xsl:stylesheet>
