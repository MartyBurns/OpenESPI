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
 * Quality of a specific reading value or interval reading value. Note that more than one Quality may be applicable to a given Reading. Typically not used unless problems or unusual conditions occur (i.e., quality for each Reading is assumed to be 'Good' (valid) unless stated otherwise in associated ReadingQuality).
 * 
 * <p>Java class for ReadingQuality complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ReadingQuality">
 *   &lt;complexContent>
 *     &lt;extension base="{http://naesb.org/espi}Object">
 *       &lt;sequence>
 *         &lt;element name="quality" type="{http://naesb.org/espi}QualityOfReading"/>
 *       &lt;/sequence>
 *     &lt;/extension>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */

@RooJavaBean
@RooToString
@RooJpaActiveRecord

@XmlAccessorType(XmlAccessType.NONE)
@XmlType(name = "ReadingQuality", propOrder = {
    "quality"
})

public class ReadingQuality {

    @ManyToOne
    @XmlElement(required = true)
    private QualityOfReading quality;
}
