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
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * A summary of power quality events. This information represents a summary of power quality information typically required by customer facility energy management systems. It is not intended to satisfy the detailed requirements of power quality monitoring. All values are as defined by measurementProtocol during the period. The standards typically also give ranges of allowed values; the information attributes are the raw measurements, not the "yes/no" determination by the various standards. See referenced standards for definition, measurement protocol and period.
 * 
 * <p>Java class for ElectricPowerQualitySummary complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ElectricPowerQualitySummary">
 *   &lt;complexContent>
 *     &lt;extension base="{http://naesb.org/espi}IdentifiedObject">
 *       &lt;sequence>
 *         &lt;element name="flickerPlt" type="{http://naesb.org/espi}Int48" minOccurs="0"/>
 *         &lt;element name="flickerPst" type="{http://naesb.org/espi}Int48" minOccurs="0"/>
 *         &lt;element name="harmonicVoltage" type="{http://naesb.org/espi}Int48" minOccurs="0"/>
 *         &lt;element name="longInterruptions" type="{http://naesb.org/espi}Int48" minOccurs="0"/>
 *         &lt;element name="mainsVoltage" type="{http://naesb.org/espi}Int48" minOccurs="0"/>
 *         &lt;element name="measurementProtocol" type="{http://naesb.org/espi}UInt8" minOccurs="0"/>
 *         &lt;element name="powerFrequency" type="{http://naesb.org/espi}Int48" minOccurs="0"/>
 *         &lt;element name="rapidVoltageChanges" type="{http://naesb.org/espi}Int48" minOccurs="0"/>
 *         &lt;element name="shortInterruptions" type="{http://naesb.org/espi}Int48" minOccurs="0"/>
 *         &lt;element name="summaryInterval" type="{http://naesb.org/espi}DateTimeInterval"/>
 *         &lt;element name="supplyVoltageDips" type="{http://naesb.org/espi}Int48" minOccurs="0"/>
 *         &lt;element name="supplyVoltageImbalance" type="{http://naesb.org/espi}Int48" minOccurs="0"/>
 *         &lt;element name="supplyVoltageVariations" type="{http://naesb.org/espi}Int48" minOccurs="0"/>
 *         &lt;element name="tempOvervoltage" type="{http://naesb.org/espi}Int48" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/extension>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */

@XmlAccessorType(XmlAccessType.NONE)
@XmlType(name = "ElectricPowerQualitySummary", propOrder = {
    "flickerPlt",
    "flickerPst",
    "harmonicVoltage",
    "longInterruptions",
    "mainsVoltage",
    "measurementProtocol",
    "powerFrequency",
    "rapidVoltageChanges",
    "shortInterruptions",
    "summaryInterval",
    "supplyVoltageDips",
    "supplyVoltageImbalance",
    "supplyVoltageVariations",
    "tempOvervoltage"
})

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class ElectricPowerQualitySummary extends IdentifiedObject {

    @XmlElement
    private Long flickerPlt;

    @XmlElement
    private Long flickerPst;

    @XmlElement
    private Long harmonicVoltage;

    @XmlElement
    private Long longInterruptions;

    @XmlElement
    private Long mainsVoltage;

    @XmlElement
    private Byte measurementProtocol;

    @XmlElement
    private Long powerFrequency;

    @XmlElement
    private Long rapidVoltageChanges;

    @XmlElement
    private Long shortInterruptions;

    @NotNull
    @ManyToOne
    @XmlElement(required = true)
    private DateTimeInterval summaryInterval;

    @XmlElement
    private Long supplyVoltageDips;

    @XmlElement
    private Long supplyVoltageImbalance;

    @XmlElement
    private Long supplyVoltageVariations;

    @XmlElement
    private Long tempOvervoltage;
}
