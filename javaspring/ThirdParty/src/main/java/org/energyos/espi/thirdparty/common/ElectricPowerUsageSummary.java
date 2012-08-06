/*******************************************************************************
 * Copyright (c) 2011, 2012 EnergyOS.Org
 *
 * Licensed by EnergyOS.Org under one or more contributor license agreements.
 * See the NOTICE file distributed with this work for additional information
 * regarding copyright ownership.  The EnergyOS.org licenses this file
 * to you under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License.  You may obtain a copy
 * of the License at:
 *  
 *   http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 *  
 ******************************************************************************
*/


package org.energyos.espi.thirdparty.common;

import javax.persistence.ManyToOne;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * Summary of usage for a billing period
 * 
 * <p>Java class for ElectricPowerUsageSummary complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ElectricPowerUsageSummary">
 *   &lt;complexContent>
 *     &lt;extension base="{http://naesb.org/espi}IdentifiedObject">
 *       &lt;sequence>
 *         &lt;element name="billingPeriod" type="{http://naesb.org/espi}DateTimeInterval" minOccurs="0"/>
 *         &lt;element name="billLastPeriod" type="{http://naesb.org/espi}Int48" minOccurs="0"/>
 *         &lt;element name="billToDate" type="{http://naesb.org/espi}Int48" minOccurs="0"/>
 *         &lt;element name="costAdditionalLastPeriod" type="{http://naesb.org/espi}Int48" minOccurs="0"/>
 *         &lt;element name="currency" type="{http://naesb.org/espi}Currency" minOccurs="0"/>
 *         &lt;element name="currentBillingPeriodOverAllConsumption" type="{http://naesb.org/espi}SummaryMeasurement" minOccurs="0"/>
 *         &lt;element name="currentDayLastYearNetConsumption" type="{http://naesb.org/espi}SummaryMeasurement" minOccurs="0"/>
 *         &lt;element name="currentDayNetConsumption" type="{http://naesb.org/espi}SummaryMeasurement" minOccurs="0"/>
 *         &lt;element name="currentDayOverallConsumption" type="{http://naesb.org/espi}SummaryMeasurement" minOccurs="0"/>
 *         &lt;element name="peakDemand" type="{http://naesb.org/espi}SummaryMeasurement" minOccurs="0"/>
 *         &lt;element name="previousDayLastYearOverallConsumption" type="{http://naesb.org/espi}SummaryMeasurement" minOccurs="0"/>
 *         &lt;element name="previousDayNetConsumption" type="{http://naesb.org/espi}SummaryMeasurement" minOccurs="0"/>
 *         &lt;element name="previousDayOverallConsumption" type="{http://naesb.org/espi}SummaryMeasurement" minOccurs="0"/>
 *         &lt;element name="qualityOfReading" type="{http://naesb.org/espi}QualityOfReading" minOccurs="0"/>
 *         &lt;element name="ratchetDemand" type="{http://naesb.org/espi}SummaryMeasurement" minOccurs="0"/>
 *         &lt;element name="ratchetDemandPeriod" type="{http://naesb.org/espi}DateTimeInterval" minOccurs="0"/>
 *         &lt;element name="statusTimeStamp" type="{http://naesb.org/espi}TimeType"/>
 *       &lt;/sequence>
 *     &lt;/extension>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */

@XmlAccessorType(XmlAccessType.NONE)
@XmlType(name = "ElectricPowerUsageSummary", propOrder = {
    "billingPeriod",
    "billLastPeriod",
    "billToDate",
    "costAdditionalLastPeriod",
    "currency",
    "currentBillingPeriodOverAllConsumption",
    "currentDayLastYearNetConsumption",
    "currentDayNetConsumption",
    "currentDayOverallConsumption",
    "peakDemand",
    "previousDayLastYearOverallConsumption",
    "previousDayNetConsumption",
    "previousDayOverallConsumption",
    "qualityOfReading",
    "ratchetDemand",
    "ratchetDemandPeriod",
    "statusTimeStamp"
})

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class ElectricPowerUsageSummary extends IdentifiedObject {

    @ManyToOne
    @XmlElement
    private DateTimeInterval billingPeriod;

    @XmlElement
    private Long billLastPeriod;

    @XmlElement
    private Long billToDate;

    @XmlElement
    private Long costAdditionalLastPeriod;

    @ManyToOne
    @XmlElement
    private Currency currency;

    @ManyToOne
    @XmlElement
    private SummaryMeasurement currentBillingPeriodOverAllConsumption;

    @ManyToOne
    @XmlElement
    private SummaryMeasurement currentDayLastYearNetConsumption;

    @ManyToOne
    @XmlElement
    private SummaryMeasurement currentDayNetConsumption;

    @ManyToOne
    @XmlElement
    private SummaryMeasurement currentDayOverallConsumption;

    @ManyToOne
    @XmlElement
    private SummaryMeasurement peakDemand;

    @ManyToOne
    @XmlElement
    private SummaryMeasurement previousDayLastYearOverallConsumption;

    @ManyToOne
    @XmlElement
    private SummaryMeasurement previousDayNetConsumption;

    @ManyToOne
    @XmlElement
    private SummaryMeasurement previousDayOverallConsumption;

    @ManyToOne
    @XmlElement
    private QualityOfReading qualityOfReading;

    @ManyToOne
    @XmlElement
    private SummaryMeasurement ratchetDemand;

    @ManyToOne
    @XmlElement
    private DateTimeInterval ratchetDemandPeriod;

    @XmlElement
    private Long statusTimeStamp;
}
